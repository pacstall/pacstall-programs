# Note: The official upstream .deb package contains postinst logic to add an OpenAI APT repository.
# This Pacstall package extracts the application payload directly, omitting upstream repository installation.
pkgname="chatgpt-deb"
gives="chatgpt"
pkgver="26.803.81509"
arch=('amd64' 'arm64')
pkgdesc="ChatGPT desktop application by OpenAI"
url='https://developers.openai.com/codex/app'
license=("custom:Proprietary")
compatible=("ubuntu:noble" "ubuntu:resolute" "debian:trixie" "debian:sid")
depends=(
  "libgtk-3-0"
  "libnotify4"
  "libnss3"
  "xdg-utils"
  "libatspi2.0-0"
  "libdrm2"
  "libgbm1"
  "libxcb-dri3-0"
  "libasound2"
  "libatk-bridge2.0-0"
  "libatk1.0-0"
  "libc6"
  "libcairo2"
  "libcups2"
  "libdbus-1-3"
  "libexpat1"
  "libgcc-s1"
  "libgdk-pixbuf-2.0-0"
  "libgl1"
  "libglib2.0-0"
  "libnspr4"
  "libpango-1.0-0"
  "libssl3"
  "libstdc++6"
  "libudev1"
  "libusb-1.0-0"
  "libx11-6"
  "libx11-xcb1"
  "libxcb1"
  "libxcomposite1"
  "libxdamage1"
  "libxext6"
  "libxfixes3"
  "libxkbcommon0"
  "libxrandr2"
  "xz-utils"
)
source_amd64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_amd64.deb")
source_arm64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_arm64.deb")
sha256sums_amd64=("a9bf91a368f9f7c4eea38082a9fb8fb46b8d005b719a6d7715d2e5a1982c38eb")
sha256sums_arm64=("f38fcc194eca9ab0327dc10c92340681eae77c5d75164df700384ce2adaccbc1")
replaces=("${gives}" "${pkgname}")
breaks=("${replaces[@]}")
repology=("project: chatgpt")
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")

post_install() {
  update-desktop-database > /dev/null 2>&1 || true
  if command -v apparmor_parser > /dev/null 2>&1 && [[ -f /etc/apparmor.d/chatgpt ]]; then
    apparmor_parser -r -W -T /etc/apparmor.d/chatgpt > /dev/null 2>&1 || true
  fi
}
