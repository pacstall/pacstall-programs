pkgname="zen-browser-generic-bin"
pkgver="1.7b"
pkgrel=1
pkgdesc="Experience tranquillity while browsing the web without people tracking you!"
url="https://zen-browser.app/"
license=("MPL-2.0")
arch=("amd64")
maintainer=("D-Brox <davidfbg00@gmail.com>")

source=("https://github.com/zen-browser/desktop")
sha256sums=('SKIP')
pacdeps=("zen-browser-bin")

post_install() {
  fancy_message warn "The 'generic' pacscript has been deprecated"
  fancy_message info "Run 'pacstall -I zen-browser-bin' to install the unified pacscript"
}
