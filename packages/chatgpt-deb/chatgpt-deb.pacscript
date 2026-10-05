# Note: The official upstream .deb package contains postinst logic to add an OpenAI APT repository.
# This Pacstall package extracts the application payload directly, omitting upstream repository installation.
pkgname="chatgpt-deb"
gives="chatgpt"
pkgver="26.930.31730"
arch=('amd64' 'arm64')
pkgdesc="ChatGPT desktop application by OpenAI"
url='https://developers.openai.com/codex/app'
license=("custom:Proprietary")
source_amd64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_amd64.deb")
source_arm64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/${gives}/${gives}_${pkgver}_arm64.deb")
sha256sums_amd64=("e0174d8d0a5f4141145458c814f3c2d863dd67e942b868785a1f5dac9cba3e16")
sha256sums_arm64=("dd980085e9746fad8bd45b48354885d2ea3a9ad09889e0f0d6232f1d819b26b2")
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
