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
   '(
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
     pandoc
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
   dotspacemacs-additional-packages '(chinese-fonts-setup
                                      cal-china-x
                                      highlight-thing
                                      color-theme
                                      color-theme-buffer-local
                                      load-theme-buffer-local
                                      evil-find-char-pinyin
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(chinese-wbim
                                    pangu-spacing
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
                         solarized-dark
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         leuven
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
        '(("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
          ("org-cn"   . "http://elpa.zilongshanren.com/org/")
          ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/")
          ("elpy" . "https://jorgenschaefer.github.io/packages/")
          ))

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

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


    (setq yas-snippet-dirs (append '("/home/ziyuan/.spacemacs.d/snippets") yas-snippet-dirs))
    (setq-default yas--default-user-snippets-dir "/home/ziyuan/.spacemacs.d/snippets")

    (require 'yasnippet)
    (yas-global-mode 1)
    ;; Remove Yasnippet's default tab key binding
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    ;; Set Yasnippet's key binding to shift+tab
    (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
    ;; Alternatively use Control-c + tab/ not fine with fcitx, change to f4
    ;;(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)
    (define-key yas-minor-mode-map (kbd "<f4>") 'yas-expand)

    (evil-find-char-pinyin-mode +1);; 让 f/F 支持中文拼音

    (spacemacs|define-text-object "=" "equal-mark" "=" "=")
    (spacemacs|define-text-object "q" "double-quotation-mark" "“" "”");; csm"中文引号的快速替换
    (spacemacs|define-text-object "Q" "single-quotation-mark" "‘" "’");; csM'中文引号的快速替换
    (spacemacs|define-text-object "r" "fullwidth-round-brackets" "（" "）");; csb(中文括号的快速替换
    (spacemacs|define-text-object "s" "fullwidth-square-brackets" "[" "]");; csb(中文括号的快速替换
    (spacemacs|define-text-object "l" "black-lenticular-brackets" "【" "】");; csb(中文括号的快速替换
    (spacemacs|define-text-object "g" "double-guillemet" "《" "》");; csb(中文括号的快速替换
    (spacemacs|define-text-object "G" "single-guillemet" "<" ">");; csb(中文括号的快速替换
    (setq-default evil-surround-pairs-alist evil-surround-pairs-alist)

    ;;模拟vim的n zz功能('*'高亮某个词后，'n'向下时高亮词移动到屏中部，'zz'也可单独使用 )
    (defadvice evil-search-next (after advice-for-evil-search-next activate)
      (evil-scroll-line-to-center (line-number-at-pos)))
    (defadvice evil-search-previous (after advice-for-evil-search-previous activate)
      (evil-scroll-line-to-center (line-number-at-pos)))

    ;;打开menu bar，有时能起到提示作用
    (menu-bar-mode -1)

    (require 'chinese-fonts-setup)
    ;; 让 chinese-fonts-setup 随着 emacs 自动生效。
    (chinese-fonts-setup-enable)
    ;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
    (cfs-set-spacemacs-fallback-fonts)
    (setq cfs-use-face-font-rescale t)
    
    (set-fontset-font "fontset-default" 'unicode "WenQuanYi Bitmap Song 10") ;;for linux

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
    (let ((my-path "/home/ziyuan/anaconda2/bin"))
      (setenv "PATH" (concat my-path ":" (getenv "PATH"))) ; Assume ":" is the separator
      (add-to-list 'exec-path my-path))


    (setq-default dotspacemacs-themes '(monokai solarized-dark leuven)) 
  (linum-relative-global-mode t)
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

  (setq python-shell-extra-pythonpaths
    (quote
     ("/home/ziyuan/Program/PhdWork/" "/home/ziyuan/Program/PhdWork/antenna1/")))

  (setq-default evil-escape-key-sequence "fd")
 ;;(define-key evil-insert-state-map (kbd "jj") 'evil-force-normal-state)

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)

