pkgname="fzf-bin"
gives="fzf"
pkgver="0.53.0"
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'armhf' 'ppc64el' 's390x')
license=('MIT')
sha256sums=("d45abbfb64f21913c633d46818d9d3eb3d7ebc7e94bd16f45941958aa5480e1d")
sha256sums_amd64=("af2663c3309967dc191d21537e53c2e9f8a37f490a32456b9498a006f05e3796")
sha256sums_arm64=("45b4cf8db6433d45cbcb65ffa6b52fd9ea7697fff3209705331514379d94a43b")
sha256sums_arm=("71b986c3a57144ac902b13231f33345c111ffd6689b884b3af6f2f609e3d5013")
sha256sums_ppc64el=("d53c8fcb42315adc96df0d14080c8eecebfbd14a3cc9124a8b58aeb710c6a0dd")
sha256sums_s390x=("87c9de52a4528e80c99fc120bed028ea48c9d2a1f10fc0f526e9328ad17aa5d1")
source=("${gives}-${pkgver}.tar.gz::https://github.com/junegunn/fzf/archive/refs/tags/${pkgver}.tar.gz")
source_amd64=("https://github.com/junegunn/fzf/releases/download/${pkgver}/fzf-${pkgver}-linux_amd64.tar.gz")
source_arm64=("https://github.com/junegunn/fzf/releases/download/${pkgver}/fzf-${pkgver}-linux_arm64.tar.gz")
source_arm=("https://github.com/junegunn/fzf/releases/download/${pkgver}/fzf-${pkgver}-linux_armv7.tar.gz")
source_ppc64el=("https://github.com/junegunn/fzf/releases/download/${pkgver}/fzf-${pkgver}-linux_ppc64le.tar.gz")
source_s390x=("https://github.com/junegunn/fzf/releases/download/${pkgver}/fzf-${pkgver}-linux_s390x.tar.gz")
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
