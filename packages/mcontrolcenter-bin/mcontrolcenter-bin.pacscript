name="mcontrolcenter-bin"
gives="mcontrolcenter"
version="0.3.2"
depends="libqt5widgets5"
url="https://github.com/dmitry-s93/MControlCenter/releases/download/${version}/MControlCenter-${version}.tar.gz"
repology=("project: mcontrolcenter")
description="An application that allows you to change the settings of MSI laptops."
hash="bab563f692fb3d42494d95de21611d230e0b0736e2e80f08cf8a1b7b990d9f0f"
maintainer="সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>"

install() {
	cd app
	sudo install -Dm755 "${gives}" "$pkgdir"/usr/bin/"${gives}"
	sudo install -Dm644 "${gives}.desktop" "$pkgdir"/usr/share/applications/"${gives}.desktop"
	sudo install -Dm644 "${gives}.svg" "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"${gives}.svg"
	sudo install -Dm755 "${gives}-helper" "$pkgdir"/usr/libexec/"${gives}-helper"
	sudo install -Dm644 "${gives}-helper.conf" "$pkgdir"/usr/share/dbus-1/system.d/"${gives}-helper.conf"
	sudo install -Dm644 "${gives}.helper.service" "$pkgdir"/usr/share/dbus-1/system-services/"${gives}.helper.service"
}
postinst() {
	if ask "Do you want this programme to start at startup?" Y; then
		sudo -u "${PACSTALL_USER}" mkdir -p "${homedir}"/.config/autostart
		sudo -u "${PACSTALL_USER}" cp /usr/share/applications/mcontrolcenter.desktop "${homedir}"/.config/autostart/mcontrolcenter.desktop
		echo "Copied desktop file to ${homedir}/.config/autostart folder, programme will now start upon startup."
	else
		echo "Programme will not start upon startup"
	fi
}
removescript() {
	rm -f "${homedir}/.config/autostart/mcontrolcenter.desktop"
	fancy_message info "config file for auto-start is removed"
}
