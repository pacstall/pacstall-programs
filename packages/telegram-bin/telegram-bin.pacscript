pkgname="telegram-bin"
gives="telegram"
arch=("amd64")
pkgver="5.16.4"
url='https://telegram.org/'
pkgdesc="Telegram is a cloud-based mobile and desktop messaging app with a focus on security and speed"
source_base_url='https://github.com/telegramdesktop/tdesktop'
source=(
  "org.telegram.desktop.desktop"
  "tg.protocol"
  "${source_base_url}/raw/master/Telegram/Resources/art/icon16.png"
  "${source_base_url}/raw/master/Telegram/Resources/art/icon32.png"
  "${source_base_url}/raw/master/Telegram/Resources/art/icon48.png"
  "${source_base_url}/raw/master/Telegram/Resources/art/icon64.png"
  "${source_base_url}/raw/master/Telegram/Resources/art/icon128.png"
  "${source_base_url}/raw/master/Telegram/Resources/art/icon256.png"
  "${source_base_url}/raw/master/Telegram/Resources/art/icon512.png"
  "@${pkgname}~${pkgver}::${source_base_url}/releases/download/v${pkgver}/tsetup.${pkgver}.tar.xz"
)
sha256sums=(
  "f8e35627d29589ea9a1ea8d634855ca153d578503cadb44f0c5d0498c1062135"
  "d4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb"
  "ea1f36152b143cc2664daef5026656d55be2230ed42d43628e17ef7d2fff718c"
  "9e4180c78c895783b4559c5e1a7868a2c9aa30a29969fe5dbe9a4ce4cf5cde6c"
  "041b78681a35f07c3c929662fc66b6592c88588dc7297a5394ef7f923f2118e2"
  "554dff9f55697d4e8ec69e9aa53678aa5dae3e91aa13adc3b115526d8d51dfc9"
  "731431e47a5bc91c697d25c3a54fe7ba004752f5b66e0f282c47588ff7a314e6"
  "3fb1400c7dc9bbc3b5cb3ffedcbf4a9b09c53e28b57a7ff33a8a6b9048864090"
  "e297771c75bd2f81d637a3234f83568be62092f67d16946be23895fa92fa7119"
  "cf466889e8669754f9289233a593eacbbe7bb556b4d7b6e11940c637c18a2d32"
)
repology=("project: telegram-desktop")
maintainer=("Bahar KURT <kurtbahartr@gmail.com>")

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  install -dm755 "${pkgdir}/usr/share/applications/"
  cd "${pkgname}~${pkgver}"
  install -Dm755 "Telegram" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${srcdir}/icon256.png" "${pkgdir}/usr/share/pixmaps/telegram.png"
  install -Dm644 "${srcdir}/org.telegram.desktop.desktop" "${pkgdir}/usr/share/applications/org.telegram.desktop.desktop"
  install -d "${pkgdir}/usr/share/kservices5"
  install -d "${pkgdir}/usr/share/kde4/services"
  install -m644 "${srcdir}/tg.protocol" "${pkgdir}/usr/share/kservices5/tg.protocol"
  ln -s "/usr/share/kservices5/tg.protocol" "${pkgdir}/usr/share/kde4/services"
  local icon_size icon_dir
  for icon_size in 16 32 48 64 128 256 512; do
    icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -d "${icon_dir}"
    install -m644 "${srcdir}/icon${icon_size}.png" "${icon_dir}/telegram.png"
  done
  mkdir -p "${pkgdir}/usr/share/TelegramDesktop/externalupdater.d"
  echo "/usr/bin/telegram" > "${pkgdir}/usr/share/TelegramDesktop/externalupdater.d/telegram.conf"
}
