;; -*- lexical-binding: t -*-

(load-theme 'wombat)

;; Set the font to be 'Maple Mono' at 22px tall
;; You can get the full list of fonts by running:
;; C-x C-e on the expression below:
;;   (x-list-fonts "*") <-- Right here!
(if (x-list-fonts "Maple Mono")
  (set-frame-font "Maple Mono-22" nil))

;; Show the file column number on the left hand side!
(setq column-number-mode t)

;; Always do this! Not just for files
(global-display-line-numbers-mode t)

;; Show spaces left at the end of the line, like so:
;; adasd 
(setq global-whitespace-mode t)

;; Dont use tabs for indent, use spaces
(setq indent-tabs-mode nil)
;; Default to making the tab button insert two spaces
(setq tab-width 2)

;; Display 'white-space' (spaces, tabs, etc) - this
;;   controls what gets displayed for 'global-whitespace-mode'
(setq whitespace-style '(face trailing tabs tab-mark))

;; Remove the 'menu-bar' which is basically a bunch of
;; ugly icons at the top of the screen
(menu-bar-mode 0)

;; Remove the 'tool-bar' which is a lot like the menu bar
;; But holds slightly different content
(tool-bar-mode 0)

;; Display the scroll bar!
(setq scroll-bar-mode t)

(setq using-small-screen t)
(when using-small-screen
  ;; These two variables tell emacs not to 'split'
  ;; the window so much
  (setq split-height-threshold nil)
  (setq split-width-threshold nil))

;; On load, setup the window to be centered
(let* ((-screen-sizes (frame-monitor-geometry))
	(-screen-width (caddr -screen-sizes))
	(-screen-height (cadddr -screen-sizes))
	(-padding 50)
	(-width (- -screen-width (* 3 -padding)))
	(-height (- -screen-height (* 3 -padding)))
	(-frame (frame-root-frame)))
  (set-frame-size-and-position-pixelwise
    -frame
    -width
    -height
    -padding
    -padding))

