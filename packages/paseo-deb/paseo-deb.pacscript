pkgname="paseo-deb"
gives="paseo"
replaces=("${gives}")
pkgver="0.13.0"
arch=("amd64")
url='https://paseo.sh'
pkgdesc="One interface for Claude Code, Codex, Copilot, OpenCode, and Pi agents
Run agents in parallel on your own machines from desktop, mobile, web, and CLI."
project=("project: paseo")
license=('AGPL-3.0')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/getpaseo/paseo/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
sha256sums_amd64=("4f88a1a320e023c66fc3cf2d5bf5e25edb9eaa4e342eb17544077e4e97056f97")
