name="git-butler-deb"
# there is no repology property, since the package is not even in repology (with the exception of an AUR package, with a name that doesnt match the official deb file
arch=('amd64')
pkgver="0.10.6-619"
homepage='https://gitbutler.com/'
url="https://releases.gitbutler.com/releases/release/${pkgver}/linux/x86_64/git-butler_${pkgver%-*}_amd64.deb"
depends=("libayatana-appindicator3-1" "libwebkit2gtk-4.0-37" "libgtk-3-0")
breaks=("git-butler-git" "git-butler-bin")
replace=("git-butler")
gives="git-butler"
pkgdesc="Git Branching, Refined
A Git client for simultaneous branches on top of your existing workflow."
hash="dcdab541508778ff1129a1b43c5a23b415c8066f9e44a96aaa373ae473d6cc66"
maintainer="Nezred <jmnezred@pm.me>"
