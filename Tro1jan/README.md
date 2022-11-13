# Tro1jan build process
------------------------

### install tools
Configure the certificate in the case of having a domain name
  1.Install prerequisites

    socat
  2.Call script

    curl https://get.acme.sh | sh
  3.Build script link

    ln -s  /root/.acme.sh/acme.sh /usr/local/bin/acme.sh
Build and manage firewall
  1.Install and manager
  
    ufw
    ufw status
    ufw status numbered
    ufw delete <number>
    ufw allow <port>
    ufw deny <port>
  2.Process daemon
  
    systemctl status ufw.service
    systemctl start ufw.service
    systemctl stop ufw.service
    systemctl enable ufw.service
    systemctl disable ufw.service
