# Note: The official upstream .deb package contains postinst logic to add an OpenAI APT repository.
# This Pacstall package extracts the application payload directly, omitting upstream repository installation.
pkgname="chatgpt-deb"
gives="chatgpt"
pkgver="26.818.41705"
arch=('amd64' 'arm64')
pkgdesc="ChatGPT desktop application by OpenAI"
url='https://developers.openai.com/codex/app'
license=("custom:Proprietary")
source_amd64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_amd64.deb")
source_arm64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_arm64.deb")
sha256sums_amd64=("c927c985577bde5baccecc77f02e14b311d94e6230156621faf92579ac036a55")
sha256sums_arm64=("6375ad1e8a094f76791e20b9f31c888719cecfa13f0add2c4bbc809606f73481")
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
