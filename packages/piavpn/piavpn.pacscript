name="piavpn"
breaks="${name}-git"
repology=("project: piavpn")
version="3.3-06906"
url="https://installers.privateinternetaccess.com/download/pia-linux-${version}.run"
description="Private Internet Access VPN Client"
hash="75efbf335af99673f55c81ff5f7e70d66ced52913ace2baca12253e19d3e64cf"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  sudo groupadd ${name}
	sudo groupadd piahnsd
  sudo mkdir -p ${STOWDIR}/${name}/etc/NetworkManager/conf.d
  sudo mkdir -p ${STOWDIR}/${name}
  sudo mkdir -p ${STOWDIR}/${name}/bin
  sudo mkdir -p ${STOWDIR}/${name}/usr/lib/systemd/system
  sudo mkdir -p ${STOWDIR}/${name}/usr/share/applications
  sudo mkdir -p ${STOWDIR}/${name}/usr/share/icons/hicolor/1024x1024/apps
}

build() {
  true
}

install() {
  chmod +x pia-linux-${version}.run
  ./pia-linux-${version}.run --noexec --target "${SRCDIR}/${name}"
  cd ${SRCDIR}/${name}
  sudo cp -a piafiles/* ${STOWDIR}/${name}
  sudo cp installfiles/*.sh ${STOWDIR}/${name}/bin
  sudo chmod +x ${STOWDIR}/${name}/bin/*.sh
  sudo setcap 'cap_net_bind_service=+ep' ${STOWDIR}/${name}/bin/pia-unbound
  sudo rm ${STOWDIR}/${name}/bin/install-wireguard.sh
	sudo rm ${STOWDIR}/${name}/bin/pia-uninstall.sh
  sudo cp installfiles/${name}.service ${STOWDIR}/${name}/usr/lib/systemd/system/${name}.service
  sudo cp installfiles/${name}.desktop ${STOWDIR}/${name}/usr/share/applications
  sudo cp installfiles/app-icon.png ${STOWDIR}/${name}/usr/share/icons/hicolor/1024x1024/apps/pia.png
	sudo echo -e "[keyfile]
unmanaged-devices=interface-name:wgpia*" > ${STOWDIR}/${name}/etc/NetworkManager/conf.d/50-wgpia.conf
  sudo sed -i '/^After/s/syslog.target //' ${STOWDIR}/${name}/usr/lib/systemd/system/${name}.service
}

postinst() {
  sudo systemctl start ${name}.service
  sudo systemctl enable ${name}.service
}

removescript() {
  sudo systemctl stop ${name}.service
	sudo systemctl disable ${name}.service
  sudo groupdel ${name}
	sudo groupdel piahnsd
}
