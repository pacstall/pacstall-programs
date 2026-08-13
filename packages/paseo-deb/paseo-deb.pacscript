pkgname="paseo-deb"
gives="paseo"
replaces=("${gives}")
pkgver="0.3.1"
arch=("amd64")
url='https://paseo.sh'
pkgdesc="One interface for Claude Code, Codex, Copilot, OpenCode, and Pi agents
Run agents in parallel on your own machines from desktop, mobile, web, and CLI."
project=("project: paseo")
license=('AGPL-3.0')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/getpaseo/paseo/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
sha256sums_amd64=("ea4f07aa22d2ab4aeaa34510160dbd0a9b4e8d4fb4e2872ff56fd6d7ae5898ee")
