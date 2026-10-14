;; Skel: (find-find-links-links-new "autossh-minipaste" "fullfname" "fname")
;; Test: (find-autossh-minipaste-links)
;;
(defun find-autossh-minipaste-links (&optional fullfname &rest pos-spec-list)
"Visit a temporary buffer containing hyperlinks for autossh-minipaste."
  (interactive)
  (setq fullfname (or fullfname "{fullfname}"))
  (let* ((fname (file-name-nondirectory fullfname)))
    (apply
     'find-elinks
     `((find-autossh-minipaste-links ,fullfname ,@pos-spec-list)
       ;; Convention: the first sexp always regenerates the buffer.
       (find-efunction 'find-autossh-minipaste-links)
       ""
       (find-daily "03-10-2026.org" ".mip-autossh")
       ""
       (find-man "autossh" "-M port[:echo_port]" "specifies  the base monitoring port")
       (find-man "autossh" "-f" "causes autossh to drop to the background")
       (find-man "ssh" "-N" "Do not execute a remote command.")
       (find-man "ssh" "-R [bind_address:]port" "given TCP port or Unix socket on" "the remote (server) host are to be forwarded to the local side")
       (find-man "ss" "ss  is used to dump socket statistics")
       (find-man "ss" "-p, --processes" "Show processes using sockets.")
       ""
     ,(ee-template0 "\
 (find-3EE '(eepitch-vterm) '(eepitch-vps))
 (find-3ee '(eepitch-vterm) '(eepitch-vps))
 (eepitch-vterm)
ss -atn -p | grep ssh
 (eepitch-vps)
ss -atn -p | grep ssh

 (eepitch-vterm)
export AUTOSSH_PIDFILE=$HOME/AUTOSSH_PIDFILE; autossh -M 23000 -f -N -R 8888:localhost:80 redner_vps@justclaymoving.xyz
cat  $HOME/AUTOSSH_PIDFILE
ps -e | grep $(cat $HOME/AUTOSSH_PIDFILE)
ss -atn -p | grep ssh
# sudo kill $(cat $HOME/AUTOSSH_PIDFILE)
# killall autossh

 (eepitch-vps)
ss -atn -p | grep ssh
ss -atn -p 


 (eepitch-shell)
mkdir -p /tmp/mip/
# cp {fullfname} /tmp/mip/
cd      /tmp/mip
# rm -f {fname}
ln --symbolic {fullfname}
sudo python -m http.server 80 -d /tmp/mip
")
     ,(ee-minipaste-find-wgets "http://justclaymoving.xyz" fname)
       )
     pos-spec-list)))

(defun ee-minipastedir         () "/tmp/mip/")
(defun ee-minipaste-configured () (file-directory-p (ee-minipastedir)))
      (ee-minipaste-configured)

(defun find-autossh-minipaste-dwim (fullfname)
  (interactive (list (buffer-file-name)))
  (find-autossh-minipaste-links fullfname)
  (end-of-buffer)
  (backward-paragraph 2)
  (forward-line))

(defalias 'amip 'find-autossh-minipaste-dwim)
