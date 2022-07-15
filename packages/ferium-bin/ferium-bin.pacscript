name="ferium-bin"
pkgname="ferium"
breaks="${pkgname}"
replace="${pkgname}-git"
repology=("project: ${pkgname}")
version="4.1.5"
url="https://github.com/gorilla-devs/${pkgname}/releases/download/v${version}/${pkgname}-linux-gnu-nogui.zip"
hash="7ae7278a9b814f0cde84775ea2e79a56a6ee85e5bea98b8d051142db9996ea89"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 ferium "${STOWDIR}/${name}/usr/bin/${pkgname}"
  mkdir -p ~/.config/ferium
  # create a default config or else ferium will fail to do completions
  if ! [[ -f ~/.config/ferium/config.json ]]; then
    fancy_message info "Creating default config at ~/.config/ferium/config.json"
    echo '{
"active_profile": 0,
"active_modpack": 0,
"profiles": [],
"modpacks": []
}' | tee ~/.config/ferium/config.json > /dev/null
  fi
  # install completions
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete bash | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/bash-completion/completions/ferium"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete fish | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/fish/vendor_completions.d/ferium.fish"
  "${STOWDIR}/${name}/usr/bin/${pkgname}" complete zsh | sudo install -Dm644 /dev/stdin "${STOWDIR}/${name}/usr/share/zsh/site-functions/_ferium"
}

removescript() {
  if ask "Do you want to remove ~/.config/ferium/config.json" N; then
    rm -f ~/.config/ferium/config.json
  else
    true
  fi
}

# vim:set ft=sh ts=2 sw=2 et:
