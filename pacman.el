;; Original: 
;;   (find-efunction 'find-pacman-links)
;;   (find-eev "eev-tlinks.el" "find-pacman-links")
;; See: (find-es "archlinux" "pacman-hints")


;; Skel: (find-find-links-links-new "pacman" "pkg" "")
;; Test: (find-pacman-links)
;;
(defun find-pacman-links (&optional pkg &rest pos-spec-list)
"Visit a temporary buffer containing hyperlinks for pacman."
  (interactive)
  (setq pkg (or pkg "{pkg}"))
  (apply
   'find-elinks
   `((find-pacman-links ,pkg ,@pos-spec-list)
     ;; Convention: the first sexp always regenerates the buffer.
     (find-efunction 'find-pacman-links)
     ""
     ,(ee-template0 "\
# https://archlinux.org/packages/?sort=&q={pkg}&maintainer=&flagged=
# https://archlinux.org/packages/extra/x86_64/{pkg}/
# https://archlinux.org/packages/extra/x86_64/{pkg}/files/
# https://en.wikipedia.org/wiki/Arch_Linux#Pacman
# https://pacman.archlinux.page/pacman.8.html
# https://archlinux.org/packages/
# (find-man \"8 pacman\")
# (find-sh \"pacman -Q --help\")
# (find-sh \"pacman -S --help\")
# (find-sh \"pacman -F --help\")

# (find-sh \"pacman -F {pkg}\")

 (eepitch-shell)
 (eepitch-kill)
 (eepitch-shell)
sudo pacman -S {pkg}

# 
# NEW SECTION:
#

# (find-man \"8 pacman\" \"-F, --files\" \"look for pack\" \"ages owning certain files or display files owned by certain  packages\")
# (find-sh \"pacman -F --help\")
 (eepitch-shell)
 (eepitch-kill)
 (eepitch-shell)
pacman -F perl

 (eepitch-shell)
 (eepitch-kill)
 (eepitch-shell)
pacman -Ss
pacman -Ss '^perl-'
pacman -Ss '^perl-' | grep ^[a-z]

# (find-man \"8 pacman\" \"-Q, --query\" \"view in\" \"stalled packages and their files\")
 (eepitch-shell)
 (eepitch-kill)
 (eepitch-shell)
pacman -Qs 
pacman -Qs '^perl-'
pacman -Qs '^perl-' | grep ^[a-z]
")
     )
   pos-spec-list))
