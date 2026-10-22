pkgname="paseo-deb"
gives="paseo"
replaces=("${gives}")
pkgver="0.12.0"
arch=("amd64")
url='https://paseo.sh'
pkgdesc="One interface for Claude Code, Codex, Copilot, OpenCode, and Pi agents
Run agents in parallel on your own machines from desktop, mobile, web, and CLI."
project=("project: paseo")
license=('AGPL-3.0')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/getpaseo/paseo/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
sha256sums_amd64=("3bb741849b961d251eb107984c894b4dd01348a59343e9d7b105b9eb22e0f76e")
