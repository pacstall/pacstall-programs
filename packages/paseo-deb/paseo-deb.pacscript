pkgname="paseo-deb"
gives="paseo"
replaces=("${gives}")
pkgver="0.14.0"
arch=("amd64")
url='https://paseo.sh'
pkgdesc="One interface for Claude Code, Codex, Copilot, OpenCode, and Pi agents
Run agents in parallel on your own machines from desktop, mobile, web, and CLI."
project=("project: paseo")
license=('AGPL-3.0')
maintainer=("Christian F. Brinkmann <christian.brinkmann09@gmail.com>")
source_amd64=("https://github.com/getpaseo/paseo/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
sha256sums_amd64=("13fca44a81b5c8a02f967b4790e9677898d9f734682d1b0337d42833cc0fbbbf")
