;; 文档结构说明：
;; 1. 文档注释
;; 2. 插件无关的公共设置（Emacs自带的一些设置）
;; 3. 公共插件配置（与具体语言无关的插件配置）
;; 4. 特殊配置（针对某种语言插件的具体配置）
;; 5. 按键绑定

;; Emacs配置文件的三种风格：‘~/.emacs’, ‘~/.emacs.el’, 或者‘~/.emacs.d/init.el’

;; 在 mode line 上显示行列号
;;(setq column-number-mode 1)
;;(setq line-number-mode 1)
;; 在buffer左侧显示行号
(global-linum-mode 1)

;; 取消滚动栏，工具栏
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; 以 y/n代表 yes/no
 (fset 'yes-or-no-p 'y-or-n-p)

;;; 设置备份策略
 (setq make-backup-files t)
 (setq kept-old-versions 2)
 (setq kept-new-versions 2)
 (setq delete-old-versions t)
 (setq backup-directory-alist '(("" . "~/.emacsbackup")))

;; 公共插件配置

;; solarized主题
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
;;(load-theme 'solarized t)

;; 设置 package system，这里使用 MELPA，里面的包可以说是应有尽有
 (require 'package)
 (add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)
 (package-initialize)

;; autopair (括号自动匹配)
(autopair-global-mode)

;; auto-complete
(ac-config-default)


;; c cpp 插件配置

(defun my-c-mode-hook()
 "This is the function of c mode hook"
 
 ;; set fci-mode argument
 (setq fci-rule-column 80)
 (setq fci-rule-color "orange")
 (setq fci-rule-width 2)
 (fci-mode 1)
 
 ;; gtags mode and doxymacs
 (setq load-path (cons "~/.emacs.d/plugins/" load-path))
 (autoload 'gtags-mode "gtags" "" t)
 
 ;; open gtags mode
 (gtags-mode 1)

 ;; doxymacs mode
 ;;(doxymacs-mode 1)
 
;; 回车换行自动缩进
(setq-default indent-tabs-mode nil)
(global-set-key (kbd "RET") 'newline-and-indent)

 ;; 缩进风格设置
 (setq c-default-style '((java-mode . "java")
                                      (awk-mode . "awk")
                                      (other . "linux")))
 )

(add-hook 'c-mode-common-hook 'my-c-mode-hook)


;;安装 jedi(python自动补全)
;;(jedi:setup)
;;(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) 
;; jedi使用
;; <C-tab> jedi:complete
;; Complete code at point.

;; C-c ? jedi:show-doc
;; Show the documentation of the object at point.

;; C-c . jedi:goto-definition
;; Goto the definition of the object at point.

;; C-c , jedi:goto-definition-pop-marker
;; Goto the last point where jedi:goto-definition was called.


;;按键绑定

;; 设置 f1 打开帮助文档
(global-set-key [f1] 'info)
;; 设置 f3 关闭当前buffer
(global-set-key [f3] 'kill-this-buffer)
;; 设置 f4 打开 eshell
(global-set-key [f4] 'eshell)
