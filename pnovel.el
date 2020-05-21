(defun pnovel-mode ()
  "Major Mode for pnovel"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "pnovel")
  (setq major-mode 'pnovel-mode)

  (run-hooks 'pnovel-mode-hook))

(provide 'pnovel-mode)
