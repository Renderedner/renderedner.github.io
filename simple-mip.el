; «find-autossh-minipaste-links2»  (to ".find-autossh-minipaste-links2")
; «find-pacman-links-ss»  (to ".find-pacman-links-ss")
; «ochs-awk-cut-example»  (to ".ochs-awk-cut-example")
; «well-written-mip-scp-escript»  (to ".well-written-mip-scp-escript")

; Saving this file to github:
; (find-githubio-links "renderedner" "simple-mip.el" 2 " Upload the file" '(eek "2*C-l"))

; Ochs: Eu fiz algo parecido aqui:
; (find-wget-elisp "http://anggtwu.net/p/mip.el")


; «.well-written-mip-scp-escript»	(to "well-written-mip-scp-escript")
(defun ee-mip-brnm ()
(setq ee-mip-dir-local   "/tmp/mip/")
(setq ee-mip-dir-remote  "/tmp/mip/")
(setq ee-mip-user-remote "redner_vps@justclaymoving.xyz")
(setq ee-mip-http-remote "http://justclaymoving.xyz/")
(setq ee-mip-http-port   "8888"))

(find-wget-elisp "http://anggtwu.net/p/mip.el")
(find-wget-elisp "http://anggtwu.net/p/mip.el" "ee-minipaste-find-wgets")
(find-efunction 'ee-minipaste-find-wgets)
;;       (ee-mip-brnm)
;; Test: (eepitch-mip-hs)
;; Test: (find-estring-sh (ee-mip-hs-0))
;; Test: (find-estring-sh (ee-mip-scp-0 "o"))





; «.ochs-awk-cut-example»	(to "ochs-awk-cut-example")
; (find-man "cut")
; (find-man "cut" "-f, --fields=LIST" "select only these fields")
; (find-man "cut" "-d" "use DELIM instead of TAB for field delimiter")
 (eepitch-shell)
 (eepitch-kill)
 (eepitch-shell)
STR=ssh
STR=firefox
    ss -atnp
    ss -atnp | grep $STR
    ss -atnp | grep $STR | awk '{print $4}'
    ss -atnp | grep $STR | awk '{print $4}' | cut -d: -f2
    ss -atnp | grep $STR | awk '{print $4}' | cut -d: -f2 | head -n1
N=$(ss -atnp | grep $STR | awk '{print $4}' | cut -d: -f2 | head -n1)
echo $N



; «.find-pacman-links-ss»	(to "find-pacman-links-ss")
; ; (find-pacman-links "ss")
; core/iproute2 7.2.0-1 [installed]
;     usr/bin/ss
; extra/gstreamer-docs 1.28.7-2
;     usr/share/doc/gstreamer/html/assets/js/search/ss
; extra/ucblogo 6.2.5-4
;     usr/share/ucblogo/helpfiles/ss




; «.find-autossh-minipaste-links2»	(to "find-autossh-minipaste-links2")
;; Skel: (find-find-links-links-new "autossh-minipaste" "fullfname" "fname")
;; Test: (find-autossh-minipaste-links2)
;;
(defun find-autossh-minipaste-links2 (&optional fullfname &rest pos-spec-list)
"Visit a temporary buffer containing hyperlinks for autossh-minipaste."
  (interactive)
  (setq fullfname (or fullfname "{fullfname}"))
  (let* ((fname (file-name-nondirectory fullfname)))
    (apply
     'find-elinks
     `((find-autossh-minipaste-links2 ,fullfname ,@pos-spec-list)
       ;; Convention: the first sexp always regenerates the buffer.
       (find-efunction 'find-autossh-minipaste-links2)
       ""
       (find-daily "03-10-2026.org" ".mip-autossh")
       ""
       (find-man "ssh" "-N" "Do not execute a remote command.")
       (find-man "ssh" "-R [bind_address:]port" "given TCP port or Unix socket on" "the remote (server) host are to be forwarded to the local side")
       ""
       (find-man "8 ss")
       (find-sh "ss --help")
       (find-sh "ss --help" "-a, --all")
       (find-sh "ss --help" "-t, --tcp")
       (find-sh "ss --help" "-n, --numeric")
       (find-sh "ss --help" "-p, --processes")
       (find-sh "ss -atnp")

       ""
     ,(ee-template0 "\
 (find-3EE '(eepitch-vterm) '(eepitch-vps))
 (find-3ee '(eepitch-vterm) '(eepitch-vps))
 (eepitch-vterm)
ss -atn -p | grep ssh
 (eepitch-vps)
ss -atn -p | grep ssh

 (eepitch-vterm)
ssh  -fNR 8888:localhost:80 redner_vps@justclaymoving.xyz
ss -atn -p | grep ssh
sudo kill 96675

 (eepitch-vps)
ss -atn -p | grep ssh
ss -atn -p 


# (find-fline \"/tmp/mip/\")
# (find-eev \"eepitch.el\" \"eepitch-shell\")

 (eepitch '(shell \"shell-mip-server\")
mkdir -p /tmp/mip/
# cp {fullfname} /tmp/mip/
cd      /tmp/mip
# rm -f {fname}
ln --symbolic {fullfname}
sudo python -m http.server 80 -d /tmp/mip
")
     ,(ee-minipaste-find-wgets "http://justclaymoving.xyz/" fname)
       )
     pos-spec-list)))

(defun ee-minipastedir         () "/tmp/mip/")
(defun ee-minipaste-configured () (file-directory-p (ee-minipastedir)))
      (ee-minipaste-configured)

(defun find-autossh-minipaste-dwim (fullfname)
  (interactive (list (buffer-file-name)))
  (find-autossh-minipaste-links2 fullfname)
  (end-of-buffer)
  (backward-paragraph 2)
  (forward-line))

(defalias 'amip 'find-autossh-minipaste-dwim)
