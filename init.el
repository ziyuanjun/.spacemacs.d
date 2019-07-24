;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(nginx
     ;;sql
     javascript
     yaml
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     helm
     auto-completion
     (chinese :variables
              chinese-enable-youdao-dict t
              chinese-enable-fcitx t)
     (better-defaults :variables better-defaults-move-to-end-of-code-first t)   ;;test
     emacs-lisp
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     git
     markdown
     org
     ox-hugo
     easy-hugo
     pandoc
     semantic
     cscope
     ;;ycmd
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c-mode)
    (python :variables
         python-test-runner '(nose pytest))
     ;;htmlize
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking ;;很少写英文文章，就暂时不用拼写检查了 
     syntax-checking
     ziyuan
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      pyim
                                      cnfonts
                                      ;; helm-purpose
                                      helm-gtags
                                      cal-china-x
                                      highlight-thing
                                      color-theme
                                      color-theme-buffer-local
                                      load-theme-buffer-local
                                      evil-find-char-pinyin
                                      sr-speedbar
                                      function-args
                                      ox-hugo
                                      easy-hugo
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(pangu-spacing
                                    vi-tilde-fringe
                                    spaceline)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 16
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         leuven
                         solarized-dark
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 23
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   dotspacemacs-startup-lists '((recents . 16)
                                bookmarks
                                (projects . 16))
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "http://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; 必须在 (require 'org) 之前
  (setq-default org-emphasis-regexp-components
                ;; markup 记号前后允许中文
                (list (concat " \t('\"{"            "[:nonascii:]")
                      (concat "- \t.,:!?;'\")}\\["  "[:nonascii:]")
                      " \t\r\n,\"'"
                      "."
                      1))
  )

(defun dotspacemacs/user-config ()
    "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration.
  This is the place where most of your configurations should be done. Unless it is
  explicitly specified that a variable should be set before a package is loaded,
  you should place your code here."

    ;; A test about Orgpomodo
    ;;(add-to-list 'org-modules 'org-timer)
    ;;(setq org-timer-default-timer 2)
    ;; (add-hook 'org-clock-in-hook (lambda ()
    ;;                                (if (not org-timer-current-timer) 
    ;;                                   (org-timer-set-timer '(2)))))

    ;; (global-highlight-thing-mode t)
    ;; (setq highlight-thing-what-thing 'symbol)
    ;; (setq highlight-thing-delay-seconds 0.3)
    ;; (setq highlight-thing-limit-to-defun t)
    ;; (setq highlight-thing-case-sensitive-p t)   

    ;; (helm-purpose-setup)
    

    
    (use-package ox-hugo
      :ensure t          ;Auto-install the package from Melpa (optional)
      :after ox)

    (add-to-list 'load-path "/usr/local/share/asymptote")
    (autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
    (autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
    (autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
    (add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))

    (defalias 'display-buffer-in-major-side-window 'window--make-major-side-window);;这是spacemacs的一个bug


    (fcitx--defun-maybe "snippet")

    (defun foo ()
      (fcitx--snippet-maybe-activate)
      (remove-hook 'yas-after-exit-snippet-hook 'foo))


    (setq yas-snippet-dirs (append '("/home/zy/.spacemacs.d/snippets") yas-snippet-dirs))
    (setq-default yas--default-user-snippets-dir "/home/zy/.spacemacs.d/snippets")

    (require 'yasnippet)
    (yas-global-mode 1)
    ;; Remove Yasnippet's default tab key binding
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    ;; Set Yasnippet's key binding to shift+tab
    (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
    ;; Alternatively use Control-c + tab/ not fine with fcitx, change to f4
    ;;(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)
    (define-key yas-minor-mode-map (kbd "<f6>") 'yas-expand)

    (evil-find-char-pinyin-mode +1);; 让 f/F 支持中文拼音


    (require 'pyim)
    (require 'pyim-basedict)
    (pyim-basedict-enable)
    ;; (require 'chinese-pyim-greatdict)
    ;; (chinese-pyim-greatdict-enable)
    (setq default-input-method "pyim") 
    (setq pyim-default-scheme 'quanpin)
      ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
      ;; 我自己使用的中英文动态切换规则是：
      ;; 1. 光标只有在注释里面时，才可以输入中文。
      ;; 2. 光标前是汉字字符时，才能输入中文。
      ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
      (setq-default pyim-english-input-switch-functions
                    '(pyim-probe-dynamic-english
                      pyim-probe-isearch-mode
                      pyim-probe-program-mode
                      pyim-probe-org-structure-template))

      (setq-default pyim-punctuation-half-width-functions
                    '(pyim-probe-punctuation-line-beginning
                      pyim-probe-punctuation-after-punctuation))

      ;; 开启拼音搜索功能
      (setq pyim-isearch-enable-pinyin-search t) 
      ;; 使用 pupup-el 来绘制选词框
      (setq pyim-page-tooltip 'popup)
      ;;(setq pyim-page-tooltip 'pos-tip)
      ;;(setq x-gtk-use-system-tooltips t)
      (setq pyim-page-style 'one-line)
      ;; 选词框显示5个候选词
      (setq pyim-page-length 5) 
      ;; 让 Emacs 启动时自动加载 pyim 词库
      (add-hook 'emacs-startup-hook
                #'(lambda () (pyim-restart-1 t)))
      (global-set-key (kbd "C-\\") 'toggle-input-method)

      (require 'google-translate)
      (setq google-translate-base-url "http://translate.google.cn/translate_a/single")
      (setq google-translate-listen-url "http://translate.google.cn/translate_tts")
      (setq google-translate--tkk-url "http://translate.google.cn/")
      (global-set-key "\C-ct" 'google-translate-smooth-translate)
      (setq google-translate-translation-directions-alist '(("en" . "zh-CN")))

      
      ;;将英文转为汉字时删除空格。相关的讨论：https://github.com/tumashu/chinese-pyim/issues/139
      (setq toggle-chinese-pyim-no-space nil) ;;默认不删空格
      (defun ziyuan/pyim-convert-code-at-point()
        (interactive)
        (pyim-convert-code-at-point)
        ;;光标所在处至文件尾的剩余字符个数
        (let (pointleft-at-insert)
          (setq pointleft-at-insert (- (point-max) (point)))
          ;;删除一个可能存在的空格
          (backward-word)
          (if toggle-chinese-pyim-no-space
              (if (eq 32 (char-before (point)))
                    (delete-char -1)))
          ;;恢复光标位置
          (goto-char (- (point-max) pointleft-at-insert))))
      (global-set-key (kbd "M-j") 'ziyuan/pyim-convert-code-at-point);与 pyim-probe-dynamic-english 配合


      (global-set-key (kbd "C-s") 'helm-swoop)

    (spacemacs|define-text-object "=" "equal-mark" "=" "=")
    (spacemacs|define-text-object "q" "double-quotation-mark" "“" "”");; csm"中文引号的快速替换
    (spacemacs|define-text-object "Q" "single-quotation-mark" "‘" "’");; csM'中文引号的快速替换
    (spacemacs|define-text-object "r" "fullwidth-round-brackets" "（" "）");; csb(中文括号的快速替换
    (spacemacs|define-text-object "s" "fullwidth-square-brackets" "[" "]");; csb(中文括号的快速替换
    (spacemacs|define-text-object "l" "black-lenticular-brackets" "【" "】");; csb(中文括号的快速替换
    (spacemacs|define-text-object "g" "double-guillemet" "《" "》");; csb(中文括号的快速替换
    (spacemacs|define-text-object "G" "single-guillemet" "<" ">");; csb(中文括号的快速替换
    ;;(setq-default evil-surround-pairs-alist evil-surround-pairs-alist)

    ;;模拟vim的n zz功能('*'高亮某个词后，'n'向下时高亮词移动到屏中部，'zz'也可单独使用 )
    (defadvice evil-search-next (after advice-for-evil-search-next activate)
      (evil-scroll-line-to-center (line-number-at-pos)))
    (defadvice evil-search-previous (after advice-for-evil-search-previous activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

    ;;打开menu bar，有时能起到提示作用
    (menu-bar-mode -1)

    (require 'cnfonts)
    ;; 让 chinese-fonts-setup 随着 emacs 自动生效。
    (cnfonts-enable)
    ;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
    (cnfonts-set-spacemacs-fallback-fonts)
    (setq cnfonts-use-face-font-rescale t)
    
    (set-fontset-font "fontset-default" 'unicode "WenQuanYi Bitmap Song 12") ;;for linux

    (add-to-list 'load-path "~/.emacs.d/elpa/cal-china-x-20160102.124") 
    (require 'cal-china-x)
    (setq mark-holidays-in-calendar t)
    (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
    (setq calendar-holidays cal-china-x-important-holidays)
    ;;cal-china-x的配置参考http://blog.sina.com.cn/s/blog_569c4e040101gt4u.html
    (setq my-holidays '(;;公历节日
                        (holiday-fixed 2 14 "情人节")
                        (holiday-fixed 9 10 "教师节")
                        (holiday-float 6 0 3 "父亲节")
                        ;;农历节日
                        (holiday-lunar 1 1 "春节" 0)
                        (holiday-lunar 1 15 "元宵节" 0)
                        (holiday-solar-term "清明" "清明节")
                        (holiday-lunar 5 5 "端午节" 0)
                        (holiday-lunar 7 7 "七夕情人节" 0)
                        (holiday-lunar 8 15 "中秋节" 0)
                        ;;纪念日
                        (holiday-fixed 11 17 "老婆阳历生日")
                        (holiday-lunar 10 16 "老婆农历生日" 0)
                        (holiday-lunar 9 18 "某人农历生日" 0) ))
    (setq calendar-holidays my-holidays) ;只显示我定制的节假日
    (setq calendar-mark-holidays-flag t) ;打开Calendar时默认高亮节日

    ;;python3
    ;;(setenv "PATH" "/home/ziyuan/anaconda3/bin:/usr/local/bin:/usr/bin:/bin:/bin/bash:/home/ziyuan/MySoft/pymacs")

    ;;python2
    ;;(setenv "PATH" "/home/ziyuan/anaconda2/bin:/usr/local/bin:/usr/bin:/bin:/bin/bash")
    ;;(setq exec-path (split-string (getenv "PATH") path-separator))
    ;; (let ((my-path "/home/ziyuan/anaconda2/bin"))
    ;;   (setenv "PATH" (concat my-path ":" (getenv "PATH"))) ; Assume ":" is the separator
    ;;   (add-to-list 'exec-path my-path))

    (let ((my-path "/usr/local/texlive/2016/bin/x86_64-linux"))
       (setenv "PATH" (concat my-path ":" (getenv "PATH"))) ; Assume ":" is the separator
       (add-to-list 'exec-path my-path))

    (setq-default dotspacemacs-themes '(monokai solarized-dark leuven)) 
  ;(linum-relative-global-mode t)
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (setq ns-use-srgb-colorspace nil)
  (setq powerline-default-separator 'arrow)

  (setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                            chinese-enable-fcitx t)))
  (setq-default dotspacemacs-configuration-layers '((chinese :variables
                                                            chinese-enable-youdao-dict t)))
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 2.0))      ;调整 LaTeX 预览图片的大小

  (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

  ;; j and k to behave like g j and g k
  (define-key evil-normal-state-map (kbd ",j") 'next-line)
  (define-key evil-normal-state-map (kbd ",k") 'previous-line)
  ;;中文输入退出到normal模式时，自动变为英文
  (require 'fcitx)
  ;;(package-initialize)
  ;;(elpy-enable)
  (setq fcitx-active-evil-states '(insert emacs hybrid)) ; if you use hybrid mode
  (fcitx-aggressive-setup)
  (fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs
  (setq fcitx-use-dbus t) ; uncomment if you're using Linux

  (setq-default org-download-image-dir "~/Pictures/org-download/")

  ;; (setq python-shell-extra-pythonpaths
  ;;   (quote
  ;;    ("/home/ziyuan/Program/PhdWork/" "/home/ziyuan/Program/PhdWork/antenna1/")))

  (setq-default evil-escape-key-sequence "fd")
 ;;(define-key evil-insert-state-map (kbd "jj") 'evil-force-normal-state)

  ;;如果后面紧跟着字符就不补后号
  ;(sp-pair "(" nil :unless '(sp-point-before-word-p))
  ;(sp-pair "{" nil :unless '(sp-point-before-word-p))



;; 定义 org-mode-reftex-search
(defun org-mode-reftex-search ()
 ;; jump to the notes for the paper pointed to at from reftex search
 (interactive)
 (org-open-link-from-string (format "[[notes:%s]]" (reftex-citation t))))

(setq org-link-abbrev-alist
 '(("bib" . "~/References/ref.bib::%s")
   ("notes" . "~/References/org/notes.org::#%s")
   ("papers" . "~/References/papers/%s.pdf")))
   
;; 当使用 org-mode 时，自动调 RefTeX
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
    ;; enable auto-revert-mode to update reftex when bibtex file changes on disk
    (global-auto-revert-mode t)
    (reftex-parse-all)
    ;; add a custom reftex cite format to insert links
    (reftex-set-cite-format
      '((?b . "[[bib:%l][%l-bib]]")
        (?c . "\\cite{%l}")
        (?n . "[[notes:%l][%l-notes]]")
        (?p . "[[papers:%l][%l-paper]]")
        (?t . "%t")
        (?h . "** %t\n:PROPERTIES:\n:Custom_ID: %l\n:END:\n[[papers:%l][%l-paper]]")))))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  ;; binding of  ”C-c (” to org-mode-reftex-search
  (define-key org-mode-map (kbd "C-c (") 'org-mode-reftex-search))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

(fa-config-default)
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)

