pkgname="portfolio-performance-bin"
gives="portfolio-performance"
pkgver="0.83.1"
source=("@${pkgname}~${pkgver}::https://github.com/portfolio-performance/portfolio/releases/download/${pkgver}/PortfolioPerformance-${pkgver}-linux.gtk.x86_64.tar.gz")
source_arm64=("@${pkgname}~${pkgver}::https://github.com/portfolio-performance/portfolio/releases/download/${pkgver}/PortfolioPerformance-${pkgver}-linux.gtk.aarch64.tar.gz")
pkgdesc="Open source tool to calculate the overall performance of an investment portfolio"
arch=('amd64' 'arm64')
sha256sums=("310dc6039315f1e5839eeed25999bd8576d1c564cc3b4e2e34a390576c7a62f7")
sha256sums_arm64=("d4634f1a7b36aa820b0623de8d3108ea7b81949b5093ecd5048b5dc30b4b3888")
maintainer=("chrisb09 <christian.brinkmann09@gmail.com>")

package() {
  local extracted_root appdir
  extracted_root="${pkgname}~${pkgver}"

  if [[ -d "${extracted_root}/portfolio" ]]; then
    appdir="${extracted_root}/portfolio"
  elif [[ -d "portfolio" ]]; then
    appdir="portfolio"
  else
    appdir="$(dirname "$(find . -maxdepth 3 -type f -name 'PortfolioPerformance' | head -n 1)")"
  fi

  [[ -n ${appdir} && -d ${appdir} ]] || return 1

  mkdir -p "${pkgdir}/opt/${gives}"
  cp -a "${appdir}/." "${pkgdir}/opt/${gives}/"

  install -Dm644 "${appdir}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${gives}.xpm"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${gives}.desktop" << EOF
[Desktop Entry]
Name=Portfolio Performance
Comment=Track and analyze investment portfolio performance
Exec=${gives}
Icon=${gives}
Terminal=false
Type=Application
Categories=Office;Finance;
EOF

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${gives}" << EOF
#!/bin/sh
exec "/opt/${gives}/PortfolioPerformance" "$@"
EOF
}
