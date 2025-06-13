pkgname="minipom-deb"
gives="minipom"
replaces=("${gives}")
repology=("project: ${gives}")
pkgver="0.11.3"
arch=('amd64')
url='https://github.com/tfkhdyt/minipom'
source_amd64=("https://github.com/tfkhdyt/${gives}/releases/download/v${pkgver}/Minipom_${pkgver}_amd64.deb")
sha256sums_amd64=("5c77d2ce779981699f5651295cfc38c03e633b7b9bc850607f5db1069bcbe2df")
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
maintainer=("Taufik Hidayat <taufik@hidayat.dev>")
