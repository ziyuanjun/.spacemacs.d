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

(defun fcitxActive()
  (fcitx--activate)
  (remove-hook 'yas-after-exit-snippet-hook 'fcitxActive))

;; ;; http://blog.lojic.com/2009/08/06/send-growl-notifications-from-carbon-emacs-on-osx/
;; (defun ziyuan/growl-notification (title message &optional sticky)
;;   "Send a Growl notification"
;;   (do-applescript
;;    (format "tell application \"GrowlHelperApp\" \n
;;               notify with name \"Emacs Notification\" title \"%s\" description \"%s\" application name \"Emacs.app\" sticky \"%s\"
;;               end tell
;;               "
;;            title
;;            message
;;            (if sticky "yes" "no"))))

;; (defun ziyuan/growl-timer (minutes message)
;;   "Issue a Growl notification after specified minutes"
;;   (interactive (list (read-from-minibuffer "Minutes: " "10")
;;                      (read-from-minibuffer "Message: " "Reminder") ))
;;   (run-at-time (* (string-to-number minutes) 60)
;;                nil
;;                (lambda (minute message)
;;                  (zilongshanren/growl-notification "Emacs Reminder" message t))
;;                minutes
;;                message))
