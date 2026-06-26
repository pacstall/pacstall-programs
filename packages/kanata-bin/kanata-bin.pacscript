pkgname="kanata-bin"
gives="kanata"
pkgver="1.11.0"
pkgdesc="Keyboard remapper, Improve keyboard comfort and usability with advanced customization"
maintainer=("tranquil <tranquiltr0@proton.me>")
arch=('x86_64')
url="https://github.com/jtroo/kanata/"
repology=("project: ${gives}")
license=('LGPL-3.0-only')
provides=('kanata')
depends=('gcc' 'libc-bin' 'systemd')
source=(
  "@${pkgname}~${pkgver}::https://github.com/jtroo/kanata/releases/download/v${pkgver}/linux-binaries-x64.zip"
  "kanata.service"
  "https://raw.githubusercontent.com/jtroo/kanata/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=(
  'd9f634afb4c7f078cc2aacf3998fd65b432d4d83296cc48a89f941525459b4e2'
  'SKIP'
  'a5681bf9b05db14d86776930017c647ad9e6e56ff6bbcfdf21e5848288dfaf1b'
)
backup=('etc/kanata/config.kbd')

package() {
  install -Dm755 "${pkgname}~${pkgver}/kanata_linux_x64" "${pkgdir}/usr/bin/kanata"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/${gives}/copyright"
  install -Dm644 "kanata.service" "${pkgdir}/usr/lib/systemd/system/"
}

post_install() {
  fancy_message info "
  \e[1mYou may enable the service to start kanata on boot by running:\e[0m
    \e[32msystemctl daemon-reload\e[0m
    \e[32msystemctl enable kanata.service\e[0m
  \e[1mTo start kanata now, additionally run\e[0m
    \e[32msystemctl start kanata.service\e[0m
  "
}
