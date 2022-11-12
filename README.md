# Pro1xy-Advanced-Settings
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

2.Good-looking visual version, click: [`yacd(haishanh) for Clash`](https://github.com/haishanh/yacd/releases/) download the ==tar.xz== file

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
