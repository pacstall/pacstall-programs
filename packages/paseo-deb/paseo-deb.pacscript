pkgname="paseo-deb"
gives="paseo"
replaces=("${gives}")
pkgver="0.16.2"
arch=("amd64")
url='https://paseo.sh'
pkgdesc="One interface for Claude Code, Codex, Copilot, OpenCode, and Pi agents
Run agents in parallel on your own machines from desktop, mobile, web, and CLI."
project=("project: paseo")
license=('AGPL-3.0')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/getpaseo/paseo/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
sha256sums_amd64=("64f542f81eafaf1ff7a28c642c022eaf2f053907c55dc6a220872bb13020bd82")
