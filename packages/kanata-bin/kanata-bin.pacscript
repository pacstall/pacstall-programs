pkgname="kanata-bin"
gives="kanata"
pkgver="1.8.1"
pkgdesc="Keyboard remapper, Improve keyboard comfort and usability with advanced customization"
maintainer=("tranquil <tranquiltr0@proton.me>")
arch=('x86_64')
url="https://github.com/jtroo/kanata/"
repology=("project: ${gives}")
license=('LGPL-3.0-only')
provides=('kanata')
depends=('gcc' 'libc-bin')
source=(
  "https://github.com/jtroo/kanata/releases/download/v${pkgver//_/-}/kanata"
  "https://github.com/jtroo/kanata/raw/main/LICENSE"
)
sha256sums=(
  '7c123b3897af15e8520e439acde4c9be0c50ccd810a60273d84295750eec4921'
  'a5681bf9b05db14d86776930017c647ad9e6e56ff6bbcfdf21e5848288dfaf1b'
)

package() {
  install -Dm755 "kanata" "${pkgdir}/usr/bin/kanata"
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

  # Create and install default keyboard configuration
  mkdir -p "${pkgdir}/etc/kanata/"
  echo ';; Caps to escape/control configuration for Kanata

(defsrc
  caps
)

(defalias
  escctrl (tap-hold 150 150 esc lctl)
)

(deflayer base
  @escctrl
)' | tee "${pkgdir}/etc/kanata/config.kbd" > /dev/null

  systemctl daemon-reload
  systemctl enable kanata.service
}
