pkgname="git-butler-deb"
gives="git-butler"
# there is no repology property, since the package is not even in repology (with the exception of an AUR package, with a name that doesnt match the official deb file
arch=('amd64')
pkgver="0.10.22-703"
homepage='https://gitbutler.com/'
source=("https://releases.gitbutler.com/releases/release/${pkgver}/linux/x86_64/git-butler_${pkgver%-*}_amd64.deb")
depends=("libayatana-appindicator3-1" "libwebkit2gtk-4.0-37" "libgtk-3-0")
breaks=("git-butler-git" "git-butler-bin")
replaces=("git-butler")
pkgdesc="Git Branching, Refined
A Git client for simultaneous branches on top of your existing workflow."
sha256sums=("fb1e068b6b6fa8f191d5c48d2662c8b24b8c9f990a1b85d928721da2a48e5cfd")
maintainer=("Nezred <jmnezred@pm.me>")
