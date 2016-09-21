;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.spacemacs.d/ziyuan/packages.el"))

(defun ziyuan/load-my-layout ()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "ziyuan")))

(defun ziyuan/save-my-layout ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "ziyuan")))
