pkgname=asdf-vm
pkgver=0.14.1
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more'
repology=("project: ${pkgname}")
arch=('any')
url='https://asdf-vm.com'
license=('MIT')
depends=(
  'curl'
  'git'
)
optdepends=(
  'build-essential: Array of tools to build software'
  'bash-completion: For completions to work in Bash'
  'libncurses5-dev: Text-based UI library for terminal applications'
  'libncurses-dev: Text-based UI library for terminal applications'
  'unzip: Needed by some plugins, like Elixir'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asdf-vm/asdf/archive/v${pkgver}.tar.gz")
sha256sums=('308a7f2e1eb551e435458974fbe37dcef1c940e961ad40e47ae78cabc154543e')

package() {
  cd "asdf-${pkgver}"

  local dst="${pkgdir}/opt/${pkgname}"
  mkdir -p "${dst}"

  cp -r bin lib asdf.elv asdf.fish asdf.nu asdf.sh defaults help.txt version.txt "${dst}"

  local usrshare="${pkgdir}/usr/share"

  local docdir="${usrshare}/doc/${pkgname}"
  mkdir -p "${docdir}"
  cp help.txt "${docdir}"

  # https://aur.archlinux.org/packages/asdf-vm#comment-886293
  find . \
    -path ./.github \
    -prune \
    -o \
    -name '*.md' \
    -exec cp --parents '{}' "${docdir}" \;

  install -Dm644 -t "${usrshare}/licenses/${pkgname}/" LICENSE

  cd completions

  install -Dm644 asdf.bash "${usrshare}/bash-completion/completions/asdf"
  install -Dm644 asdf.fish "${usrshare}/fish/vendor_completions.d/asdf.fish"
  install -Dm644 _asdf "${usrshare}/zsh/site-functions/_asdf"
}

post_install() {
  cat << EOF

Add the following line to your .bashrc or .profile:
. /opt/asdf-vm/asdf.sh

For more information see the official instructions [0].
Especially the section titled "YOUR_SHELL & Pacman".

[0] https://asdf-vm.com/guide/getting-started.html#_3-install-asdf

EOF
}
