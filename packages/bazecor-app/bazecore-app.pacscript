name="bazecor-app"
pkgname="bazecor"
version="0.3.4"
url="https://github.com/Dygmalab/Bazecor/releases/download/v${version}/Bazecor-${version}.AppImage"
hash="75680b07dc11d59778d03e78efd51c0928f1d333d65e6c3a412d04ac2ae61ff7"
breaks="bazecor bazecor-bin bazecor-deb bazecor-git"

prepare() {
	true
}

build() {
	true
}

install() {
	sudo install -Dm755 "Bazecor-${version}.AppImage" "/usr/src/pacstall/bazecor-app/usr/bin/$pkgname"
}

postinst() {
		bash <(curl -s https://github.com/pacstall/pacstall-programs/blob/master/packages/bazecor-app/udev.sh)
}

removescript() {
	sudo rm -f /etc/udev/rules.d/50-dygma.rules
}
