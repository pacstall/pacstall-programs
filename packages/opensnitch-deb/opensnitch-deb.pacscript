name="opensnitch-deb"
version="1.3.6"
url="https://github.com/evilsocket/opensnitch/releases/download/v$version/opensnitch_$version-1_amd64.deb"
gives="opensnitch"
description="OpenSnitch is a GNU/Linux port of the Little Snitch application firewall"
hash="33ea3e82601293071b20c138b6bae8a52208c7f36f409974040d5dfe4b535f0b"
maintainer="echometerain <echometer@disroot.org>"
removescript="yes"
postinst(){
    sudo pip3 install grpcio==1.16.1 unicode_slugify grpcio-tools protobuf
}
removescript(){
    sudo pip3 uninstall grpcio==1.16.1 unicode_slugify grpcio-tools protobuf
    sudo rm -rf "/etc/opensnitchd"
}
