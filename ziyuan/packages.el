;;; packages.el --- ziyuan layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: ziyuan <ziyuan@polaris-home>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `ziyuan-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `ziyuan/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `ziyuan/pre-init-PACKAGE' and/or
;;   `ziyuan/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst ziyuan-packages
  '(company
    org-ref
    org-bullets
    htmlize
    ;;auctex
    anaconda-mode
    ;; (org-download :location (recipe :fetcher github :repo "abo-abo/org-download"))
    (org :location built-in))
  "The list of Lisp packages required by the ziyuan layer.

Each entry is either: 
1. A symbol, which is interpreted as a package to be installed, or 
2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted: 
    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil 
    - :location: Specify a custom installation location.
      The following values are legal: 
      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager. 
      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'
      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")
;;; packages.el ends here


;;一个在org中方便插入图片的package, see: https://github.com/abo-abo/org-download
;; (defun ziyuan/init-org-download()
;;   (use-package org-download
;;     :init))

(defun ziyuan/init-org-ref()
  (use-package org-ref
  :init))

(defun ziyuan/init-org-bullets()
  (use-package org-bullets
  :init))

(defun ziyuan/init-htmlize()
  (use-package htmlize
  :init))

(defun ziyuan/init-anaconda-mode()
  (use-package anaconda-mode
  :init))

;; (defun ziyuan/init-org()
;;   )

(defun ziyuan/post-init-org()
    (setq org-hide-emphasis-markers t)  ;;隐藏字体样式标志
    (setq org-agenda-files '("~/Nutstore/gtd"))  ;; 设置默认 Org Agenda 文件目录
    (setq org-use-sub-superscripts nil)  ;;上下标默认不作用，需要时加{}
    (setq org-confirm-babel-evaluate nil) ;;在用C-c C-c执行代码块时,不再提示“Do you want to execute”
    (setq org-src-fontify-natively t) ;; Org-mode 文本内语法高亮
    ;;Let's have pretty source code blocks : 语法高亮、保留原生tab等
    (setq org-edit-src-content-indentation 0
          org-src-tab-acts-natively 1
          org-src-fontify-natively t  ;; Org-mode 文本内语法高亮
          org-confirm-babel-evaluate nil
          org-support-shift-select 'always)

    (setq org-export-babel-evaluate (quote inline-only))

  (require 'ox-latex)
  (add-to-list 'org-latex-classes
               '("ctexart"
                 "\\documentclass[UTF8]{ctexart}
		\\usepackage{amsmath,latexsym,amssymb,mathrsfs,pifont}
		\\usepackage[T1]{fontenc}
		\\usepackage{fixltx2e}
		\\usepackage{graphicx}
		\\usepackage{subfig} 
		\\usepackage{grffile}
		\\usepackage{longtable}
		\\usepackage{wrapfig}
		\\usepackage{rotating}
		\\usepackage{minted}
		\\usepackage[colorlinks=true]{hyperref}
		\\tolerance=1000
		[NO-DEFAULT-PACKAGES]
		[NO-PACKAGES]" 
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))) 

  ;; 使用xelatex一步生成PDF
  (setq-default org-latex-pdf-process
                '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                  "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                  "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                  "rm -fr %b.out %b.log %b.tex auto"
                  ))

  ;; Tell the latex export to use the minted package for source code coloration.
  (setq org-latex-listings 'minted)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t)
     (dot . t)
     (latex .t)
     (python . t)
     (emacs-lisp . t)
     (C . t)
     (matlab . t)
     ))

    ;; (setq org-babel-load-languages
    ;;   (quote
    ;;    ((emacs-lisp . t)
    ;;     (python . t)
    ;;     (sh . t)
    ;;     (C++ . t)
    ;;     (C . t)
    ;;     (dot . t)
    ;;     (latex . t)
    ;;     (matlab . t))))

    ;; 加密文章
    ;; "http://coldnew.github.io/blog/2013/07/13_5b094.html"
    ;; org-mode 設定
    (require 'org-crypt)

    ;; 當被加密的部份要存入硬碟時，自動加密回去
    (org-crypt-use-before-save-magic)

    ;; 設定要加密的 tag 標籤為 secret
    (setq org-crypt-tag-matcher "secret")

    ;; 避免 secret 這個 tag 被子項目繼承 造成重複加密
    ;; (但是子項目還是會被加密喔)
    (setq org-tags-exclude-from-inheritance (quote ("secret")))

    ;; 用於加密的 GPG 金鑰
    ;; 可以設定任何 ID 或是設成 nil 來使用對稱式加密 (symmetric encryption)
    (setq org-crypt-key nil)

)

(defun ziyuan/post-init-org-ref()
  (setq reftex-default-bibliography '("~/Refrences/bibliography/refs.bib"))
  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/Refrences/bibliography/notes.org"
        org-ref-default-bibliography '("~/Refrences/bibliography/refs.bib")
        org-ref-pdf-directory "~/Refrences/bibliography/bibtex-pdfs/")
  )

(defun ziyuan/post-init-company()
    (setq global-company-mode 1) ; 开启全局 Company 补全
    )

(defun ziyuan/post-init-org-bullets()
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)
  (setq-default org-bullets-bullet-list '("⓪" "①" "②" "③"
                                          "④" "⑤" "⑥" "⑦"
                                          "⑧" "⑨" "⑩" "⑪"
                                          "⑫" "⑬" "⑭"
                                          "⑮" "⑯" "⑰"
                                          "⑱" "⑲" "⑳"))
  )

