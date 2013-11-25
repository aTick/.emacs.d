;; Window management remapping
(defun my-next-window (&optional num-windows)
  (interactive "p")
  (if num-windows
      (other-window num-windows)
    (other-window 1)))

(defun my-previous-window (&optional num-windows)
  (interactive "p")
  (if num-windows
      (other-window (- num-windows))
    (other-window -1)))

(global-set-key (kbd "<f6>") 'switch-to-buffer)
(global-set-key (kbd "<f7>") 'my-previous-window)
(global-set-key (kbd "<f8>") 'my-next-window)
(global-set-key (kbd "C-<f5>") 'delete-other-windows)
(global-set-key (kbd "C-<f6>") 'split-window-vertically)
(global-set-key (kbd "C-<f7>") 'split-window-horizontally)
(global-set-key (kbd "C-<f8>") 'delete-window)
(provide 'my-command-remap)
