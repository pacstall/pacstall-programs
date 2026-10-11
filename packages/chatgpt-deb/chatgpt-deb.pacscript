# Note: The official upstream .deb package contains postinst logic to add an OpenAI APT repository.
# This Pacstall package extracts the application payload directly, omitting upstream repository installation.
pkgname="chatgpt-deb"
gives="chatgpt"
pkgver="26.1007.21434"
arch=('amd64' 'arm64')
pkgdesc="ChatGPT desktop application by OpenAI"
url='https://developers.openai.com/codex/app'
license=("custom:Proprietary")
source_amd64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_amd64.deb")
source_arm64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_arm64.deb")
sha256sums_amd64=("276b5341c3d74b261d3ad52106f7fa7edde06841e4767fe2a40cb54099b1f3ed")
sha256sums_arm64=("55fae1e3fb1d6069a90620e9e70737dcf8bf2255604d157e282cc6748a1baf49")
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
