#!/bin/bash
#
# Firewall rules for laptop. Only connections are allowed out when turned on.
# 

# Function to set the file to one or zero.
enable () { for file in $@; do echo 1 > $file; done }
disable () { for file in $@; do echo 0 > $file; done }

######################################################################
function on {
    echo "Firewall: enabling filtering"
       	
    #Use Selective ACK which can be used to signify that specific packets are missing.
    disable /proc/sys/net/ipv4/tcp_sack

    #If the kernel should attempt to forward packets. Off by default. Routers should enable.
    disable /proc/sys/net/ipv4/ip_forward

    #Protect against wrapping sequence numbers and in round trip time measurement.
    disable /proc/sys/net/ipv4/tcp_timestamps
   
    #Help against syn-flood DoS or DDoS attacks using particular choices of initial TCP sequence numbers.
    enable /proc/sys/net/ipv4/tcp_syncookies

    # Enable broadcast echo protection.
    enable /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

    # Disable source routed packets.
    disable  /proc/sys/net/ipv4/conf/*/accept_source_route

    # Disable ICMP Redirect acceptance.
    disable /proc/sys/net/ipv4/conf/*/accept_redirects

    # Don't send Redirect messages.
    disable /proc/sys/net/ipv4/conf/*/send_redirects

    # Do not respond to packets that would cause us to go out
    # a different interface than the one to which we're responding.
    enable /proc/sys/net/ipv4/conf/*/rp_filter

    # Log packets with impossible addresses.
    enable /proc/sys/net/ipv4/conf/*/log_martians

    # Clear any previous rules.
    iptables -F
    iptables -F -t nat
    iptables -F -t mangle
    
    # Default drop policy.
    iptables -P INPUT DROP
    iptables -P OUTPUT DROP
    iptables -P FORWARD DROP

    # Allow anything over loopback.
    iptables -A INPUT  -i lo -s 127.0.0.1 -j ACCEPT
    iptables -A OUTPUT -o lo -d 127.0.0.1 -j ACCEPT

    # Drop any tcp packet that does not start a connection with a syn flag.
    iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

    # Drop any invalid packet that could not be identified.
    iptables -A INPUT -m state --state INVALID -j DROP

    # Drop invalid packets.
    iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
    iptables -A INPUT -p tcp -m tcp --tcp-flags SYN,FIN SYN,FIN              -j DROP
    iptables -A INPUT -p tcp -m tcp --tcp-flags SYN,RST SYN,RST              -j DROP
    iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,RST FIN,RST              -j DROP
    iptables -A INPUT -p tcp -m tcp --tcp-flags ACK,FIN FIN                  -j DROP
    iptables -A INPUT -p tcp -m tcp --tcp-flags ACK,URG URG                  -j DROP

    # Reject broadcasts to 224.0.0.1
    iptables -A INPUT -d 224.0.0.0 -j REJECT

    # Allow TCP/UDP connections out. Keep state so conns out are allowed back in.
    iptables -A INPUT  -p tcp -m state --state ESTABLISHED     -j ACCEPT
    iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -A INPUT  -p udp -m state --state ESTABLISHED     -j ACCEPT
    iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT

    # Allow ICMP out and anything that went out back in.
    iptables -A INPUT  -p icmp -m state --state ESTABLISHED      -j ACCEPT
    iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED  -j ACCEPT

    # Allow only ICMP echo requests (ping) in. Limit rate in. Uncomment if needed.
    #iptables -A INPUT  -p icmp -m state --state NEW,ESTABLISHED --icmp-type echo-request -m limit --limit 1/s -j ACCEPT

    # Allow ssh connections in. Uncomment if needed.
    # iptables -A INPUT -p tcp -m tcp --dport 22 --tcp-flags SYN,RST,ACK SYN -m state --state NEW -m limit --limit 1/s -j ACCEPT

    # Drop everything that did not match above and log it.
    iptables -A INPUT   -j LOG --log-level 4 --log-prefix "IPT_INPUT: "
    iptables -A INPUT   -j DROP
    iptables -A FORWARD -j LOG --log-level 4 --log-prefix "IPT_FORWARD: "
    iptables -A FORWARD -j DROP
    iptables -A OUTPUT  -j LOG --log-level 4 --log-prefix "IPT_OUTPUT: "
    iptables -A OUTPUT  -j DROP

}
######################################################################
function off {
    # stop firewall
    echo "Firewall: disabling filtering (allowing all access)"
    iptables -F
    iptables -F -t nat
    iptables -F -t mangle
    iptables -P INPUT ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables -P FORWARD ACCEPT
}
######################################################################
function stop {
    # stop all external connections
    echo "Firewall: stopping all external connections"
    iptables -F INPUT
    iptables -F OUTPUT
    iptables -P INPUT DROP
    iptables -P FORWARD REJECT
    iptables -P OUTPUT REJECT

    # allow anything over loopback
    iptables -A INPUT -i lo -s 127.0.0.1 -j ACCEPT
    iptables -A OUTPUT -o lo -d 127.0.0.1 -j ACCEPT
}

case "$1" in
    start)
	on
    ;;
    stop)
	off
    ;;
    *)
	echo "$0 {start|stop|off}"
	echo "Start executes primary ruleset. Default is block all in and allow everything out."
	echo "Stop disables all filtering"
	echo "Off disables all non-loopback connections"
    ;;
esac
