name="git-butler-deb"
gives="git-butler"
# there is no repology property, since the package is not even in repology (with the exception of an AUR package, with a name that doesnt match the official deb file
arch=('amd64')
pkgver="0.10.21-696"
homepage='https://gitbutler.com/'
url="https://releases.gitbutler.com/releases/release/${pkgver}/linux/x86_64/git-butler_${pkgver%-*}_amd64.deb"
depends=("libayatana-appindicator3-1" "libwebkit2gtk-4.0-37" "libgtk-3-0")
breaks=("git-butler-git" "git-butler-bin")
replace=("git-butler")
pkgdesc="Git Branching, Refined
A Git client for simultaneous branches on top of your existing workflow."
hash="205d62966cf4c36975be0540e4cfbeb1c0badb6c921e4dcefbb065bd50e8f6cf"
maintainer="Nezred <jmnezred@pm.me>"
