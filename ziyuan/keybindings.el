;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key (kbd "<f1>") 'org-toggle-inline-images);; 显示/隐藏图片 

(define-key evil-normal-state-map (kbd ",/") 'comment-line)
(define-key evil-visual-state-map (kbd ",/") 'comment-line)

(global-set-key (kbd "C-c a") 'org-agenda)
