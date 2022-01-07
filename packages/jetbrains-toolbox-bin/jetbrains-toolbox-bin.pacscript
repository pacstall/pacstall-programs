name="jetbrains-toolbox-bin"
pkgname="jetbrains-toolbox"
version="1.22.10970"
breaks="${pkgname} ${pkgname}-git ${pkgname}-deb ${pkgname}-app"
replace="${pkgname}"
gives="${pkgname}"
description="GitHub Desktop is an application that enables you to interact with GitHub using a GUI instead of the command line or a web browser. GitHub Desktop encourages you and your team to collaborate using best practices with Git and GitHub. You can use GitHub Desktop to complete most Git commands from your desktop with visual confirmation of changes. You can push to, pull from, and clone remote repositories with GitHub Desktop, and use collaborative tools such as attributing commits and creating pull requests."
maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"
hash="3b2cfc340d9116699d9e83173ea79d325df7f940d6f446d34076833608a99139"
url="https://download-cdn.jetbrains.com/toolbox/${pkgname}-${version}.tar.gz"

prepare() {
    true
}

build() {
    true
}

install() {
    sudo mkdir -p "${STOWDIR}/${name}/usr/bin"
    sudo mv "./${pkgname}" "${STOWDIR}/${name}/usr/bin"
}
