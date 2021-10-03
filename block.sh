if [ $# -ne 1 ]; then
	echo "Usage: $0 domain_to_block"
	exit 1
fi
DOMAIN=$1
cat <<EOF | sudo tee -a /etc/bind/named.conf.blocked
zone "$DOMAIN" {
        type master;
        file "/etc/bind/db.blocked";
};
EOF
sudo systemctl restart bind9.service
