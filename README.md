# Pro1xy-Advanced-Settings-0.2.7
---------------------------

Mainly for `Clash` and related custom settings

       ___          ___             ___                __         __ 
      / _ \_______ <  /_ ____ __   / _/__  ____   ____/ /__ ____ / / 
     / ___/ __/ _ \/ /\ \ / // /  / _/ _ \/ __/  / __/ / _ `(_-</ _ \
    /_/  /_/  \___/_//_\_\\_, /  /_/ \___/_/     \__/_/\_,_/___/_//_/
                         /___/                                          
## Project use for Linux
1.If you haven't installed the tool yet, click: [`Clash for releases`](https://github.com/Dreamacro/clash/releases) download the required version

`gzip -d` && `chmod +x` Unzip and authorize

2.Good-looking visual version, click: [`yacd(haishanh) for Clash`](https://github.com/haishanh/yacd/releases/) download the **tar.xz** file

`tar -xvJf` && `mv dashboard` Unzip and rename

3.Run rules

    log-level: info
    # Add GUI settings
    external: 'dashboard'
save and `./clash` run

    ./clash -t        //test socks status
    ./calsh -d        //string test current HTTP dynamic
    ./clash -d .      //and test run
    nohup ./clash &   //run in the background and output to nohup.out

---------------------------
## Other system versions link
1.Windows check: [ClashN](https://github.com/2dust/clashN/releases) download the **.zip** file

2.MacOS check: [ClashX](https://github.com/yichengchen/clashX/releases) download the **.dmg** file

3.IOS check: [Stash(App Store)](https://apps.apple.com/tw/app/stash/id1596063349) installer

3.Android check: [Clash(Google Play)](https://play.google.com/store/apps/details?id=com.github.kr328.clash&hl=zh&gl=US&pli=1) installer
---------------------------
# Transparent Gateway Settings
Principle analysis

|------------------------------------------------------------|

  `Main-route`   ==direction(gateway/dns)==>   `Bypass-route`

  `Bypass-route` ===direction(gateway)===>   `Main-route`

   Bypass-route set static IP address

|------------------------------------------------------------|

## Bypass settings

`No.1` 

Start routing forwarding

    vim /etc/sysctl.conf
    net.ipv4.ip_forward=1
    
    sysctl -p
Configure static IP

    vim /etc/network/interfaces
    # The primary network interface
    allow-hotplug eth0
    iface eth0 inet static
    address 192.168.0.104                 #set to an unassigned IP address
    netmask 255.255.255.0
    gateway 192.168.0.1                   #set as your main routing gateway
Configure local DNS

    vim /etc/resolv.conf
    nameserver 114.114.114.114
    nameserver 8.8.8.8
`No.2` Bypass gateway autostart

    cd /usr/bin
download [Clash-Premium](https://github.com/Dreamacro/clash/releases/tag/premium)

    gzip -d && mv
    clash -t                              #test ruunning
    
    cd /etc/systemd/system
    wget https://github.com/pro1tocol/Pro1xy-Advanced-Settings/raw/main/clash.service
    systemctl status clash                #show status
    systemctl enable clash                #settingautostart
 `No.3` Clash configuration part
 
    cd ~/.config/clash && vim config.yaml
    
    port: 5770
    socks-port: 5771
    redir-port: 5772
    allow-lan: true                       #must be configured as a LAN share
    mode: rule
    log-level: info
    external-controller: '0.0.0.0:9090'   #optional
    secret: ''
    dns:
      enable: true
      listen: 0.0.0.0:53
      enhanced-mode: fake-ip
      nameserver:
       - 114.114.114.114
      fallback:
       - 8.8.8.8
    tun:
      enable: true
      stack: system # or gvisor
      dns-hijack:
       - any:53
       - tcp://any:53
      auto-route: true
      auto-detect-interface: true
## Main settings

Enter DHCP server settings

    gateway     192.168.0.104
    FirstDNS    114.114.114.114
    BackupDNS   8.8.8.8
