;;; pnovel.el --- major mode for pnovel              -*- lexical-binding: t -*-

;; Copyright (C) 2020 Takahiro KOJIMA

;; Author: Takahiro KOJIMA <12kojima.takahiro@gmail.com>
;; Keywords: pnovel japanese novel
;; Version: 0.0.1

;; MIT License
;;
;; Copyright (c) 2020 Takahiro Kojima
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; Major mode for pnovel format

;;; Code:
(defvar pnovel-command "npx pnovel")

(defun pnovel-mode/pnovel-compile ()
  (interactive)
  (progn
    (message "Compiling '%s'" buffer-file-name)
    (async-shell-command (format "%s %s\n" pnovel-command buffer-file-name))))

(defvar pnovel-mode-map (copy-keymap global-map))
(define-key pnovel-mode-map (kbd "C-c C-t") 'pnovel-mode/pnovel-compile)

(define-generic-mode pnovel-mode
  '("%")
  '("newline" "newpage")
  '(("# .*" . font-lock-warning-face)
    ("`.*`" . font-lock-doc-face))
  nil nil
  "Major mode for pnovel")
(add-to-list 'auto-mode-alist '("\\.pnovel\\'" . pnovel-mode))
(provide 'pnovel)
;;; pnovel.el ends here
