name="brave-browser-deb"
gives="brave-browser"
version="1.27.109"
build_depends="apt-transport-https curl"
url="https://github.com/brave/brave-browser/releases/download/v${version}/brave-browser_${version}_amd64.deb"
hash="44908669ecee71bdcb242d4a2c6ffbbcf205ddd8958124ec9f295710dd416915"
description="The Brave browser is a fast, private and secure web browser for PC, Mac and mobile."
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"

prepare() {
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo update
}

install() {
    sudo apt install brave-browser
}