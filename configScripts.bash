Configuration Scripts
1. Core Router Configuration
enable
configure terminal
interface FastEthernet0/0
 ip address 192.168.255.1 255.255.255.0
 no shutdown
 exit
ip routing
ip route 192.168.0.0 255.255.254.0 192.168.255.2 
ip route 192.168.2.0 255.255.255.0 192.168.255.2 
ip route 192.168.3.0 255.255.255.0 192.168.255.2  
ip route 192.168.4.0 255.255.255.0 192.168.255.2 
ip route 192.168.5.0 255.255.255.0 192.168.255.2  
ip route 192.168.6.0 255.255.255.0 192.168.255.2  
ip route 192.168.7.0 255.255.255.0 192.168.255.2   
ip route 192.168.8.0 255.255.255.0 192.168.255.2   
ip route 192.168.9.0 255.255.255.128 192.168.255.2 
copy running-config startup-config
exit________________________________________
2. Core L3 Switch Configuration
enable
configure terminal

vlan 10
 name Computer_Eng_Students
vlan 20
 name Computer_Eng_Staff
vlan 30
 name Computer_Eng_Other_Devices
vlan 40
 name EEE_Students
vlan 50
 name EEE_Staff
vlan 60
 name EEE_Other_Devices
vlan 70
 name Civil_Eng_Students
vlan 80
 name Civil_Eng_Staff
vlan 90
 name Civil_Eng_Other_Devices
vlan 100
 name Mech_Eng_Students
vlan 110
 name Mech_Eng_Staff
vlan 120
 name Mech_Eng_Other_Devices
vlan 130
 name IDS_Students
vlan 140
 name IDS_Staff
vlan 150
 name IDS_Other_Devices
vlan 160
 name Admin_Staff
vlan 170
 name Admin_Printers
vlan 180
 name CCTV_Cameras
exit

interface GigabitEthernet0/1
 description Link to Core Router
 no switchport
 ip address 192.168.255.2 255.255.255.0
 no shutdown
 exit

interface FastEthernet0/1
 description Link to Computer Eng L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk                
 no shutdown
 exit

interface FastEthernet0/2
 description Link to EE Eng L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk            
 no shutdown
 exit

interface FastEthernet0/3
 description Link to Civil Eng L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit

interface FastEthernet0/4
 description Link to Mech Eng L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit

interface FastEthernet0/5
 description Link to IDS L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit

interface FastEthernet0/6
 description Link to Admin L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit

interface FastEthernet0/7
 description Link to CCTV L2 Switch
 switchport mode access
 switchport access vlan 180           
 no shutdown
 exit

write memory
exit


interface Vlan10
 ip address 192.168.0.1 255.255.254.0
 exit

interface Vlan20
 ip address 192.168.2.1 255.255.255.128
 exit

interface Vlan30
 ip address 192.168.2.129 255.255.255.192
 exit

interface Vlan40
 ip address 192.168.3.1 255.255.255.0
 exit

interface Vlan50
 ip address 192.168.4.1 255.255.255.128
 exit

interface Vlan60
 ip address 192.168.4.129 255.255.255.224
 exit

interface Vlan70
 ip address 192.168.5.1 255.255.255.128
 exit

interface Vlan80
 ip address 192.168.5.129 255.255.255.192
 exit

interface Vlan90
 ip address 192.168.5.193 255.255.255.240
 exit

interface Vlan100
 ip address 192.168.6.1 255.255.255.128
 exit

interface Vlan110
 ip address 192.168.6.129 255.255.255.192
 exit

interface Vlan120
 ip address 192.168.6.193 255.255.255.224
 exit

interface Vlan130
 ip address 192.168.7.1 255.255.255.224
 exit

interface Vlan140
 ip address 192.168.7.33 255.255.255.192
 exit

interface Vlan150
 ip address 192.168.7.97 255.255.255.240
 exit

interface Vlan160
 ip address 192.168.8.1 255.255.255.192
 exit

interface Vlan170
 ip address 192.168.8.65 255.255.255.240
 exit

interface Vlan180
 ip address 192.168.9.1 255.255.255.128
 exit

ip routing
ip default-gateway 192.168.255.1

write memory
exit________________________________________
3. Department L3 Switch Configuration
Commands for Computer Engineering L3 Switch:
enable
configure terminal

vlan 10
 name Com_Eng_Students
vlan 20
 name Com_Eng_Staff
vlan 30
 name Com_Eng_Other_Devices
exit
________________________________________
interface GigabitEthernet0/1
 description Link to Core L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit

interface GigabitEthernet0/2
 description Link to Com Eng L2 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit
________________________________________
interface Vlan10
 description Com Eng Students
 ip address 192.168.0.1 255.255.254.0  
 no shutdown
 exit

interface Vlan20
 description Com Eng Staff
 ip address 192.168.2.1 255.255.255.128  
 no shutdown
 exit

interface Vlan30
 description Com Eng Other Devices
 ip address 192.168.2.129 255.255.255.192  
 no shutdown
 exit
________________________________________
ip routing
ip default-gateway 192.168.255.2
________________________________________
write memory
exit

EEE L3 Switch Configuration
enable
configure terminal

vlan 40
 name EEE_Students
vlan 50
 name EEE_Staff
vlan 60
 name EEE_Other_Devices
exit
________________________________________
interface GigabitEthernet0/1
 description Link to Core L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk                
 no shutdown
 exit

interface GigabitEthernet0/2
 description Link to EEE L2 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit
________________________________________
interface Vlan40
 description EEE Students
 ip address 192.168.3.1 255.255.255.0  
 no shutdown
 exit

interface Vlan50
 description EEE Staff
 ip address 192.168.4.1 255.255.255.128  
 no shutdown
 exit

interface Vlan60
 description EEE Other Devices
 ip address 192.168.4.129 255.255.255.224  
 no shutdown
 exit

ip routing
ip default-gateway 192.168.255.2
________________________________________
write memory
exit
________________________________________
Civil Eng L3 Switch Configuration
enable
configure terminal
vlan 70
 name Civil_Eng_Students
vlan 80
 name Civil_Eng_Staff
vlan 90
 name Civil_Eng_Other_Devices
exit

interface GigabitEthernet0/1
 description Link to Core L3 Switch
 switchport trunk encapsulation dot1q 
 switchport mode trunk              
 no shutdown
 exit
interface GigabitEthernet0/2
 description Link to Civil Eng L2 Switch
 switchport trunk encapsulation dot1q 
 switchport mode trunk             
 no shutdown
 exit
________________________________________interface Vlan70
 description Civil Eng Students
 ip address 192.168.5.1 255.255.255.128  
 no shutdown
 exit
interface Vlan80
 description Civil Eng Staff
 ip address 192.168.5.129 255.255.255.192  
 no shutdown
 exit
interface Vlan90
 description Civil Eng Other Devices
 ip address 192.168.5.193 255.255.255.240 
 no shutdown
 exit

ip routing
ip default-gateway 192.168.255.2
________________________________________
write memory
exit
________________________________________

Mech Eng L3 Switch Configuration
enable
configure terminal
vlan 100
 name Mech_Eng_Students
vlan 110
 name Mech_Eng_Staff
vlan 120
 name Mech_Eng_Other_Devices
exit

interface GigabitEthernet0/1
 description Link to Core L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk                
 no shutdown
 exit
interface GigabitEthernet0/2
 description Link to Mech Eng L2 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk               
 no shutdown
 exit

interface Vlan100
 description Mech Eng Students
 ip address 192.168.6.1 255.255.255.128  
 no shutdown
 exit
interface Vlan110
 description Mech Eng Staff
 ip address 192.168.6.129 255.255.255.192  
 no shutdown
 exit
interface Vlan120
 description Mech Eng Other Devices
 ip address 192.168.6.193 255.255.255.224  
 no shutdown
 exit
________________________________________
ip routing
ip default-gateway 192.168.255.2
________________________________________
write memory
exit
________________________________________
IDS L3 Switch Configuration
enable
configure terminal
vlan 130
 name IDS_Students
vlan 140
 name IDS_Staff
vlan 150
 name IDS_Other_Devices
exit
________________________________________
interface GigabitEthernet0/1
 description Link to Core L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk                
 no shutdown
 exit
interface GigabitEthernet0/2
 description Link to IDS L2 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk                
 no shutdown
 exit
________________________________________
interface Vlan130
 description IDS Students
 ip address 192.168.7.1 255.255.255.224  
 no shutdown
 exit
interface Vlan140
 description IDS Staff
 ip address 192.168.7.33 255.255.255.192  
 no shutdown
 exit
interface Vlan150
 description IDS Other Devices
 ip address 192.168.7.97 255.255.255.240  
 no shutdown
 exit
________________________________________
ip routing
ip default-gateway 192.168.255.2
________________________________________
write memory
exit


Admin L3 Switch Configuration

enable
configure terminal
vlan 160
 name Admin_Staff
vlan 170
 name Admin_Printers
exit
________________________________________
interface GigabitEthernet0/1
 description Link to Core L3 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk 
 no shutdown
 exit
interface GigabitEthernet0/2
 description Link to Admin L2 Switch
 switchport trunk encapsulation dot1q  
 switchport mode trunk                
 no shutdown
 exit
________________________________________
interface Vlan160
 description Admin Staff
 ip address 192.168.8.1 255.255.255.192  
 no shutdown
 exit
interface Vlan170
 description Admin Printers
 ip address 192.168.8.65 255.255.255.240  
 no shutdown
 exit
________________________________________
ip routing
ip default-gateway 192.168.255.2
________________________________________
write memory
exit

Com Eng L2 Switch Configuration
enable
configure terminal
vlan 10
 name Com_Eng_Students
vlan 20
 name Com_Eng_Staff
vlan 30
 name Com_Eng_Other_Devices
exit
________________________________________
interface GigabitEthernet0/1
 description Link to Com Eng L3 Switch
switchport mode trunk               
 no shutdown
 exit
________________________________________
interface range FastEthernet0/1 - 5
 description Com Eng Student PCs
 switchport mode access
 switchport access vlan 10
 no shutdown
 exit
interface range FastEthernet0/10 - 11
 description Com Eng Staff PCs
 switchport mode access
 switchport access vlan 20
 no shutdown
 exit
interface FastEthernet0/15
 description Com Eng Printer
 switchport mode access
 switchport access vlan 30
 no shutdown
 exit
interface range FastEthernet0/16 - 17
 description Com Eng Other Devices
 switchport mode access
 switchport access vlan 30
 no shutdown
 exit
________________________________________
exit
write memory




EEE L2 Switch Configuration
enable
configure terminal
vlan 40
 name EEE_Students
vlan 50
 name EEE_Staff
vlan 60
 name EEE_Other_Devices
exit
________________________________________
interface GigabitEthernet0/1
 description Link to EEE L3 Switch
 switchport mode trunk 
 no shutdown
 exit
________________________________________
interface range FastEthernet0/1 - 5
 description EEE Student PCs
 switchport mode access
 switchport access vlan 40
 no shutdown
 exit
interface range FastEthernet0/10 - 11
 description EEE Staff PCs
 switchport mode access
 switchport access vlan 50
 no shutdown
 exit
interface FastEthernet0/15
 description EEE Printer
 switchport mode access
 switchport access vlan 60
 no shutdown
 exit
interface range FastEthernet0/16 - 17
 description EEE Other Devices
 switchport mode access
 switchport access vlan 60
 no shutdown
 exit
________________________________________exit
write memory



Civil Eng L2 Switch Configuration
enable
configure terminal
vlan 70
 name Civil_Eng_Students
vlan 80
 name Civil_Eng_Staff
vlan 90
 name Civil_Eng_Other_Devices
exit
________________________________________
interface GigabitEthernet0/1
 description Link to Civil Eng L3 Switch
 switchport mode trunk 
 no shutdown
 exit
________________________________________
interface range FastEthernet0/1 - 5
 description Civil Eng Student PCs
 switchport mode access
 switchport access vlan 70
 no shutdown
 exit
interface range FastEthernet0/10 - 11
 description Civil Eng Staff PCs
 switchport mode access
 switchport access vlan 80
 no shutdown
 exit
interface FastEthernet0/15
 description Civil Eng Printer
 switchport mode access
 switchport access vlan 90
 no shutdown
 exit
interface range FastEthernet0/16 - 17
 description Civil Eng Other Devices
 switchport mode access
 switchport access vlan 90
 no shutdown
 exit
________________________________________
exit
write memory

Mech Eng L2 Switch Configuration
Step 1: Create VLANs
enable
configure terminal
vlan 100
 name Mech_Eng_Students
vlan 110
 name Mech_Eng_Staff
vlan 120
 name Mech_Eng_Other_Devices
exit
________________________________________
Step 2: Configure Trunk Port to Mech Eng L3 Switch
interface GigabitEthernet0/1
 description Link to Mech Eng L3 Switch
 switchport mode trunk  
 no shutdown
 exit
________________________________________
Step 3: Assign Access Ports to VLANs
interface range FastEthernet0/1 - 5
 description Mech Eng Student PCs
 switchport mode access
 switchport access vlan 100
 no shutdown
 exit
interface range FastEthernet0/10 - 11
 description Mech Eng Staff PCs
 switchport mode access
 switchport access vlan 110
 no shutdown
 exit
interface FastEthernet0/15
 description Mech Eng Printer
 switchport mode access
 switchport access vlan 120
 no shutdown
 exit
interface range FastEthernet0/16 - 17
 description Mech Eng Other Devices
 switchport mode access
 switchport access vlan 120
 no shutdown
 exit
________________________________________
Step 4: Save Configuration
exit
write memory


IDS L2 Switch Configuration

enable
configure terminal
vlan 130
 name IDS_Students
vlan 140
 name IDS_Staff
vlan 150
 name IDS_Other_Devices
exit
interface GigabitEthernet0/1
 description Link to IDS L3 Switch
 switchport mode trunk  
 no shutdown
 exit
interface range FastEthernet0/1 - 3
 description IDS Student PCs
 switchport mode access
 switchport access vlan 130
 no shutdown
 exit
interface range FastEthernet0/10 - 11
 description IDS Staff PCs
 switchport mode access
 switchport access vlan 140
 no shutdown
 exit
interface FastEthernet0/15
 description IDS Printer
 switchport mode access
 switchport access vlan 150
 no shutdown
 exit
interface range FastEthernet0/16 - 17
 description IDS Other Devices
 switchport mode access
 switchport access vlan 150
 no shutdown
 exit
exit
write memory

Admin L2 Switch Configuration
enable
configure terminal
vlan 160
 name Admin_Staff
vlan 170
 name Admin_Printers
exit
interface GigabitEthernet0/1
 description Link to Admin L3 Switch
 switchport mode trunk 
 no shutdown
 exit
interface range FastEthernet0/1 - 2
 description Admin Staff PCs
 switchport mode access
 switchport access vlan 160
 no shutdown
 exit
interface FastEthernet0/10
 description Admin Printer
 switchport mode access
 switchport access vlan 170
 no shutdown
 exit
exit
write memory


CCTV L2 Switch Configuration
Step 1: Create VLAN for CCTV Cameras
enable
configure terminal
vlan 180
 name CCTV_Cameras
exit
interface GigabitEthernet0/1
 description Link to Core L3 Switch
 switchport mode trunk 
 no shutdown
 exit
interface range FastEthernet0/1 - 4
 description CCTV Cameras
 switchport mode access
 switchport access vlan 180
 no shutdown
 exit
exit
write memory

Configure DHCP
1. Configure DHCP on the Core L3 Switch
enable
configure terminal
service dhcp
ip dhcp pool Com_Eng_Students
 network 192.168.0.0 255.255.254.0    
 default-router 192.168.0.1         
 dns-server 8.8.8.8
 dns-server 8.8.4.4           
 exit
ip dhcp pool Com_Eng_Staff
 network 192.168.2.0 255.255.255.128  
 default-router 192.168.2.1           
 dns-server 8.8.8.8
 dns-server 8.8.4.4           
 exit
ip dhcp pool Com_Eng_Other_Devices
 network 192.168.2.128 255.255.255.192 
 default-router 192.168.2.129           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool EEE_Students
 network 192.168.3.0 255.255.255.0    
 default-router 192.168.3.1           
 dns-server 8.8.8.8
 dns-server 8.8.4.4           
 exit
ip dhcp pool EEE_Staff
 network 192.168.4.0 255.255.255.128  
 default-router 192.168.4.1          
 dns-server 8.8.8.8
 dns-server 8.8.4.4          
 exit
ip dhcp pool EEE_Other_Devices
 network 192.168.4.128 255.255.255.224  
 default-router 192.168.4.129           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool Civil_Eng_Students
 network 192.168.5.0 255.255.255.128  
 default-router 192.168.5.1          
 dns-server 8.8.8.8
 dns-server 8.8.4.4         
 exit
ip dhcp pool Civil_Eng_Staff
 network 192.168.5.128 255.255.255.192  
 default-router 192.168.5.129           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool Civil_Eng_Other_Devices
 network 192.168.5.192 255.255.255.240  
 default-router 192.168.5.193           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool Mech_Eng_Students
 network 192.168.6.0 255.255.255.128  
 default-router 192.168.6.1           
 dns-server 8.8.8.8
 dns-server 8.8.4.4           
 exit
ip dhcp pool Mech_Eng_Staff
 network 192.168.6.128 255.255.255.192  
 default-router 192.168.6.129           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool Mech_Eng_Other_Devices
 network 192.168.6.192 255.255.255.224  
 default-router 192.168.6.193        
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool IDS_Students
 network 192.168.7.0 255.255.255.224  
 default-router 192.168.7.1           
 dns-server 8.8.8.8
 dns-server 8.8.4.4           
 exit
ip dhcp pool IDS_Staff
 network 192.168.7.32 255.255.255.192  
 default-router 192.168.7.33           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool IDS_Other_Devices
 network 192.168.7.96 255.255.255.240  
 default-router 192.168.7.97           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool Admin_Staff
 network 192.168.8.0 255.255.255.192  
 default-router 192.168.8.1           
 dns-server 8.8.8.8
 dns-server 8.8.4.4           
 exit
ip dhcp pool Admin_Printers
 network 192.168.8.64 255.255.255.240  
 default-router 192.168.8.65           
 dns-server 8.8.8.8
 dns-server 8.8.4.4             
 exit
ip dhcp pool CCTV_Cameras
 network 192.168.9.0 255.255.255.128  
 default-router 192.168.9.1          
 dns-server 8.8.8.8
 dns-server 8.8.4.4           
 exit
ip dhcp excluded-address 192.168.0.1 192.168.0.10    
ip dhcp excluded-address 192.168.2.1 192.168.2.10    
ip dhcp excluded-address 192.168.2.129 192.168.2.138 
ip dhcp excluded-address 192.168.3.1 192.168.3.10   
ip dhcp excluded-address 192.168.4.1 192.168.4.10    
ip dhcp excluded-address 192.168.4.129 192.168.4.138 
ip dhcp excluded-address 192.168.5.1 192.168.5.10    
ip dhcp excluded-address 192.168.5.129 192.168.5.138 
ip dhcp excluded-address 192.168.5.193 192.168.5.202 
ip dhcp excluded-address 192.168.6.1 192.168.6.10    
ip dhcp excluded-address 192.168.6.129 192.168.6.138 
ip dhcp excluded-address 192.168.6.193 192.168.6.202 
ip dhcp excluded-address 192.168.7.1 192.168.7.10    
ip dhcp excluded-address 192.168.7.33 192.168.7.42   
ip dhcp excluded-address 192.168.7.97 192.168.7.106  
ip dhcp excluded-address 192.168.8.1 192.168.8.10    
ip dhcp excluded-address 192.168.8.65 192.168.8.74   
ip dhcp excluded-address 192.168.9.1 192.168.9.10   
exit
write memory

DHCP Configuration for Com Eng L3 Switch

enable
configure terminal
service dhcp

ip dhcp pool Com_Eng_Students
 network 192.168.0.0 255.255.254.0    
 default-router 192.168.0.1           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool Com_Eng_Staff
 network 192.168.2.0 255.255.255.128  
 default-router 192.168.2.1           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool Com_Eng_Other_Devices
 network 192.168.2.128 255.255.255.192  
 default-router 192.168.2.129           
 dns-server 8.8.8.8                     
 dns-server 8.8.4.4                     
 exit

ip dhcp excluded-address 192.168.0.1 192.168.0.10    
ip dhcp excluded-address 192.168.2.1 192.168.2.10    
ip dhcp excluded-address 192.168.2.129 192.168.2.138 


interface Vlan10
 ip helper-address 192.168.255.2 
 exit

interface Vlan20
 ip helper-address 192.168.255.2  
 exit

interface Vlan30
 ip helper-address 192.168.255.2  
 exit

exit
write memory

DHCP configuration commands for the EEE L3 Switch:
enable
configure terminal
service dhcp

ip dhcp pool EEE_Students
network 192.168.3.0 255.255.255.0
default-router 192.168.3.1
dns-server 8.8.8.8
dns-server 8.8.4.4
exit
ip dhcp pool EEE_Staff
network 192.168.4.0 255.255.255.128
default-router 192.168.4.1
dns-server 8.8.8.8
dns-server 8.8.4.4
exit
ip dhcp pool EEE_Other_Devices
network 192.168.4.128 255.255.255.224
default-router 192.168.4.129
dns-server 8.8.8.8
dns-server 8.8.4.4
exit

ip dhcp excluded-address 192.168.3.1 192.168.3.10
ip dhcp excluded-address 192.168.4.1 192.168.4.10
ip dhcp excluded-address 192.168.4.129 192.168.4.138

exit
write memory




enable
configure terminal
interface Vlan40
ip helper-address 192.168.255.2
exit

interface Vlan50
ip helper-address 192.168.255.2
exit

interface Vlan60
ip helper-address 192.168.255.2
exit
write memory



DHCP configuration commands for the Civil Eng L3 Switch:
enable
configure terminal
service dhcp

ip dhcp pool Civil_Eng_Students
 network 192.168.5.0 255.255.255.128    
 default-router 192.168.5.1           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool Civil_Eng_Staff
 network 192.168.5.128 255.255.255.192  
 default-router 192.168.5.129           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool Civil_Eng_Other_Devices
 network 192.168.5.192 255.255.255.240  
 default-router 192.168.5.193           
 dns-server 8.8.8.8                     
 dns-server 8.8.4.4                     
 exit

ip dhcp excluded-address 192.168.5.1 192.168.5.10    
ip dhcp excluded-address 192.168.5.129 192.168.5.138    
ip dhcp excluded-address 192.168.5.193 192.168.5.202 

interface Vlan70
 ip helper-address 192.168.255.2 
 exit

interface Vlan80
 ip helper-address 192.168.255.2  
 exit

interface Vlan90
 ip helper-address 192.168.255.2  
 exit
exit
write memory


DHCP configuration commands for the Mech Eng L3 Switch:

enable
configure terminal
service dhcp

ip dhcp pool Mech_Eng_Students
 network 192.168.6.0 255.255.255.128    
 default-router 192.168.6.1           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool Mech_Eng_Staff
 network 192.168.6.128 255.255.255.192  
 default-router 192.168.6.129           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool Mech_Eng_Other_Devices
 network 192.168.6.192 255.255.255.224  
 default-router 192.168.6.193           
 dns-server 8.8.8.8                     
 dns-server 8.8.4.4                     
 exit

ip dhcp excluded-address 192.168.6.1 192.168.6.10    
ip dhcp excluded-address 192.168.6.129 192.168.6.138    
ip dhcp excluded-address 192.168.6.193 192.168.6.202 

interface Vlan100
 ip helper-address 192.168.255.2 
 exit

interface Vlan110
 ip helper-address 192.168.255.2  
 exit

interface Vlan120
 ip helper-address 192.168.255.2  
 exit
exit
write memory


 DHCP configuration commands for the IDS L3 Switch:
enable
configure terminal
service dhcp

ip dhcp pool IDS_Students
 network 192.168.7.0 255.255.255.224    
 default-router 192.168.7.1           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool IDS_Staff
 network 192.168.7.32 255.255.255.192  
 default-router 192.168.7.33           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool IDS_Other_Devices
 network 192.168.7.96 255.255.255.240  
 default-router 192.168.7.97           
 dns-server 8.8.8.8                     
 dns-server 8.8.4.4                     
 exit

ip dhcp excluded-address 192.168.7.1 192.168.7.10    
ip dhcp excluded-address 192.168.7.33 192.168.7.42    
ip dhcp excluded-address 192.168.7.97 192.168.7.106 

interface Vlan130
 ip helper-address 192.168.255.2 
 exit

interface Vlan140
 ip helper-address 192.168.255.2  
 exit

interface Vlan150
 ip helper-address 192.168.255.2  
 exit
exit
write memory


DHCP configuration commands for the Admin L3 Switch:
enable
configure terminal
service dhcp

ip dhcp pool Admin_Staff
 network 192.168.8.0 255.255.255.192    
 default-router 192.168.8.1           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit
ip dhcp pool Admin_Printers
 network 192.168.8.64 255.255.255.240  
 default-router 192.168.8.65           
 dns-server 8.8.8.8                   
 dns-server 8.8.4.4                   
 exit

ip dhcp excluded-address 192.168.8.1 192.168.8.10    
ip dhcp excluded-address 192.168.8.65 192.168.8.74    

interface Vlan160
 ip helper-address 192.168.255.2 
 exit

interface Vlan170
 ip helper-address 192.168.255.2  
 exit
exit
write memory

________________________________________
Commands to Block Students from Accessing Printers and Other Devices
Commands for Com Eng L3 Switch
enable
configure terminal
ip access-list extended BLOCK_STUDENTS
 deny ip 192.168.0.0 0.0.1.255 192.168.2.128 0.0.0.63   
 permit ip any any                                
 exit
interface Vlan10
 ip access-group BLOCK_STUDENTS in
 exit
exit
write memory
________________________________________
Commands for EEE L3 Switch
enable
configure terminal
ip access-list extended BLOCK_STUDENTS
 deny ip 192.168.3.0 0.0.0.255 192.168.4.128 0.0.0.31   
 permit ip any any                                      
 exit
interface Vlan40
 ip access-group BLOCK_STUDENTS in
 exit
exit
write memory
________________________________________
Commands for Civil Eng L3 Switch
enable
configure terminal
ip access-list extended BLOCK_STUDENTS
 deny ip 192.168.5.0 0.0.0.127 192.168.5.192 0.0.0.15  
 permit ip any any                                    
 exit
interface Vlan70
 ip access-group BLOCK_STUDENTS in
 exit
exit
write memory
________________________________________
Commands for Mech Eng L3 Switch
enable
configure terminal
ip access-list extended BLOCK_STUDENTS
 deny ip 192.168.6.0 0.0.0.127 192.168.6.192 0.0.0.31   
 permit ip any any                                      
 exit
interface Vlan100
 ip access-group BLOCK_STUDENTS in
 exit
exit
write memory
________________________________________
Commands for IDS L3 Switch
enable
configure terminal
ip access-list extended BLOCK_STUDENTS
 deny ip 192.168.7.0 0.0.0.31 192.168.7.96 0.0.0.15     
 permit ip any any                                      
 exit
interface Vlan130
 ip access-group BLOCK_STUDENTS in
 exit
exit
write memory

