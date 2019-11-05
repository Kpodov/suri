source ~/.bashrc
sudo apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev python-pip pyyaml\
build-essential autoconf automake libtool libpcap-dev libnet1-dev \
libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 \
make libmagic-dev libjansson-dev libjansson4 pkg-config
sudo apt-get -y install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev libnfnetlink0 jq
sudo add-apt-repository ppa:oisf/suricata-stable
sudo apt-get update
sudo apt-get -y install suricata
echo 'Suricata installation: done'
sudo cp suricata.yaml /etc/suricata/
echo ' '
echo '  ====================================='
pip install --pre --upgrade suricata-update
echo 'Proceeding with installing Suricata rules'
sleep 5
sudo suricata-update update-sources
sudo suricata-update enable-source oisf/trafficid
sudo suricata-update enable-source sslbl/ja3-fingerprints
sudo suricata-update enable-source tgreen/hunting
sudo suricata-update enable-source sslbl/ssl-fp-blacklist
sudo suricata-update enable-source et/open
sudo suricata-update enable-source ptresearch/attackdetection
sudo suricata-update enable-source etnetera/aggressive
sudo suricata-update
sleep 2
echo ' '
echo '   ====================================='
echo 'Rules installed:'
sudo suricata-update list-enabled-sources
sleep 6
cp .bash_aliases /home/$USER/.bash_aliases
source ~/.bashrc
echo 'to run Suricata, type:  sur-on'
sleep 1
echo 'to stop Suricata, type: sur-off'
sleep 1
echo 'to print the log file:  sur-see'
sleep 1
echo 'to configure settings:  sur-cfg'
sleep 1
echo 'to get all the logs:    sur-log '
sleep 5
echo 'Done! Look at aliases for more shortcuts!!!'
ssh-keygen -b 2048 -t rsa -f /home/$USER/.ssh/id_rsa -q -N "" > /dev/null
