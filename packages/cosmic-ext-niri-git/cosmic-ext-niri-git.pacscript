pkgname="cosmic-ext-niri"
pkgver="0.1.0"
pkgrel=1
url="https://github.com/Drakulix/cosmic-ext-extra-sessions"
pkgdesc="COSMIC-based alternative session with the niri compositor"
license=(GPL-3.0-or-later)

makedepends=("cargo")
pacdeps=("cosmic-ext-alternative-startup-git" "niri-git")

arch=("amd64" "arm64")
source=("https://github.com/Drakulix/cosmic-ext-extra-sessions.git")
nosubmodules=("cosmic-ext-extra-sessions")
external_connection=true

package() {
  cd "cosmic-ext-extra-sessions/niri"
  install -Dm0644 cosmic-ext-niri.desktop -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm0755 start-cosmic-ext-niri -t "${pkgdir}/usr/bin/"
}

post_install() {
  fancy_message info "If you haven't yet, run niri once to generate a config file"
  fancy_message info "In your niri config.kdl file, add the following line (removing any existing spawn-at-startup options):"
  fancy_message sub 'spawn-at-startup "cosmic-ext-alternative-startup"'
  fancy_message info "I also recommend adding the following lines for the full cosmic experience to your binds:"
  fancy_message sub 'Mod+T { spawn "cosmic-term"; }'
  fancy_message sub 'Mod+D { spawn "cosmic-launcher"; }'
  fancy_message sub 'Mod+Shift+D { spawn "cosmic-app-library"; }'
  fancy_message sub 'Mod+Alt+L { spawn "cosmic-greeter"; }'
  fancy_message info "Make sure to also disable any existing entries in your config for these modifiers."
}
