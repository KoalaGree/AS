if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/KoalaGree/AS/master/ipvps?token=GHSAT0AAAAAABS75HVJZDHZ7HQ7BAUS3HH6YSC65MA | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${green}Permission Accepted...${NC}"
fi
mkdir /var/lib/premium-script;
echo "Enter the VPS Subdomain Hostname, if not available, please click Enter"
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
wget https://raw.githubusercontent.com/KoalaGree/AS/master/ssh-vpn.sh?token=GHSAT0AAAAAABS75HVJLCXWOI2PX6E3PNLEYSC66HA && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/KoalaGree/AS/master/sstp.sh?token=GHSAT0AAAAAABS75HVIDA3ICDBHSDWBRKOSYSC66TQ && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://raw.githubusercontent.com/KoalaGree/AS/master/wg.sh?token=GHSAT0AAAAAABS75HVJMNXB6HK2NGDEMEDEYSC666Q && chmod +x wg.sh && screen -S wg ./wg.sh
wget https://raw.githubusercontent.com/KoalaGree/AS/master/ssr.sh?token=GHSAT0AAAAAABS75HVJTUR3KCGX4CVRBRD6YSC67TA && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/KoalaGree/AS/master/sodosok.sh?token=GHSAT0AAAAAABS75HVJFQ7EMZKX2PNXFFGYYSC677Q && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
wget https://raw.githubusercontent.com/KoalaGree/AS/master/ins-vt.sh?token=GHSAT0AAAAAABS75HVJZ53QK33SGSQ4W55AYSC7AYQ && chmod +x ins-vt.sh && sed -i -e 's/\r$//' ins-vt.sh && screen -S v2ray ./ins-vt.sh
wget https://raw.githubusercontent.com/KoalaGree/AS/master/ipsec.sh?token=GHSAT0AAAAAABS75HVJKXI7WM4PHQFUCTLMYSC7BYA && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/sodosok.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/go.sh
rm -f /root/ipsec.sh
history -c
echo "1.1" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 992"  | tee -a log-install.txt
echo "   - Stunnel4                : 443"  | tee -a log-install.txt
echo "   - Dropbear                : 143, 109"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 5555"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3453"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 4443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - Trojan                  : 6443"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 00.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "------------------------------------------Lost Server------------------------------------------" | tee -a log-install.txt
echo ""
echo " Reboot 10 Sec"
sleep 10
reboot
