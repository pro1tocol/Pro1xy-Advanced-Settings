# Tro1jan build process
------------------------

## install tools
### Configure the certificate in the case of having a domain name

  1.Install prerequisites

    socat
  2.Call script

    curl https://get.acme.sh | sh
  3.Build script link

    ln -s  /root/.acme.sh/acme.sh /usr/local/bin/acme.sh
### Build and manage firewall

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
### Install web tools

  1.Install and manager
  
    curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
    epel-release
    nginx
    nginx-all-modules.noarch
  2.Process daemon
  
    systemctl status nginx.service
    systemctl start nginx.service
    systemctl stop nginx.service
    systemctl enable nginx.service
    systemctl disable nginx.service
 ### Install [Trojan-go](https://github.com/p4gefau1t/trojan-go) check [`releases`](https://github.com/p4gefau1t/trojan-go/releases)
 
   1.Grab and compile correspond to the system version server
   
     mkdir file && cd */file
     wget
     unzip
 ------------------------
 # Prepare two domain names
 ##  Deploy tls certificate(Needs to be done without `firewall` and without `nginx` daemon)
 
     acme.sh --register-account -m your@Email.com
     acme.sh  --issue -d your-web.domain-name.com  --standalone -k ec-256
     acme.sh  --issue -d your-proxy.domain-name.com  --standalone -k ec-256
   If the application fails, toggle:
   
     acme.sh --set-default-ca --server letsencrypt
     acme.sh --set-default-ca --server buypass
     acme.sh --set-default-ca --server zerossl
   Install and copy the certificate to the `trojan` directory certificate
   
     acme.sh --installcert -d your-web.domain-name.com --ecc  --key-file   */trojan/server1.key   --fullchain-file */trojan/server1.crt
     acme.sh --installcert -d your-proxy.domain-name.com --ecc  --key-file   */trojan/server2.key   --fullchain-file */trojan/server2.crt
 ------------------------
 # Open firewall ports `80` and `443`
 
     ufw allow 80
     ufw allow 443
 ------------------------
     
 
