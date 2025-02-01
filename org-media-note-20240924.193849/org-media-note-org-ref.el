;;; org-media-note-org-ref.el --- Integrate org-media-note with org-ref -*- lexical-binding: t; -*-

;; Copyright (c) 2021 Yuchen Lea

;; Author: Yuchen Lea <yuchen.lea@gmail.com>
;; URL: https://github.com/yuchen-lea/org-media-note
;; Package-Requires: ((emacs "27.1") (org-ref "1.1.1"))


;;; Commentary:

;;; Code:
;;;; Requirements
(require 'seq)
(require 'org-ref)

(require 'org-media-note-core)

;;;; Customization
(defcustom org-media-note-cite-bibliography bibtex-files
  "List of BibTeX files that are searched for entry keys."
  :type '(repeat (choice (const :tag "bibtex-file-path" bibtex-file-path)
                         directory file)))
;;;; Commands
;;;;; Help echo
(defun org-media-note-help-echo (_window _object position)
  "Return help-echo for ref link at POSITION."
  (save-excursion
    (goto-char position)
    (let ((s (org-media-note-media-cite-link-message)))
      (with-temp-buffer
        (insert s)
        (fill-paragraph)
        (buffer-string)))))

(defun org-media-note-media-cite-link-message ()
  "Print a minibuffer message about the link that point is on."
  (interactive)
  ;; the way links are recognized in org-element-context counts blank spaces
  ;; after a link and the closing brackets in literal links. We don't try to get
  ;; a message if the cursor is on those, or if it is on a blank line.
  (when (not (or (looking-at " ") ;looking at a space
                 (looking-at "^$") ;looking at a blank line
                 (looking-at "]") ;looking at a bracket at the end
                 (looking-at "$"))) ;looking at the end of the line.
    (save-restriction (widen)
                      (when (eq major-mode 'org-mode)
                        (let* ((object (org-element-context))
                               (type (org-element-property :type object)))
                          (save-excursion
                            (cond
                             ((or (string= type "videocite")
                                  (string= type "audiocite"))
                              (let* ((media-note-link (org-element-property :path object))
                                     (ref-cite-key (car (split-string media-note-link "#")))
                                     (hms (cdr (split-string media-note-link "#"))))
                                (format "%s @ %s"
                                        (org-ref-format-entry ref-cite-key)
                                        hms))))))))))

(defun org-media-note-display-media-cite-link-message-in-eldoc (&rest _)
  "Display media's cite link message when `eldoc' enabled."
  (org-media-note-media-cite-link-message))

;;;;; Keymap
(defun org-media-note-open-ref-cite-function ()
  "Open a ref-cite link."
  (interactive)
  (let* ((object (org-element-context))
         (media-note-link (if (eq (org-element-type object) 'link)
                              (org-element-property :path object)))
         (ref-cite-key (car (split-string media-note-link "#"))))
    (with-temp-buffer
      (org-mode)
      ;; insert bibliography in order to find entry in org-ref
      (insert (s-join "\n"
                      (mapcar (lambda (bib)
                                (format "bibliography:%s" bib))
                              org-media-note-cite-bibliography)))
      (insert (format "\ncite:%s" ref-cite-key))
      (funcall org-ref-cite-onclick-function nil))))

(defcustom org-media-note-cite-keymap
  (let ((map (copy-keymap org-mouse-map)))
    (define-key map (kbd "H-o") 'org-media-note-open-ref-cite-function)
    map)
  "Keymap for cite links."
  :type 'symbol
  :group 'org-media-note)

;;;;; Link Follow
(defun org-media-note-cite--open (link)
  "Open videocite and audiocite LINKs, supported formats:
1. videocite:course.104#0:02:13: jump to 0:02:13
2. videocite:course.104#0:02:13-0:02:20: jump to 0:02:13 and loop between 0:02:13 and 0:02:20"
  (cl-multiple-value-bind (key time-a time-b)
      (org-media-note--split-link link)
    (let ((path (org-media-note-cite--path key)))
      (cond
       ((not path)
        (error "Cannot find media file for this Key"))
       (t (org-media-note--follow-link path time-a time-b))))))

(defun org-media-note-cite--path (key)
  "Get media file or URL by KEY."
  (or (org-media-note-cite--file-path key)
      (org-media-note-cite--url key)))

(defun org-media-note-cite--file-path (key)
  "Get media file by KEY."
  (let* ((files (bibtex-completion-find-pdf key))
         (video-files (seq-filter (lambda (elt)
                                    (s-matches-p (rx (eval (cons 'or org-media-note--video-types))
                                                     eos)
                                                 elt))
                                  files))
         (audio-files (seq-filter (lambda (elt)
                                    (s-matches-p (rx (eval (cons 'or org-media-note--audio-types))
                                                     eos)
                                                 elt))
                                  files)))
    (cond
     ;; TODO when multiple media files?
     (video-files (file-truename (nth 0 video-files)))
     (audio-files (file-truename (nth 0 audio-files)))
     (t nil))))


(defun org-media-note-cite--url (key)
  "Get URL by KEY."
  (if key
      (let ((entry (bibtex-completion-get-entry1 key t)))
        (bibtex-completion-get-value "url" entry))))
;;;;; Setup

;;;###autoload
(defun org-media-note-setup-org-ref ()
  "Set org link parameters for video/audiocite links."
  (dolist (link '("videocite" "audiocite"))
    (org-link-set-parameters link
                             :follow 'org-media-note-cite--open
                             :keymap org-media-note-cite-keymap
                             :help-echo #'org-media-note-help-echo))

  ;; Display media link description in minibuffer when cursor is over it.
  (advice-add #'org-eldoc-documentation-function
              :before-until #'org-media-note-display-media-cite-link-message-in-eldoc))

;;;; Footer
(provide 'org-media-note-org-ref)
;;; org-media-note-org-ref.el ends here
