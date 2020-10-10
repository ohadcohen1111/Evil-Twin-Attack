# Evil-Twin-Attack







**Introduction**  
  
  This project provides several abilities to perform an Evil Twin attack.  
  - Scanning available access points with the selected network adapter
  - Creating a fake access point with the same ESSID as the one you want
  - Sending packets to disconnect the victim from the current access point
  - Stealing victim Facebook credentials by providing the victim a fake Facebook login page
  - Protecting script to alert the user from Evil-Twin attack


**Requirements** 

- Kali linux system  
- Wifi adapter
- Hostapd to create the access point, so it is highly configurable.  
- Dnsmasq to run the dhcp and dns services.  
- Apache with help of dnsmasq to launch spoofed webpages as well as captive portals!  


**Installation**  

` git clone https://github.com/ohadcohen1111/Evil-Twin-Attack.git `

**Set up**  

First, we need to move the website files to the local webserver:  
  
`sudo su`  
`thunar`  
  
  
It's will open a folder, Enter the folder "System operation", then Enter the  var/www/html, delete all the files in there.  
Move the files index.html, password.txt, facebook.svg to this folder.

**Usage**  

To run the program  

`./menu`  

1) Install
2) Scan Access Point  
3) Evil Twin Attack

**Photos**  
  
  
![](Images/1.png )  
  
  
![](Images/2.png ) 
  
  
![](Images/3.png )  
  
  
![](Images/4.png )  
  
  
