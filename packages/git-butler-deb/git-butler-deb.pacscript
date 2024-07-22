pkgname="git-butler-deb"
gives="git-butler"
# there is no repology property, since the package is not even in repology (with the exception of an AUR package, with a name that doesnt match the official deb file
arch=('amd64')
pkgver="0.12.12-1093"
url='https://gitbutler.com/'
source=("https://releases.gitbutler.com/releases/release/${pkgver}/linux/x86_64/git-butler_${pkgver%-*}_amd64.deb")
breaks=("git-butler-git" "git-butler-bin")
replaces=("git-butler")
pkgdesc="Git Branching, Refined
A Git client for simultaneous branches on top of your existing workflow"
sha256sums=("02a14a23167cad64cc595c12cf05d5659550f6fa754f8c082a3d9f485fbdd14a")
maintainer=("Nezred <jmnezred@pm.me>")
incompatible=("*:noble" "*:oracular" "*:trixie")
