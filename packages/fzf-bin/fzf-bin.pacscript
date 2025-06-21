pkgname="fzf-bin"
gives="fzf"
pkgver="0.62.0"
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'armhf' 'ppc64el' 's390x')
license=('MIT')
source=("${gives}-${pkgver}.tar.gz::https://github.com/junegunn/fzf/archive/refs/tags/v${pkgver}.tar.gz")
source_amd64=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_amd64.tar.gz")
source_arm64=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_arm64.tar.gz")
source_arm=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_armv7.tar.gz")
source_ppc64el=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_ppc64le.tar.gz")
source_s390x=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_s390x.tar.gz")
sha256sums=("e5beae86a3d026b2c2cfc165715d45b831b9f337a9e96f711ba3bc3d15e50900")
sha256sums_amd64=("64b56dd484a2317d5f04c28ac0791b36807f034adb419209ad39fb6637255794")
sha256sums_arm64=("929fd132705d02f222a52e23c076018ef3e699793dd5e8c3183bb11ed9b7696e")
sha256sums_arm=("fee57a3c3e19540e9830efd4995e7e132abbf995118c451a038bb36c5975b925")
sha256sums_ppc64el=("85d78f1527169e570aef8dfe63f7d15d426b409bbafbbce9477fc5c8058def65")
sha256sums_s390x=("3e18d7b5f868e4b7fe796cb3ed3b76af6e9d9efae4ed92cbf73283f7907976a1")
conflict=("fzf-bin" "fzf")
replaces=("${conflicts[@]}")
pkgdesc="general-purpose command-line fuzzy finder
 It's an interactive Unix filter for command-line that can be used with
 any list; files, command history, processes, hostnames, bookmarks, git
 commits, etc."
url='https://github.com/junegunn/fzf'
maintainer=("Eric Renfro <psi-jack@linux-help.org>")

prepare() {
  cd "${gives}-${pkgver}"
  gzip -9n man/man1/fzf.1
  gzip -9n man/man1/fzf-tmux.1
}

package() {
  cd "${srcdir}"
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"

  cd "${gives}-${pkgver}"
  install -Dm755 "bin/fzf-tmux" "${pkgdir}/usr/bin/fzf-tmux"
  install -Dm644 "man/man1/fzf.1.gz" "${pkgdir}/usr/man/man1/fzf.1.gz"
  install -Dm644 "man/man1/fzf-tmux.1.gz" "${pkgdir}/usr/man/man1/fzf-tmux.1.gz"
  install -Dm644 "shell/completion.bash" "${pkgdir}/usr/share/bash-completion/completions/fzf"
  install -Dm644 "shell/key-bindings.fish" "${pkgdir}/usr/share/fish/vendor_functions.d/fzf_key_bindings.fish"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${gives}/README.md"
  install -Dm644 "README-VIM.md" "${pkgdir}/usr/share/doc/${gives}/README-VIM.md"
  install -Dm644 "ADVANCED.md" "${pkgdir}/usr/share/doc/${gives}/ADVANCED.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/${gives}/copyright"
  install -Dm644 "shell/completion.zsh" "${pkgdir}/usr/share/doc/${gives}/examples/completion.zsh"
  install -Dm644 "shell/key-bindings.bash" "${pkgdir}/usr/share/doc/${gives}/examples/key-bindings.bash"
  install -Dm644 "shell/key-bindings.fish" "${pkgdir}/usr/share/doc/${gives}/examples/key-bindings.fish"
  install -Dm644 "shell/key-bindings.zsh" "${pkgdir}/usr/share/doc/${gives}/examples/key-bindings.zsh"
  install -Dm644 "plugin/fzf.vim" "${pkgdir}/usr/share/doc/${gives}/examples/plugin/fzf.vim"
}

# vim:set ft=sh ts=2 sw=2 et:
