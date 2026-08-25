pkgname="fzf-bin"
gives="fzf"
pkgver="0.74.2"
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'armhf' 'ppc64el' 's390x')
license=('MIT')
source=("${gives}-${pkgver}.tar.gz::https://github.com/junegunn/fzf/archive/refs/tags/v${pkgver}.tar.gz")
source_amd64=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_amd64.tar.gz")
source_arm64=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_arm64.tar.gz")
source_arm=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_armv7.tar.gz")
source_ppc64el=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_ppc64le.tar.gz")
source_s390x=("https://github.com/junegunn/fzf/releases/download/v${pkgver}/fzf-${pkgver}-linux_s390x.tar.gz")
sha256sums=("3ce36bd4fb0cde458a7f93c11ef534408d92c3bf19e6acc90e112f3e9e2acc60")
sha256sums_amd64=("b3648f48675612b69ee35371cf6dc99ca96d767e89b912d079080916ac8ba8bd")
sha256sums_arm64=("1373e3f5ed3c468179d4529942ddd96c234bcad1bcacaf238916e26a5234b5b2")
sha256sums_arm=("be111252281a867a64906a750d6b9aabb7a6653a6bf9d618d97679d03835ffa4")
sha256sums_ppc64el=("14d70f5cffb79924f2118294f86f31046bbffa04df37cd20db727d498f431736")
sha256sums_s390x=("74a13cec14445102d92c6e9b488ee3ac6b17ebeb8c7becbf3d781a8a14cc70ba")
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
