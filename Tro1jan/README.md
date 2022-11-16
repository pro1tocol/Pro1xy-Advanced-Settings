# Tro1jan build process
------------------------

## install tools
### Configure the certificate in the case of having a domain name

  1.Install prerequisites

    socat
    cron
    crontab
    crontabs
    openssl
  2.Call [`ACME Shell`](https://github.com/acmesh-official/acme.sh) script

    curl https://get.acme.sh | sh
  3.Build script link

    ln -s  /root/.acme.sh/acme.sh /usr/local/bin/acme.sh

### Install web tools

  1.Install and manager
  
    curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
    epel-release
    nginx
    nginx-all-modules.noarch
  2.Process daemon
  
    systemctl status nginx.service
    systemctl start nginx.service
    systemctl reload nginx.service
    systemctl stop nginx.service
    systemctl enable nginx.service
    systemctl disable nginx.service
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
 ### Install [Trojan-go](https://github.com/p4gefau1t/trojan-go) check [`releases`](https://github.com/p4gefau1t/trojan-go/releases)
 
   1.Grab and compile correspond to the system version server
   
     mkdir file && cd */file
     wget
     unzip
 ------------------------
 # Open firewall ports `80` and `443`
 
     ufw allow 80
     ufw allow 443
 ------------------------
 # Prepare two domain-names
   Switch certificate issuers:
   
     acme.sh --set-default-ca --server letsencrypt
     acme.sh --set-default-ca --server buypass
     acme.sh --set-default-ca --server zerossl
 ##  Deploy tls certificate(Needs to be done without `firewall` and without `nginx` daemon)
 
     acme.sh --register-account -m your@Email.com
     acme.sh  --issue -d your-web.domain-name.com  --standalone -k ec-256
     acme.sh  --issue -d your-proxy.domain-name.com  --standalone -k ec-256
   Install and copy the certificate to the `trojan` directory certificate
   
     acme.sh --installcert -d your-web.domain-name.com --ecc  --key-file   /trojan/server1.key   --fullchain-file /trojan/server1.crt
     acme.sh --installcert -d your-proxy.domain-name.com --ecc  --key-file   /trojan/server2.key   --fullchain-file /trojan/server2.crt
 ------------------------
 # Download [`nginx.conf`](https://github.com/pro1tocol/Pro1xy-Advanced-Settings/raw/main/Tro1jan/nginx.conf) overwrite saved in `/etc/nginx`
 Certificate based configuration
 check error：
 
     /usr/sbin/nginx -t -q
 [emerg] getpwnam("nginx") failed
 
     useradd -s /bin/false nginx
 [emerg] unknown directive "stream"
 
     vim /etc/nginx/nginx.conf
     [debian]: load_module /usr/lib/nginx/modules/ngx_stream_module.so;
     [centos]: load_module '/usr/lib64/nginx/modules/ngx_stream_module.so';
 ------------------------
 # Download [`config.json`](https://github.com/pro1tocol/Pro1xy-Advanced-Settings/raw/main/Tro1jan/config.json) overwrite saved in `*/trojan`
 Certificate based **nginx.conf** file
 
 ------------------------
 # RUN
 ### Make sure the `ufw.service` process is active
 ### Make sure the `nginx.service` process is active
 test first running
 
    ./trojan-go
 `Clash` client setting
 
    proxies:
    - name: "\U0001F1ED\U0001F1F0 test | 01"
      server: cdn.address.com
      port: 443
      type: trojan
      password: password-password-password-password
      network: ws
      ws-opts:
         path: /file
         headers:
            Host: your-proxy.domain-name.com
      sni: your-proxy.domain-name.com
      skip-cert-verify: false
      udp: true
      
    proxy-groups:
    - name: proxy
      type: select
      proxies:
    - "\U0001F1ED\U0001F1F0 test | 01"
 Background process
 
    nohup ./trojan-go > /trojan/trojan.log 2>&1 &
 Show process
 
    watch -n 1 "cat /trojan/trojan.log"
 ------------------------
 # Other commands
 
    ps -aux
    journalctl -l
    journalctl -l | grep cpu
    journalctl -u nginx.service
    journalctl -u ufw.service
 ------------------------
 # Self-start [`trojan-go.service`](https://github.com/pro1tocol/Pro1xy-Advanced-Settings/raw/main/Tro1jan/trojan-go.service) saved in `/etc/systemd/system`
 
    systemctl status trojan-go.service
    systemctl start trojan-go.service
    systemctl reload trojan-go.service
    systemctl stop trojan-go.service
    systemctl enable trojan-go.service
    systemctl disable trojan-go.service
------------------------
# [`Check IP tools`](https://github.com/XIU2/CloudflareSpeedTest/releases/latest)
## [`IP-scanner list`](https://github.com/ip-scanner/cloudflare)
unzip && open cmd: type *.txt>>all.txt
    
    copy all.txt /file
    .\CloudflareST.exe
