;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.spacemacs.d/layers/ziyuan/packages.el"))

;;设置pyim-convert-code-at-point调用时是否删除中英文之间的空格
(defun ziyuan/toggle-chinese-pyim-convert-no-space()
  (interactive)
  (if toggle-chinese-pyim-no-space
      (progn
        (setq toggle-chinese-pyim-no-space nil)
        (message "M-j 英->中 不删空格")
        )
    (progn
      (setq toggle-chinese-pyim-no-space t)
      (message "M-j 英->中 删空格")
      )
    ))

;;使用文件浏览器打开文件所在目录参考：https://emacs-china.org/t/spacemacs-finder/2183/14
(defun browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))

;;org mode 中选择一段代码，未其加入#+BEGIN_SRC xx 和 #+END_SRC
;;https://emacs-china.org/t/topic/3538/11
(defun org-format-region-as-code-block (beg end)
  (interactive "*r")
  (let ((lang (read-string "Language: "))
        (ind (save-excursion
               (goto-char beg)
               (back-to-indentation)
               (buffer-substring (line-beginning-position) (point))))
        (code (delete-and-extract-region beg end)))
    (insert ind "#+BEGIN_SRC " lang "\n"
            code (if (string-suffix-p "\n" code) "" "\n")
            ind "#+END_SRC\n")))

(defun ziyuan/load-my-layout ()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "ziyuan")))

(defun ziyuan/save-my-layout ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "ziyuan")))

(defun ziyuan/break-Notify ()
  (
   let ((buf (current-buffer))
        (-buf (generate-new-buffer "*temp*")))
  ;; 分屏、选中下边 window
  (select-window (split-window-below))
  (evil-window-set-height 6)
  (switch-to-buffer -buf)
  (load-theme-buffer-local 'spacemacs-light (current-buffer))
  (erase-buffer);;把temp中的内容清空
  (insert "休息一下")
  ;; 选中原来 buffer 所在的 window
  (select-window (get-buffer-window buf))
  ))

(defun ziyuan/short-break-finish ()
  (
   ;; let ((buf (current-buffer))
   ;;      (-buf (generate-new-buffer "*temp*")))
  (switch-to-buffer-other-window "*temp*")
  ;;(erase-buffer);;把temp中的内容清空
  (insert "短休息结束")
  (other-window 1);;回到窗口1
  ))

(defun ziyuan/long-break-finish ()
  (switch-to-buffer-other-window "*temp*")
  ;;(erase-buffer);;把temp中的内容清空
  (insert "长休息结束")
  (other-window 1);;回到窗口1
  )

(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_imgs/"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
					; take screenshot
  (if (eq system-type 'darwin)
      (progn
	(call-process-shell-command "screencapture" nil nil nil nil " -s " (concat
									    "\"" filename "\"" ))
	(call-process-shell-command "convert" nil nil nil nil (concat "\"" filename "\" -resize  \"50%\"" ) (concat "\"" filename "\"" ))
	))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
					; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "[[file:" filename "]]")))
  (org-display-inline-images)
  )



;; 中文字数统计 参考：http://kuanyui.github.io/2014/01/18/count-chinese-japanese-and-english-words-in-emacs/
(defvar wc-regexp-chinese-char-and-punc
      (rx (category chinese)))
(defvar wc-regexp-chinese-punc
  "[。，！？；：「」『』（）、【】《》〈〉※—]")
(defvar wc-regexp-english-word
  "[a-zA-Z0-9-]+")

(defun wc ()
  "「較精確地」統計中/日/英文字數。
- 文章中的註解不算在字數內。
- 平假名與片假名亦包含在「中日文字數」內，每個平/片假名都算單獨一個字（但片假
  名不含連音「ー」）。
- 英文只計算「單字數」，不含標點。
- 韓文不包含在內。

※計算標準太多種了，例如英文標點是否算入、以及可能有不太常用的標點符號沒算入等
。且中日文標點的計算標準要看 Emacs 如何定義特殊標點符號如ヴァランタン・アルカン
中間的點也被 Emacs 算為一個字而不是標點符號。"
  (interactive)
  (let* ((v-buffer-string
          (progn
            (if (eq major-mode 'org-mode) ; 去掉 org 文件的 OPTIONS（以#+開頭）
                (setq v-buffer-string (replace-regexp-in-string "^#\\+.+" ""
                                       (buffer-substring-no-properties (point-min) (point-max))))
              (setq v-buffer-string (buffer-substring-no-properties (point-min) (point-max))))
            (replace-regexp-in-string (format "^ *%s *.+" comment-start) "" v-buffer-string)))
                                        ; 把註解行刪掉（不把註解算進字數）。
         (chinese-char-and-punc 0)
         (chinese-punc 0)
         (english-word 0)
         (chinese-char 0))
    (with-temp-buffer
      (insert v-buffer-string)
      (goto-char (point-min))
      ;; 中文（含標點、片假名）
      (while (re-search-forward wc-regexp-chinese-char-and-punc nil :no-error)
        (setq chinese-char-and-punc (1+ chinese-char-and-punc)))
      ;; 中文標點符號
      (goto-char (point-min))
      (while (re-search-forward wc-regexp-chinese-punc nil :no-error)
        (setq chinese-punc (1+ chinese-punc)))
      ;; 英文字數（不含標點）
      (goto-char (point-min))
      (while (re-search-forward wc-regexp-english-word nil :no-error)
        (setq english-word (1+ english-word))))
    (setq chinese-char (- chinese-char-and-punc chinese-punc))
    (message
     (format "中日文字數（不含標點）：%s
中日文字數（包含標點）：%s
英文字數（不含標點）：%s
=======================
中英文合計（不含標點）：%s"
             chinese-char chinese-char-and-punc english-word
             (+ chinese-char english-word)))))

(defun wcr ()
  "「较精確地」统计中/日/英文字数。仅对选定区域"
  (interactive)
 (if (use-region-p)
  (let ((start (region-beginning))
        (end (region-end))
        (chinese-char-and-punc 0)
        (chinese-punc 0)
        (english-word 0)
        (chinese-char 0) 
        )
    (save-restriction
      (narrow-to-region start end)

    (goto-char start)
    ;; 中文（含標點、片假名）
    (while (re-search-forward wc-regexp-chinese-char-and-punc nil :no-error)
      (setq chinese-char-and-punc (1+ chinese-char-and-punc)))
    ;; 中文標點符號
    (goto-char start)
    (while (re-search-forward wc-regexp-chinese-punc nil :no-error)
      (setq chinese-punc (1+ chinese-punc)))
    ;; 英文字數（不含標點）
    (goto-char start)
    (while (re-search-forward wc-regexp-english-word nil :no-error)
      (setq english-word (1+ english-word))))
    (setq chinese-char (- chinese-char-and-punc chinese-punc))
    (message
     (format "中日文字數（不含標點）：%s
中日文字數（包含標點）：%s
英文字數（不含標點）：%s
=======================
中英文合計（不含標點）：%s"
             chinese-char chinese-char-and-punc english-word
             (+ chinese-char english-word)))
)))

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
