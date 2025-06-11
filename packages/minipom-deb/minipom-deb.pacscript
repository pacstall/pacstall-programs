pkgname="minipom-deb"
gives="minipom"
pkgver="0.11.3"
pkgrel="1"
arch=('amd64')
url='https://github.com/tfkhdyt/minipom'
source_amd64=(
  "https://github.com/tfkhdyt/minipom/releases/download/v${pkgver}/Minipom_${pkgver}_amd64.deb"
)
sha256sums_amd64=("SKIP") # Will need to be updated with actual checksum
depends=(
  "libwebkit2gtk-4.1-0"
  "libayatana-appindicator3-1"
  "librsvg2-2"
)
license=('GPL-3.0-or-later')
pkgdesc="Minimalistic and elegant Pomodoro timer desktop application
A clean and modern Pomodoro timer built with Tauri and SvelteKit featuring
customizable timer settings, built-in sound notifications, and native
performance across platforms."
maintainer=("Taufik Hidayat <taufik@hidayat.dev>") # Update with actual maintainer info

package() {
  dpkg-deb -x "Minipom_${pkgver}_amd64.deb" "${pkgdir}"
}

post_install() {
  echo "Minipom has been installed successfully!"
  echo "You can launch it from your application menu or by running 'minipom' in the terminal."
  echo ""
  echo "Enjoy your productive Pomodoro sessions!"
}
