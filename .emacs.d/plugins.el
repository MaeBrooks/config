(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)
(package-install 'gnu-elpa-keyring-update)
(package-install 'vertico)

(vertico-mode)
(setq completion-styles '(substring basic))
