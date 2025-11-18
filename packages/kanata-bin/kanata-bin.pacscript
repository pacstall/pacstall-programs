pkgname="kanata-bin"
gives="kanata"
pkgver="1.10.0"
pkgdesc="Keyboard remapper, Improve keyboard comfort and usability with advanced customization"
maintainer=("tranquil <tranquiltr0@proton.me>")
arch=('x86_64')
url="https://github.com/jtroo/kanata/"
repology=("project: ${gives}")
license=('LGPL-3.0-only')
provides=('kanata')
depends=('gcc' 'libc-bin' 'systemd')
source=(
  "@${pkgname}~${pkgver}::https://github.com/jtroo/kanata/releases/download/v${pkgver//_/-}/linux-binaries-x64-v${pkgver//_/-}.zip"
  "https://github.com/jtroo/kanata/raw/v${pkgver//_/-}/LICENSE"
)
sha256sums=(
  'fe6ba3768c1a7a60d94628a613f168f464b7ab88d34077e26896a7d3967e5eb6'
  'a5681bf9b05db14d86776930017c647ad9e6e56ff6bbcfdf21e5848288dfaf1b'
)
backup=('etc/kanata/config.kbd')

package() {

  install -Dm755 "${pkgname}~${pkgver}/kanata_linux_x64" "${pkgdir}/usr/bin/kanata"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/${gives}/copyright"

  # Create and install systemd service file
  mkdir -p "${pkgdir}/etc/systemd/system/"
  # shellcheck disable=SC2016
  echo '[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin
Environment=DISPLAY=:0
Type=simple
ExecStart=/usr/bin/sh -c '\''exec $$(which kanata) --cfg /etc/kanata/config.kbd'\''
Restart=no

[Install]
WantedBy=default.target' | tee "${pkgdir}/etc/systemd/system/kanata.service" > /dev/null

  # Create and install default configuration file
  mkdir -p "${pkgdir}/etc/kanata/"
  echo ';; Caps to escape on tap / control on hold configuration for Kanata

(defsrc
  caps
  ;; uncomment esc (read the next comment)
  ;; esc
)

(deflayermap base
  caps (tap-hold 100 100 esc lctl)
  ;; and uncomment esc caps to also remap the escape key to caps lock
  ;; esc caps
  ;; replace caps just escape (no control key) by using the below line instead of "caps (tap-hold 100 100 esc lctl)"
  ;; caps esc
)' | tee "${pkgdir}/etc/kanata/config.kbd" > /dev/null
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
