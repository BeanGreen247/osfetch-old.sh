# osfetch.sh
script that fetches system information and displays it to the user

temp data storage is used and explained inside the script itself

custom data formatting using awk

data clean up using awk, grep, expr and cat

about 2x faster compared to neofetch
```bash
|beangreen247@IdeaPad-5-14ITL05 [22:45:12] ~ branch:|
>>> time ./scripts/osfetch.sh
Os: Linux Mint 21.1
Host Name: IdeaPad-5-14ITL05
Kernel: 5.15.0-72-generic
Uptime: Days:0 Hours:08 Minutes:02 Seconds:38
Packages: 2545
CPU: 11th Gen Intel(R) Core(TM) i5-1135G7 @ 2.40GHz (8)
CPU Current Clockspeed: 2.4 GHz
GPU: Intel Corporation TigerLake-LP GT2 [Iris Xe Graphics] (rev 01) (prog-if 00 [VGA controller])
Memory: 5651MiB/16164MiB
Cached Memory: 7959MiB
Available Memory: 10513MiB

real	0m0,277s
user	0m0,059s
sys	0m0,014s
|beangreen247@IdeaPad-5-14ITL05 [22:45:22] ~ branch:|
>>> time neofetch 
             ...-:::::-...                 beangreen247@IdeaPad-5-14ITL05 
          .-MMMMMMMMMMMMMMM-.              ------------------------------ 
      .-MMMM`..-:::::::-..`MMMM-.          OS: Linux Mint 21.1 x86_64 
    .:MMMM.:MMMMMMMMMMMMMMM:.MMMM:.        Host: 82FE IdeaPad 5 14ITL05 
   -MMM-M---MMMMMMMMMMMMMMMMMMM.MMM-       Kernel: 5.15.0-72-generic 
 `:MMM:MM`  :MMMM:....::-...-MMMM:MMM:`    Uptime: 8 hours, 2 mins 
 :MMM:MMM`  :MM:`  ``    ``  `:MMM:MMM:    Packages: 2546 (dpkg) 
.MMM.MMMM`  :MM.  -MM.  .MM-  `MMMM.MMM.   Shell: bash 5.1.16 
:MMM:MMMM`  :MM.  -MM-  .MM:  `MMMM-MMM:   Resolution: 2560x1440 
:MMM:MMMM`  :MM.  -MM-  .MM:  `MMMM:MMM:   DE: Xfce 4.16 
:MMM:MMMM`  :MM.  -MM-  .MM:  `MMMM-MMM:   WM: Xfwm4 
.MMM.MMMM`  :MM:--:MM:--:MM:  `MMMM.MMM.   WM Theme: Mint-Y-Legacy-Dark-Blue 
 :MMM:MMM-  `-MMMMMMMMMMMM-`  -MMM-MMM:    Theme: Mint-Y-Legacy-Dark-Blue [GTK2/3] 
  :MMM:MMM:`                `:MMM:MMM:     Icons: ePapirus-Dark [GTK2/3] 
   .MMM.MMMM:--------------:MMMM.MMM.      Terminal: xfce4-terminal 
     '-MMMM.-MMMMMMMMMMMMMMM-.MMMM-'       Terminal Font: Monospace 10 
       '.-MMMM``--:::::--``MMMM-.'         CPU: 11th Gen Intel i5-1135G7 (8) @ 4.200GHz 
            '-MMMMMMMMMMMMM-'              GPU: Intel TigerLake-LP GT2 [Iris Xe Graphics] 
               ``-:::::-``                 Memory: 5196MiB / 15785MiB 

real	0m0,389s
user	0m0,117s
sys	0m0,066s
```

---
BeanGreen247, 2023
