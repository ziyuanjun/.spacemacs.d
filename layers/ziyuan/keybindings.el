;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)
(global-set-key (kbd "<f5>") 'browse-file-directory)

(global-set-key (kbd "<f1>") 'org-toggle-inline-images);; 显示/隐藏图片 
(global-set-key (kbd "<f7>") 'ziyuan/toggle-chinese-pyim-convert-no-space)

(define-key evil-normal-state-map (kbd ",/") 'comment-line)
(define-key evil-visual-state-map (kbd ",/") 'comment-line)

(global-set-key (kbd "C-c a") 'org-agenda)

(spacemacs/set-leader-keys "oll" 'ziyuan/load-my-layout)
(spacemacs/set-leader-keys "ols" 'ziyuan/save-my-layout)


(global-set-key (kbd "C-c s c") 'my-org-screenshot)

(global-set-key (kbd "C-c s s") 'org-format-region-as-code-block)

