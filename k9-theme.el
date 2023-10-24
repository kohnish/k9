;;; k9 is a theme based on the following efforts
;;; The licence is as-is. (GPLv3)

;;; badwolf-theme.el --- Bad Wolf color theme

;; Copyright (C) 2015  Bartłomiej Kruczyk

;; Author: bkruczyk <bartlomiej.kruczyk@gmail.com>
;; Version: 1.2
;; Keywords: themes
;; Package-Requires: ((emacs "24"))
;; URL: https://github.com/bkruczyk/badwolf-emacs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; An Emacs port of Steve's Losh theme for Vim:
;; https://github.com/sjl/badwolf

;;; Credits:

;; Steve Losh is creator of the original theme for Vim
;; (https://github.com/sjl/badwolf), on which this Emacs port was
;; based.

;; locojay is creator of the initial Emacs port
;; (https://github.com/locojay/badwolf).

;;; Code:

(deftheme k9 "Good Wolf colour theme")

(defgroup k9 nil
  "K9 theme customization variables."
  :group 'faces)

(defcustom k9-diff-hl-inverse nil
  "Inverse diff-hl faces."
  :type 'boolean
  :group 'k9)

(defcustom k9-keywords-nobold nil
  "Do not use bold for keywords."
  :type 'boolean
  :group 'k9)

(defcustom k9-is-dark-mode nil
  "Switch to dark mode"
  :type 'boolean
  :group 'k9)


(defun k9-set-colour-scheme()
  (custom-theme-set-variables
    'k9
    `(notmuch-search-line-faces
       '(("unread" :foreground ,lime)
          ("flagged" :foreground ,tardis)
          ("deleted" :foreground ,taffy :bold t))))

  (custom-set-faces
   ;; '(term-color-black ((t (:foreground "#3F3F3F" :background "#2B2B2B"))))
   ;; '(term-color-red ((t (:foreground "#AC7373" :background "#8C5353"))))
   ;; '(term-color-green ((t (:foreground "#7F9F7F" :background "#9FC59F"))))
    ;; '(term-color-yellow ((t (:foreground "#DFAF8F" :background "#9FC59F"))))
    `(ansi-color-blue ((t (:foreground ,tardis :background ,bg))))
    `(ansi-color-bright-blue ((t (:foreground ,tardis :background ,bg))))
   ;; '(term-color-magenta ((t (:foreground "#DC8CC3" :background "#CC9393"))))
   ;; '(term-color-cyan ((t (:foreground "#93E0E3" :background "#8CD0D3"))))
   ;; '(term-color-white ((t (:foreground "#DCDCCC" :background "#656555"))))
   ;; '(term-default-fg-color ((t (:inherit term-color-white))))
    ;; '(term-default-bg-color ((t (:inherit term-color-black))))
    `(flymake-errline ((t (:foreground ,snow :background ,dark-red :weight bold))))
    `(flymake-warnline ((t (:foreground ,snow :background ,dark-orange :weight bold))))
    )

  (custom-theme-set-faces
    'k9

    ;; font lock
    `(default ((t (:inherit nil :foreground ,plain :background ,bg))))
    `(font-lock-builtin-face ((t (:foreground ,plain))))
    `(font-lock-comment-face ((t (:foreground ,lightgravel))))
    `(font-lock-comment-delimiter-face ((t (:foreground ,lightgravel))))
    `(font-lock-constant-face ((t (:foreground ,dark-red))))
    `(font-lock-doc-face ((t (:foreground ,lightgravel))))
    `(font-lock-function-name-face ((t (:foreground ,fg))))
    `(font-lock-variable-name-face ((t (:foreground ,fg))))
    `(font-lock-keyword-face ((t (:foreground ,taffy ,@(when (not k9-keywords-nobold) `(:weight bold))))))
    `(font-lock-preprocessor-face ((t (:foreground ,lime))))
    `(font-lock-string-face ((t (:foreground ,dirtyblonde :weight bold))))
    `(font-lock-type-face ((t (:foreground ,dirtyblonde :weight bold))))
    `(font-lock-warning-face ((t (:foreground ,dress :weight bold))))
    `(shadow ((t (:foreground ,mediumgravel))))
    `(success ((t (:foreground ,lime))))
    `(error ((t (:foreground ,snow :background ,dark-red :weight bold))))
    `(warning ((t (:foreground ,snow :background ,dark-orange :weight bold))))

    ;; `(tab-bar                    ((,class (:background ,lambda-bg :foreground ,lambda-meek :height 1.0 :box (:line-width -1 :color ,lambda-bg)))))
    `(tab-bar-tab                ((t (:background ,tardis :foreground ,snow))))
    ;; `(tab-bar-tab-inactive       ((,class (:background ,lambda-lowlight :foreground ,lambda-meek :height .95))))
    ;; `(tab-bar-tab-ungrouped      ((,class (:background ,lambda-bg :foreground ,lambda-faint))))
    ;; `(tab-bar-tab-group-current  ((,class (:background ,lambda-bg :foreground ,lambda-fg :underline t))))
    ;; `(tab-bar-tab-group-inactive ((,class (:background ,lambda-bg :foreground ,lambda-faint))))

    ;; avy 
    `(avy-lead-face-0 ((t (:foreground ,coal :background , dalespale))))
    `(avy-lead-face-1 ((t (:foreground ,coal :background , dalespale))))
    `(avy-lead-face-2 ((t (:foreground ,coal :background , dalespale))))
    `(avy-lead-face ((t (:foreground ,coal :background , dalespale))))

    ;; ui
    `(cursor ((t (:background ,tardis))))
    `(region ((t (:background ,deepgravel))))
    `(secondary-selection ((t (:foreground ,darkgravel :background ,tardis))))
    `(fringe ((t (:background ,bg))))
    `(linum ((t (:foreground ,mediumgravel :background ,bg))))
    `(vertical-border ((t (:foreground ,gravel))))
    `(highlight ((t (:foreground ,coal :background ,dalespale))))
    `(escape-glyph ((t (:foreground ,tardis))))
    `(hl-line ((t (:inherit nil :background ,hl-line))))
    `(minibuffer-prompt ((t (:foreground ,plain))))
    `(mode-line ((t (:box nil :foreground ,snow :background ,tardis))))
    ;; `(mode-line-inactive ((t (:box nil :foreground ,gravel :background "white"))))
    `(header-line ((t (:inherit mode-line))))
    `(link ((t (:foreground ,lightgravel :underline t))))
    `(link-visited ((t (:inherit link :foreground ,orange))))

    ;; whitespace-mode
    `(trailing-whitespace ((t (:background ,bg :foreground, white-space-text))))
    `(whitespace-trailing ((t (:background , bg :foreground, white-space-text))))
    `(whitespace-empty ((t (:background ,bg :foreground, white-space-text))))
    `(whitespace-line ((t (:background ,bg :foreground, white-space-text))))

    `(whitespace-hspace ((t (:foreground, white-space-text))))
    `(whitespace-space ((t (:foreground, white-space-text))))
    `(whitespace-tab ((t (:foreground, white-space-text))))
    `(whitespace-newline ((t (:foreground, white-space-text))))

    `(whitespace-indentation ((t (:background , bg :foreground , white-space-text))))
    `(whitespace-space-after-tab ((t (:background , bg :foreground, white-space-text))))
    `(whitespace-space-before-tab ((t (:background , bg :foreground, white-space-text))))

    ;; ruler-mode
    `(ruler-mode-default ((t :inherit linum :underline t)))
    `(ruler-mode-column-number ((t (:foreground ,lightgravel :background ,bg :underline ,mediumgravel))))
    `(ruler-mode-fill-column ((t (:foreground ,dirtyblonde :background ,bg :underline ,mediumgravel))))
    `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
    `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
    `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
    `(ruler-mode-current-column ((t (:foreground ,tardis :background ,bg :underline ,mediumgravel))))
    `(ruler-mode-margins ((t (:inherit ruler-mode-default))))
    `(ruler-mode-fringes ((t (:inherit ruler-mode-default))))
    `(ruler-mode-pad ((t (:inherit ruler-mode-default))))

    ;; search
    `(isearch ((t (:foreground ,coal :background ,dress :bold t))))
    `(isearch-fail ((t (:foreground ,taffy :background ,bg))))
    `(lazy-highlight ((t (:foreground ,coal :background ,dalespale))))

    ;; show-paren-mode
    `(show-paren-match ((t (:foreground ,bg :background ,fg :bold t))))
    `(show-paren-mismatch ((t (:foreground ,coal :background ,taffy))))

    ;; anzu
    `(anzu-match-1 ((t (:background ,lime :foreground ,coal))))
    `(anzu-match-2 ((t (:background ,dalespale :foreground ,coal))))
    `(anzu-match-3 ((t (:background ,orange :foreground ,coal))))
    `(anzu-mode-line ((t (:foreground ,dress))))
    `(anzu-replace-to ((t (:background ,tardis :foreground ,coal))))

    ;; rainbow-delimiters
    `(rainbow-delimiters-depth-1-face ((t (:foreground ,mediumgravel))))
    `(rainbow-delimiters-depth-2-face ((t (:foreground ,dalespale))))
    `(rainbow-delimiters-depth-3-face ((t (:foreground ,dress))))
    `(rainbow-delimiters-depth-4-face ((t (:foreground ,orange))))
    `(rainbow-delimiters-depth-5-face ((t (:foreground ,tardis))))
    `(rainbow-delimiters-depth-6-face ((t (:foreground ,lime))))
    `(rainbow-delimiters-depth-7-face ((t (:foreground ,toffee))))
    `(rainbow-delimiters-depth-8-face ((t (:foreground ,saltwatertaffy))))
    `(rainbow-delimiters-depth-9-face ((t (:foreground ,coffee))))
    `(rainbow-delimiters-unmatched-face ((t (:foreground ,taffy))))

    ;; eshell
    `(eshell-prompt ((t (:foreground ,tardis))))

    ;; which-function-mode
    `(which-func ((t :inherit font-lock-function-name-face)))

    ;; company
    `(company-echo-common ((t (:foreground ,plain))))
                                        ; `(company-preview ((t (:background ,popup-bg :foreground ,gravel))))
    `(company-preview-common ((t (:foreground , popup-fg))))
    `(company-preview-search ((t (:foreground ,tardis))))
    `(company-scrollbar-bg ((t (:background ,deepgravel))))
    `(company-scrollbar-fg ((t (:background ,mediumgravel))))
    `(company-tooltip ((t (:foreground ,plain :background ,popup-bg))))
    `(company-tooltip-annotation ((t (:foreground ,dress :background ,popup-bg))))
    `(company-tooltip-annotation-selection ((t (:foreground ,menu-selection-text :background , menu-selection-bg))))
    `(company-tooltip-common ((t (:foreground ,dress :background ,popup-bg))))
    `(company-tooltip-common-selection ((t (:foreground ,menu-selection-text :background , menu-selection-bg))))
    `(company-tooltip-mouse ((t (:inherit highlight))))
    `(company-tooltip-selection ((t (:background ,menu-selection-bg :foreground ,menu-selection-text))))
    `(company-template-field ((t (:inherit region))))

    ;; ido et al
    `(ido-first-match ((t (:foreground ,dirtyblonde))))
    `(ido-only-match ((t (:foreground ,orange))))
    `(ido-subdir ((t (:foreground ,plain))))
    `(ido-indicator ((t (:foreground ,lime))))
    `(ido-incomplete-regexp ((t (:foreground ,taffy :weight bold))))

    `(ido-vertical-match-face ((t (:weight normal :underline nil :foreground ,dirtyblonde))))

    `(flx-highlight-face ((t (:foreground ,dirtyblonde :weight normal :underline nil))))

    ;; ivy
    `(ivy-confirm-face ((t :foreground ,lime)))
    `(ivy-current-match ((t (:foreground , menu-selection-text :background ,menu-selection-bg))))
    `(ivy-match-required-face ((t :foreground ,taffy)))
    `(ivy-minibuffer-match-face-1 ((t :inherit nil)))
    `(ivy-minibuffer-match-face-2 ((t :inherit nil)))
    `(ivy-minibuffer-match-face-3 ((t :inherit nil)))
    `(ivy-minibuffer-match-face-4 ((t :inherit nil)))
    `(ivy-remote ((t :foreground ,tardis)))
    `(ivy-highlight-face ((t (:foreground ,tardis :background ,bg))))

    `(swiper-match-face-1 ((t :foreground ,plain)))
    `(swiper-match-face-2 ((t :foreground ,bg :background ,dalespale :bold t)))
    `(swiper-match-face-3 ((t :foreground ,bg :background ,dress :bold t)))
    `(swiper-match-face-4 ((t :foreground ,bg :background ,tardis :bold t)))

    ;; eglot
    `(eglot-highlight-symbol-face ((t :foreground ,plain :background ,purple :bold t)))
    `(eglot-inlay-hint-face ((t :foreground ,hint-text :background ,hint-bg :bold t)))

    ;; org
    `(outline-1 ((t (:foreground ,orange :height 1.2))))
    `(outline-2 ((t (:foreground ,dirtyblonde))))
    `(outline-3 ((t (:foreground ,brightgravel))))
    `(outline-4 ((t (:foreground ,toffee))))
    `(outline-5 ((t (:foreground ,dress))))

    `(org-done ((t (:foreground ,dress :weight bold))))
    `(org-todo ((t (:foreground ,dalespale :weight bold))))
    `(org-date ((t (:foreground ,tardis :underline t))))
    `(org-special-keyword ((t (:foreground ,taffy :weight bold))))
    `(org-document-info ((t (:foreground ,brightgravel))))
    `(org-document-title ((t (:foreground ,plain :family "sans" :height 1.8 :weight bold))))

    ;; erc
    `(erc-default-face ((t (:inherit default))))
    `(erc-notice-face ((t (:inherit font-lock-comment-face))))
    `(erc-nick-default-face ((t (:foreground ,taffy :bold t))))
    `(erc-nick-msg-face ((t (:inherit erc-nick-default-face))))
    `(erc-my-nick-face ((t (:foreground ,orange :bold t))))
    `(erc-current-nick-face ((t (:inherit erc-my-nick-face))))
    `(erc-direct-msg-face ((t (:foreground ,snow))))
    `(erc-input-face ((t (:foreground ,dress))))
    `(erc-prompt-face ((t (:foreground ,tardis))))
    `(erc-button ((t (:inherit link))))
    `(erc-timestamp-face ((t (:foreground ,lime))))

    ;; notmuch
    `(notmuch-tag-face ((t (:foreground ,dress))))

    ;; message
    `(message-cited-text ((t :foreground ,dirtyblonde)))
    `(message-header-cc ((t (:foreground ,plain))))
    `(message-header-name ((t (:foreground ,taffy))))
    `(message-header-other ((t (:foreground ,plain))))
    `(message-header-subject ((t (:foreground ,orange))))
    `(message-header-to ((t (:foreground ,plain))))
    `(message-header-xheader ((t (:foreground ,plain))))
    `(message-mml ((t (:foreground ,lightgravel))))

    ;; magit
    `(magit-bisect-bad ((t (:foreground ,taffy))))
    `(magit-bisect-good ((t (:foreground ,lime))))
    `(magit-bisect-skip ((t (:foreground ,orange))))
    `(magit-blame-heading ((t (:foreground ,tardis, :background ,magit-blame-user-colour))))
    `(magit-branch-local ((t (:foreground ,orange))))
    `(magit-branch-remote ((t (:foreground ,dress))))
    `(magit-diff-added ((t (:background ,bg :foreground ,lime))))
    `(magit-diff-added-highlight ((t (:background ,bg :foreground ,lime))))
    `(magit-diff-base ((t (:background ,bg :foreground ,dirtyblonde))))
    `(magit-diff-base-highlight ((t (:background ,bg :foreground ,dirtyblonde))))
    `(magit-diff-context ((t (:foreground ,lightgravel))))
    `(magit-diff-context-highlight ((t (:background ,bg :foreground ,magit-highlight))))
    `(magit-diff-removed ((t (:background ,bg :foreground ,taffy))))
    `(magit-diff-removed-highlight ((t (:background ,bg :foreground ,taffy))))
    `(magit-diff-lines-boundary ((t (:foreground ,bg :background ,dalespale))))
    `(magit-diff-lines-heading ((t (:background ,dalespale :foreground ,bg))))
    `(magit-diffstat-added ((t (:foreground ,lime :background ,bg))))
    `(magit-diffstat-removed ((t (:foreground ,taffy :background ,bg))))
    `(magit-dimmed ((t (:inherit shadow))))
    `(magit-header-line ((t (:foreground ,dirtyblonde :background, bg))))
    `(magit-log-author ((t (:foreground ,dirtyblonde))))
    `(magit-log-date ((t (:foreground ,magit-highlight))))
    `(magit-process-ng ((t (:inherit error))))
    `(magit-process-ok ((t (:foreground ,lime))))
    `(magit-section-heading ((t (:foreground ,dirtyblonde))))
    `(magit-section-heading-selection ((t (:foreground ,dalespale))))

    `(diff-added ((t (:background ,lime :foreground ,bg))))
    `(diff-changed ((t (:background ,yellow :foreground ,bg))))
    `(diff-removed ((t (:background ,taffy :foreground ,bg))))
    `(diff-refine-added ((t (:background ,lime :foreground ,bg))))
    `(diff-refine-changed ((t (:background ,taffy :foreground ,bg))))
    
    ;; smart-mode-line
    `(sml/global ((t (:foreground ,plain))))
    `(sml/vc-edited ((t (:foreground ,dress))))
    `(sml/vc ((t (:foreground ,orange))))
    `(sml/modified ((t (:foreground ,taffy :bold t))))
    `(sml/position-percentage ((t (:foreground ,orange))))

    ;; clojure
    `(clojure-keyword-face ((t (:foreground ,orange))))
    `(clojure-interop-method-face ((t (:foreground ,plain))))

    ;; diff-hl
    `(diff-hl-insert ((t ,(if k9-diff-hl-inverse
                            `(:background ,bg :foreground ,lime)
                            `(:background ,lime :foreground ,bg)))))
    `(diff-hl-delete ((t ,(if k9-diff-hl-inverse
                            `(:background ,bg :foreground ,dress)
                            `(:background ,dress :foreground ,bg)))))
    `(diff-hl-change ((t ,(if k9-diff-hl-inverse
                            `(:background ,bg :foreground ,dirtyblonde)
                            `(:background ,dirtyblonde :foreground ,bg)))))))

(cond
  ((eq k9-is-dark-mode nil)
    (let* (
            (beige "#ffffd7")
            (snow "#ffffff")
            (coal "#000000")
            (gravel "#857f78")
            (mediumgravel "#666462")
            (deepergravel "#35322d")
            (darkgravel "#242321")
            (blackgravel "#1c1b1a")
            (blackestgravel "#141413")
            (dalespale "#fade3e")
            (saltwatertaffy "#8cffba")
            (toffee "#b88853")
            (coffee "#c7915b")
            (darkroast "#88633f")
            (purple "#afafff")
            (default-text-color "#000000")
            (light-grey-bg "#eeeeee")
            (light-grey-text "#6b645c")
            (lighter-grey-text "#b7b5b4")
            (light-grey-selection-bg "#d9cec3")
            (yellow "#af8700")
            (dark-red "#800114")
            (tardis "#005faf")
            (orange "#cd5a00")
            (dark-orange "#ff8c00")
            (lime "#5f8700")
            (pink "#c6426a")
            (bg snow)
            (hl-line beige)
            (menu-selection-text snow)
            (menu-selection-bg tardis)
            (popup-bg light-grey-bg)
            (hint-text tardis)
            (hint-bg light-grey-bg)
            (dirtyblonde yellow)
            (taffy dark-red)
            (dress pink)
            (plain default-text-color)
            (brightgravel light-grey-bg)
            (lightgravel light-grey-text)
            (deepgravel light-grey-selection-bg)
            (popup-fg menu-selection-text)
            (magit-highlight coal)
            (fg coal)
            (magit-blame-user-colour lighter-grey-text)
            (white-space-text lighter-grey-text))
      
      (k9-set-colour-scheme)))
  (t (let* (
             (beige "#ffffd7")
             (snow "#ffffff")
             (coal "#000000")
             (gravel "#857f78")
             (mediumgravel "#666462")
             (deepergravel "#35322d")
             (darkgravel "#242321")
             (blackgravel "#1c1b1a")
             (blackestgravel "#141413")
             (dalespale "#fade3e")
             (saltwatertaffy "#8cffba")
             (toffee "#b88853")
             (coffee "#c7915b")
             (darkroast "#88633f")
             (purple "#943487")
             (default-text-color "#f8f6f2")
             (light-grey-bg "#d9cec3")
             (light-grey-text "#998f84")
             (light-grey-selection-bg "#45413b")
             (lighter-grey-text "#e5e3e1")
             (yellow "#f4cf86")
             (dark-red "#ff2c4b")
             (tardis "#0a9dff")
             (orange "#ffa724")
             (dark-orange "#ff8c00")
             (lime "#aeee00")
             (pink "#ff9eb8")
             (bg blackgravel)
             (hl-line darkgravel)
             (menu-selection-text snow)
             (menu-selection-bg tardis)
             (popup-bg light-grey-selection-bg) 
             (hint-text light-grey-text)
             (hint-bg darkgravel)
             (dirtyblonde yellow)
             (taffy dark-red)
             (dress pink)
             (plain default-text-color)
             (brightgravel light-grey-bg)
             (lightgravel light-grey-text)
             (deepgravel light-grey-selection-bg)
             (popup-fg menu-selection-text)
             (white-space-text light-grey-text)
             (magit-highlight brightgravel)
             (fg snow)
             (magit-blame-user-colour darkgravel)
             (popup-fg menu-selection-text))
       (k9-set-colour-scheme))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
    (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'k9)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; k9-theme.el ends here
