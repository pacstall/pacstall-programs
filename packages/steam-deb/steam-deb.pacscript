name="steam-deb"
gives="steam"
version="1.0.0.74"
pacdeps=("steam-launcher-deb")
breaks="${gives}-bin ${gives}-app"
replace="${gives}"
url="https://repo.${gives}powered.com/${gives}/archive/stable/${gives}_${version}_i386.deb"
description="Steam is a video game digital distribution service by Valve"
hash="cd28218ebd64c74b5c1d654d5df467be18f5e88db907eb86ac620b51f445d659"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"
repology=("project: ${gives}")

prepare() {
    sudo dpkg --add-architecture i386
    sudo apt-get update
}
