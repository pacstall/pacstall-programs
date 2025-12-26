pkgbase="nerd-fonts"
pkgname=(
  "otf-aurulent-nerd"
  "otf-codenewroman-nerd"
  "otf-comicshanns-nerd"
  "otf-commit-mono-nerd"
  "otf-droid-nerd"
  "otf-firamono-nerd"
  "otf-geist-mono-nerd"
  "otf-hasklig-nerd"
  "otf-hermit-nerd"
  "otf-monaspace-nerd"
  "otf-opendyslexic-nerd"
  "otf-overpass-nerd"
  "ttf-0xproto-nerd"
  "ttf-3270-nerd"
  "ttf-agave-nerd"
  "ttf-anonymouspro-nerd"
  "ttf-arimo-nerd"
  "ttf-bigblueterminal-nerd"
  "ttf-bitstream-vera-mono-nerd"
  "ttf-cascadia-code-nerd"
  "ttf-cascadia-mono-nerd"
  "ttf-cousine-nerd"
  "ttf-d2coding-nerd"
  "ttf-daddytime-mono-nerd"
  "ttf-dejavu-nerd"
  "ttf-envycoder-nerd"
  "ttf-fantasque-nerd"
  "ttf-firacode-nerd"
  "ttf-go-nerd"
  "ttf-gohu-nerd"
  "ttf-hack-nerd"
  "ttf-heavydata-nerd"
  "ttf-iawriter-nerd"
  "ttf-ibmplex-mono-nerd"
  "ttf-inconsolata-go-nerd"
  "ttf-inconsolata-lgc-nerd"
  "ttf-inconsolata-nerd"
  "ttf-intone-nerd"
  "ttf-iosevka-nerd"
  "ttf-iosevkaterm-nerd"
  "ttf-iosevkatermslab-nerd"
  "ttf-jetbrains-mono-nerd"
  "ttf-lekton-nerd"
  "ttf-liberation-mono-nerd"
  "ttf-lilex-nerd"
  "ttf-martian-mono-nerd"
  "ttf-meslo-nerd"
  "ttf-monofur-nerd"
  "ttf-monoid-nerd"
  "ttf-mononoki-nerd"
  "ttf-mplus-nerd"
  "ttf-noto-nerd"
  "ttf-profont-nerd"
  "ttf-proggyclean-nerd"
  "ttf-recursive-nerd"
  "ttf-roboto-mono-nerd"
  "ttf-sharetech-mono-nerd"
  "ttf-sourcecodepro-nerd"
  "ttf-space-mono-nerd"
  "ttf-terminus-nerd"
  "ttf-tinos-nerd"
  "ttf-ubuntu-mono-nerd"
  "ttf-ubuntu-nerd"
  "ttf-victor-mono-nerd"
  "ttf-zed-mono-nerd"
)
pkgdesc="Iconic font aggregator, collection, and patcher"
arch=("all")
pkgver="3.4.0"
url='https://github.com/ryanoasis/nerd-fonts'
_urlbase="${url}/releases/download/v${pkgver}"
license=('MIT' 'OFL-1.1')
provides=('ttf-font-nerd')
maintainer=("Oren Klopfer <oren@taumoda.com>")
source=(
  "0xproto-${pkgver}.tar.xz::${_urlbase}/0xProto.tar.xz"
  "3270-${pkgver}.tar.xz::${_urlbase}/3270.tar.xz"
  "agave-${pkgver}.tar.xz::${_urlbase}/Agave.tar.xz"
  "anonymouspro-${pkgver}.tar.xz::${_urlbase}/AnonymousPro.tar.xz"
  "arimo-${pkgver}.tar.xz::${_urlbase}/Arimo.tar.xz"
  "aurulent-${pkgver}.tar.xz::${_urlbase}/AurulentSansMono.tar.xz"
  "bigblueterminal-${pkgver}.tar.xz::${_urlbase}/BigBlueTerminal.tar.xz"
  "bitstreamveramono-${pkgver}.tar.xz::${_urlbase}/BitstreamVeraSansMono.tar.xz"
  "cascadiacode-${pkgver}.tar.xz::${_urlbase}/CascadiaCode.tar.xz"
  "cascadiamono-${pkgver}.tar.xz::${_urlbase}/CascadiaMono.tar.xz"
  "codenewroman-${pkgver}.tar.xz::${_urlbase}/CodeNewRoman.tar.xz"
  "comicshanns-${pkgver}.tar.xz::${_urlbase}/ComicShannsMono.tar.xz"
  "commitmono-${pkgver}.tar.xz::${_urlbase}/CommitMono.tar.xz"
  "cousine-${pkgver}.tar.xz::${_urlbase}/Cousine.tar.xz"
  "daddytimemono-${pkgver}.tar.xz::${_urlbase}/DaddyTimeMono.tar.xz"
  "d2coding-${pkgver}.tar.xz::${_urlbase}/D2Coding.tar.xz"
  "dejavu-${pkgver}.tar.xz::${_urlbase}/DejavuSansMono.tar.xz"
  "droid-${pkgver}.tar.xz::${_urlbase}/DroidSansMono.tar.xz"
  "envycoder-${pkgver}.tar.xz::${_urlbase}/EnvyCodeR.tar.xz"
  "fantasque-${pkgver}.tar.xz::${_urlbase}/FantasqueSansMono.tar.xz"
  "fira-${pkgver}.tar.xz::${_urlbase}/FiraCode.tar.xz"
  "firamono-${pkgver}.tar.xz::${_urlbase}/FiraMono.tar.xz"
  "geistmono-${pkgver}.tar.xz::${_urlbase}/GeistMono.tar.xz"
  "go-${pkgver}.tar.xz::${_urlbase}/Go-Mono.tar.xz"
  "gohu-${pkgver}.tar.xz::${_urlbase}/Gohu.tar.xz"
  "hack-${pkgver}.tar.xz::${_urlbase}/Hack.tar.xz"
  "hasklig-${pkgver}.tar.xz::${_urlbase}/Hasklig.tar.xz"
  "heavydata-${pkgver}.tar.xz::${_urlbase}/HeavyData.tar.xz"
  "hermit-${pkgver}.tar.xz::${_urlbase}/Hermit.tar.xz"
  "iawriter-${pkgver}.tar.xz::${_urlbase}/iA-Writer.tar.xz"
  "ibmplexmono-${pkgver}.tar.xz::${_urlbase}/IBMPlexMono.tar.xz"
  "inconsolata-${pkgver}.tar.xz::${_urlbase}/Inconsolata.tar.xz"
  "inconsolatago-${pkgver}.tar.xz::${_urlbase}/InconsolataGo.tar.xz"
  "inconsolatalgc-${pkgver}.tar.xz::${_urlbase}/InconsolataLGC.tar.xz"
  "intone-${pkgver}.tar.xz::${_urlbase}/IntelOneMono.tar.xz"
  "iosevka-${pkgver}.tar.xz::${_urlbase}/Iosevka.tar.xz"
  "iosevkaterm-${pkgver}.tar.xz::${_urlbase}/IosevkaTerm.tar.xz"
  "iosevkatermslab-${pkgver}.tar.xz::${_urlbase}/IosevkaTermSlab.tar.xz"
  "jetbrainsmono-${pkgver}.tar.xz::${_urlbase}/JetBrainsMono.tar.xz"
  "lekton-${pkgver}.tar.xz::${_urlbase}/Lekton.tar.xz"
  "liberationmono-${pkgver}.tar.xz::${_urlbase}/LiberationMono.tar.xz"
  "lilex-${pkgver}.tar.xz::${_urlbase}/Lilex.tar.xz"
  "martianmono-${pkgver}.tar.xz::${_urlbase}/MartianMono.tar.xz"
  "meslo-${pkgver}.tar.xz::${_urlbase}/Meslo.tar.xz"
  "monaspace-${pkgver}.tar.xz::${_urlbase}/Monaspace.tar.xz"
  "monofur-${pkgver}.tar.xz::${_urlbase}/Monofur.tar.xz"
  "monoid-${pkgver}.tar.xz::${_urlbase}/Monoid.tar.xz"
  "mononoki-${pkgver}.tar.xz::${_urlbase}/Mononoki.tar.xz"
  "mplus-${pkgver}.tar.xz::${_urlbase}/MPlus.tar.xz"
  "noto-${pkgver}.tar.xz::${_urlbase}/Noto.tar.xz"
  "opendyslexic-${pkgver}.tar.xz::${_urlbase}/OpenDyslexic.tar.xz"
  "overpass-${pkgver}.tar.xz::${_urlbase}/Overpass.tar.xz"
  "profont-${pkgver}.tar.xz::${_urlbase}/ProFont.tar.xz"
  "proggyclean-${pkgver}.tar.xz::${_urlbase}/ProggyClean.tar.xz"
  "recursive-${pkgver}.tar.xz::${_urlbase}/Recursive.tar.xz"
  "robotomono-${pkgver}.tar.xz::${_urlbase}/RobotoMono.tar.xz"
  "sharetechmono-${pkgver}.tar.xz::${_urlbase}/ShareTechMono.tar.xz"
  "sourcecodepro-${pkgver}.tar.xz::${_urlbase}/SourceCodePro.tar.xz"
  "spacemono-${pkgver}.tar.xz::${_urlbase}/SpaceMono.tar.xz"
  "terminus-${pkgver}.tar.xz::${_urlbase}/Terminus.tar.xz"
  "tinos-${pkgver}.tar.xz::${_urlbase}/Tinos.tar.xz"
  "ubuntu-${pkgver}.tar.xz::${_urlbase}/Ubuntu.tar.xz"
  "ubuntumono-${pkgver}.tar.xz::${_urlbase}/UbuntuMono.tar.xz"
  "victormono-${pkgver}.tar.xz::${_urlbase}/VictorMono.tar.xz"
  "zedmono-${pkgver}.tar.xz::${_urlbase}/ZedMono.tar.xz"
)
sha256sums=(
  'effaa4c257c1f25e6d2d50679e9b845eab36b346dea9ee26f4405da1a21e6428'
  '6d9dd76987968e8a0b30d3ae4d18b8139d6ddf6cd53409272dbc596654ea38b1'
  'fe4879b0cff2d33d7fb08d1c8ba4e0cad9f44843644fe284fda1e89addf9c4ab'
  '7ebace54eda35943062eaad9dd4f16de24390b672f31bff45475b82acb1955c0'
  '006464de19502bd49a72265058811665b62b823509bbbd2e7181ba87046b6b08'
  'a0d642ace8f9d616a9c9cbbe46e188c60ddf7486b0cf2685a3558e06aba2c284'
  '9df627ec74a21f4da8df4821dba85cabcc452f95b636e8802eeaa2e6f3129e13'
  '59162ab2d67d39827e497beda03fbe6327d3535d2ee3b1dd7050fdeafe1f9c36'
  '804b3d311665a059140466fe142cc76cf14ef0695b7c4d3a174f7f8fba46b6e3'
  '7c22db8c8460ef62abffbb6d5c7b212507de0798a4a762fa2a005a8bc4c90fc6'
  '2db8def7863ea49b6ef69f353988d7e0f73a8646722e5946932740d76eb46b25'
  '23d90d18dae663b7d0dcdb4edd2f5087eecb40b00f046a1f46a9abf3ecb47651'
  '44cdabae7708de3548fdd78ed59cdbb1fedbca18e16644047ed4a23623a530ca'
  '63bc50fc2b88897096626cf9e835d4237ee0052f9bfd902dc1f5304c693c32e6'
  '854c8cbf59e1fcc48f114408d93f63cad70c6ba8eefad5bf3071bd9dd8ef48f8'
  '5b4e8c53599ee79067a4439bfbf31bb3f1b40e93ac6493f718b48feaf972173d'
  '0e58ff9c1f9378922b7f324fdba953929d88d61b36aedd80ee43964567b226cc'
  '43ad0a4e238ad078300d0aa2ebca5f7aaf6ff2cdb25c5cfe8191b79aab7d0af2'
  'b631d34ab3e3e26aba7169b382d573d82bc6647d3ddae67e9ce28481f64715e7'
  '462b5490475fb8560dded4eb6cdd9cfd0049b800acee329094def095557d0ffd'
  'd83fb093e0e05a531cd6f19886a6ceb884a4fa5ea3b53cf099fc1f30c5b3e47d'
  '2e4adc97fefdfa2ad70a6e6e79bc0418acd401a305bcb5fcd848a84e03e35a74'
  '43ef3d73cadddea5be746e20c9f27fbaa59ceb106b8b26f7245ba2de2e46b1f6'
  '81c879e6a86dd6e6cb94d7a73322bf39f06b3294a727effb5a5bb5c7f9274fd6'
  '458b08f1216c18a46fc3e00701d6d171a4d536192b0885c041d8cc1befb6b44d'
  '1d00a1435638084174516975840854368a45ac30bb0bad2c0c49db713b5925f0'
  'e82418895a7036158baf9a425faea7de1fe332267b218341eec44c6b5071d1ad'
  'ed0d49911ae0caa1d625ae64832b49b4c94e90fa2ec0b1e5e7df440ccb28698b'
  '206ae23c386dcb84a2dfaca678af36123fbaff1fb402326021973485018467f3'
  '0156f309d942d9066a83005dd42588719a1755fb78e345e5f22ff582da46211b'
  '95e6ecaa5dfb9a96f27a6b6edc7be396fb6df30bc311a6f7e15cad56a30051c2'
  '47df94d3826a9f3e94b4c596a78f5baaddfb27f25bdb7906c5cf65caf8962eb2'
  '0407ab5ddd9f6a9af5f178d5fa1732cbf8275c4fe6e03793adbe48bfd6c04884'
  '59b5961b83f0fd64ef579099ca0209dd706d5025feac813c80fcc2d0648d717f'
  '9d55174210a512c6c9d0601532033d05d9e8817c760cb9ccca3c6c9c4ff6d7c1'
  '213ee24cda99ca84d0a8326de133e7e8b2baf9ba23659ce829f589f771d357d2'
  'cad9da572d25e3413f7a15a319d2f3c9e7e915ee016baa99e0d88fc08cf5b781'
  '8990ca82b481a02734cb96f46db789716735ca8f6c4bf89d800899a593a1f0ca'
  'ef552a3e638f25125c6ad4c51176a6adcdce295ab1d2ffacf0db060caf8c1582'
  '2a7fa12bf2b376307c9ca2501227b0d91dcae25c453ec095e5f768a2ca5b6fe9'
  '64a9519dd6b75179a9363f9c8a0cefe2984ec8578394ced66e9d0fffd2be922f'
  '1d011e82a59aec26bff5564ca90a8e51636364e5b7f79417708aa2c846c633b3'
  'e12f5ca02756268e794d06d9cb2ada93d021ec915f5a43ec2cd77355022f3624'
  'a57936d96aefb5cfff0660f3294210ee04705529af6cf811e2274b0923a03939'
  '5fdb97828e1a23fd28ea5ed0e7d15cdebb77ef079aaa48b93f1526764b40ef8c'
  '539dc64f089b189c5f14ee60df6368742cc63ccc3be753bd3c8bfba7632fe068'
  '5c6efd6fe2f2856d5294748dc751770d1c8889665f42687a0ac8f1b3a86a3299'
  '5c9b3035d45aabfe1fb3ce5e3028130043398cecc1409b20fe8273692192726e'
  '9c03e388d0ff2e0bc28be9bf6ab95f1e0260c5828b3159b18867a9e7a1f17f7b'
  'e28b31609d17fc50bdf9e6730c947a61b0e474af726c2c044c39bc78fcd9bfde'
  '2155e95e9c7b12d785dc589033290a8caff07c11cf1697ec3ad0bda37e3b0433'
  '4d6d7e8b91840bb2b18bc7ac427f979183e68b6b061db58b4139ad5679bdc36f'
  'c6d595ac9f7e0d6ac87c4c57e26c7515c544e8e5ac553c5a215394d12b201a8f'
  '910c51cb06ff3233daee1d045e606ed77c290ea25dd1a54378e0517601f4785c'
  'a047ac2e724c1614ef4350af83f35cd1d044d8d20e6477c319172b860b19329a'
  '4bc63bf0105c664e466e62cb2fd1c143b310877de93dc35b3b5d48e0e4cb6702'
  '11bb01a73894f932a3702551245aa0c57d121ebf59dd293fac5ceac81af822d1'
  'd52d97b66c4c5d6d9d99c88df55148faf39738f244485026f22f8e47407744f4'
  'd159c6f13291723f1821d1064a7d3e0933d96297d55bab27d76861472af68111'
  'e857b18a99701528f873275b6012792caf6e30c34c512ee92cda51520140054f'
  'c54f03f38fbf897f34235bc5989500361251f61220cf63afedd730edd221714e'
  '534bf0ffb311a993fd23666a7f3e4f4a0cfc0662abfa8b81594705cceefb69e3'
  'a13cf890ef10517c59e812ced167245f2db47d37d2b03c9fb43ddef023a3e776'
  '67bb8c729aedbe2e0258435c78e52bb1753618a1d3d7c0c94e6f1c47763a56a9'
  '7dfff6bb0e45143c33703c3fdf3ff77b00f3617fef29671c7ff6af166dcf31a0'
)
noextract=("${source[@]%%::*}")

prepare() {
  # archives don't include a font-specific directory, so we have to make them
  for _font in 3270 agave anonymouspro arimo aurulent bigblueterminal \
    bitstreamveramono cascadiacode codenewroman cousine \
    daddytimemono dejavu droid fantasque fira firamono go hack \
    hasklig heavydata hermit iawriter ibmplexmono inconsolata \
    inconsolatago inconsolatalgc iosevka jetbrainsmono lekton \
    liberationmono lilex meslo monofur monoid mononoki mplus noto \
    opendyslexic overpass profont proggyclean robotomono \
    sharetechmono sourcecodepro spacemono terminus tinos ubuntu \
    ubuntumono victormono iosevkaterm comicshanns intone 0xproto \
    cascadiamono commitmono d2coding envycoder geistmono martianmono \
    monaspace gohu iosevkatermslab recursive zedmono; do
    rm -rf "${_font}"
    mkdir -p "${_font}"
    tar -xf "${_font}-${pkgver}.tar.xz" -C "${_font}"
  done
}

package_ttf-0xproto-nerd() {
  pkgdesc="Patched font 0xProto from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 0xproto/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 0xproto/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-3270-nerd() {
  pkgdesc="Patched font IBM 3270 from nerd fonts library"
  license=('BSD-3-Clause')

  install -Dm644 3270/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 3270/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-agave-nerd() {
  pkgdesc="Patched font Agave from nerd fonts library"
  license=('MIT')
  conflicts=(nerd-fonts-agave)
  replaces=(nerd-fonts-agave)

  install -Dm644 agave/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 agave/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-anonymouspro-nerd() {
  pkgdesc="Patched font Anonymous Pro (Anonymice) from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-anonymous-pro)
  replaces=(nerd-fonts-anonymous-pro)

  install -Dm644 anonymouspro/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 anonymouspro/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-arimo-nerd() {
  pkgdesc="Patched font Arimo from nerd fonts library"
  license=('Apache-2.0')
  conflicts=(nerd-fonts-arimo)
  replaces=(nerd-fonts-arimo)

  install -Dm644 arimo/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 arimo/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-aurulent-nerd() {
  pkgdesc="Patched font Aurulent Sans Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 aurulent/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 aurulent/"SIL Open Font License.txt" \
    -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-bigblueterminal-nerd() {
  pkgdesc="Patched font Big Blue Terminal from nerd fonts library"
  license=('CC-BY-SA-4.0')

  install -Dm644 bigblueterminal/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 bigblueterminal/LICENSE.TXT \
    -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-bitstream-vera-mono-nerd() {
  pkgdesc="Patched font Bitstream Vera Mono from nerd fonts library"
  license=('Bitstream-Vera')
  conflicts=(nerd-fonts-bitstream-vera-mono)
  replaces=(nerd-fonts-bitstream-vera-mono)

  install -Dm644 bitstreamveramono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 bitstreamveramono/"Bitstream Vera License.txt" \
    -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-cascadia-code-nerd() {
  pkgdesc="Patched font Cascadia Code (Caskaydia) from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-cascadia-code)
  replaces=(nerd-fonts-cascadia-code otf-cascadia-code-nerd)

  install -Dm644 cascadiacode/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 cascadiacode/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-cascadia-mono-nerd() {
  pkgdesc="Patched font Cascadia Mono (Caskaydia) from nerd fonts library"
  license=('OFL-1.1-RFN')

  install -Dm644 cascadiamono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 cascadiamono/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-codenewroman-nerd() {
  pkgdesc="Patched font Code New Roman from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 codenewroman/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 codenewroman/license.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-comicshanns-nerd() {
  pkgdesc="Patched font Comic Sans (Comic Shanns) from nerd fonts library"
  license=('MIT')

  install -Dm644 comicshanns/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 comicshanns/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-commit-mono-nerd() {
  pkgdesc="Patched font Commit Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 commitmono/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 commitmono/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-cousine-nerd() {
  pkgdesc="Patched font Cousine from nerd fonts library"
  license=('Apache-2.0')

  install -Dm644 cousine/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 cousine/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-d2coding-nerd() {
  pkgdesc="Patched font D2Coding from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 d2coding/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 d2coding/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-daddytime-mono-nerd() {
  pkgdesc="Patched font Daddy Time Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 daddytimemono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 daddytimemono/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-dejavu-nerd() {
  pkgdesc="Patched font Dejavu Sans Mono from nerd fonts library"
  license=('Bitstream-Vera')
  conflicts=(nerd-fonts-dejavu-complete)
  replaces=(nerd-fonts-dejavu-complete)

  install -Dm644 dejavu/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 dejavu/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-droid-nerd() {
  pkgdesc="Patched font Droid Sans Mono from nerd fonts library"
  license=('Apache-2.0')
  conflicts=(nerd-fonts-droid-sans-mono)
  replaces=(nerd-fonts-droid-sans-mono)

  install -Dm644 droid/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 droid/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-envycoder-nerd() {
  pkgdesc="Patched font Envy Code R from nerd fonts library"
  license=('OFL-1.1-RFN')

  install -Dm644 envycoder/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 envycoder/LICENCE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-fantasque-nerd() {
  pkgdesc="Patched font Fantasque Sans Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-fantasque-sans-mono)
  replaces=(nerd-fonts-fantasque-sans-mono)

  install -Dm644 fantasque/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 fantasque/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-firacode-nerd() {
  pkgdesc="Patched font Fira (Fura) Code from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-fira-code)
  replaces=(nerd-fonts-fira-code)

  install -Dm644 fira/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 fira/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-firamono-nerd() {
  pkgdesc="Patched font Fira (Fura) Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-fira-mono)
  replaces=(nerd-fonts-fira-mono)

  install -Dm644 firamono/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 firamono/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-geist-mono-nerd() {
  pkgdesc="Patched font Geist Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 geistmono/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 geistmono/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-go-nerd() {
  pkgdesc="Patched font Go Mono from nerd fonts library"
  license=('BSD-3-Clause-Clear')
  conflicts=(nerd-fonts-go-mono)
  replaces=(nerd-fonts-go-mono)

  install -Dm644 go/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 go/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-gohu-nerd() {
  pkgdesc="Patched font Gohufont from nerd fonts library"
  license=('WTFPL')

  install -Dm644 gohu/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 gohu/COPYING-LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-hack-nerd() {
  pkgdesc="Patched font Hack from nerd fonts library"
  license=('MIT' 'Bitstream-Vera')
  conflicts=(nerd-fonts-hack)
  replaces=(nerd-fonts-hack)

  install -Dm644 hack/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 hack/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-hasklig-nerd() {
  pkgdesc="Patched font Hasklig (Hasklug) from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-hasklig)
  replaces=(nerd-fonts-hasklig)

  install -Dm644 hasklig/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 hasklig/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-heavydata-nerd() {
  pkgdesc="Patched font Heavy Data from nerd fonts library"
  license=('custom:LicenseRef-Vic-Fieger-License')

  install -Dm644 heavydata/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 heavydata/"Vic Fieger License.txt" \
    -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-hermit-nerd() {
  pkgdesc="Patched font Hermit from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-hermit)
  replaces=(nerd-fonts-hermit)

  install -Dm644 hermit/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 hermit/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-iawriter-nerd() {
  pkgdesc="Patched font iA Writer (iM Writing) from nerd fonts library"
  license=('OFL-1.1-RFN')

  install -Dm644 iawriter/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 iawriter/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-ibmplex-mono-nerd() {
  pkgdesc="Patched font IBM Plex Mono (Blex) from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-ibm-plex-mono)
  replaces=(nerd-fonts-ibm-plex-mono)

  install -Dm644 ibmplexmono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 ibmplexmono/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-inconsolata-nerd() {
  pkgdesc="Patched font Inconsolata from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-inconsolata)
  replaces=(nerd-fonts-inconsolata)

  install -Dm644 inconsolata/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 inconsolata/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-inconsolata-go-nerd() {
  pkgdesc="Patched font Inconsolata Go from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-inconsolata-go)
  replaces=(nerd-fonts-inconsolata-go)

  install -Dm644 inconsolatago/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 inconsolatago/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-inconsolata-lgc-nerd() {
  pkgdesc="Patched font Inconsolata LGC from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-inconsolatalgc)
  replaces=(nerd-fonts-inconsolatalgc)

  install -Dm644 inconsolatalgc/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 inconsolatalgc/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-intone-nerd() {
  pkgdesc="Patched font Intone (Intel One) from nerd fonts library"
  license=('OFL-1.1-RFN')

  install -Dm644 intone/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 intone/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-iosevka-nerd() {
  pkgdesc="Patched font Iosevka from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-iosevka)
  replaces=(nerd-fonts-iosevka)

  install -Dm644 iosevka/*.ttf -t "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 iosevka/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-iosevkaterm-nerd() {
  pkgdesc="Patched font Iosevka Term from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 iosevkaterm/*.ttf -t "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 iosevkaterm/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-iosevkatermslab-nerd() {
  pkgdesc="Patched font Iosevka Term Slab from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 iosevkatermslab/*.ttf -t "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 iosevkatermslab/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-jetbrains-mono-nerd() {
  pkgdesc="Patched font JetBrains Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-jetbrains-mono)
  replaces=(nerd-fonts-jetbrains-mono)

  install -Dm644 jetbrainsmono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 jetbrainsmono/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-lekton-nerd() {
  pkgdesc="Patched font Lekton from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 lekton/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 lekton/"SIL Open Font License.txt" \
    -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-liberation-mono-nerd() {
  pkgdesc="Patched font Liberation Mono from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-liberation-mono)
  replaces=(nerd-fonts-liberation-mono)

  install -Dm644 liberationmono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 liberationmono/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-lilex-nerd() {
  pkgdesc="Patched font Lilex from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 lilex/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 lilex/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-martian-mono-nerd() {
  pkgdesc="Patched font Martian Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 martianmono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 martianmono/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-meslo-nerd() {
  pkgdesc="Patched font Meslo LG from nerd fonts library"
  license=('Apache-2.0')
  conflicts=(nerd-fonts-meslo)
  replaces=(nerd-fonts-meslo)

  install -Dm644 meslo/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 meslo/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-monaspace-nerd() {
  pkgdesc="Patched font Monaspace (Monaspice) from nerd fonts library"
  license=('OFL-1.1-RFN')

  install -Dm644 monaspace/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 monaspace/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-monofur-nerd() {
  pkgdesc="Patched font Monofur from nerd fonts library"
  license=('custom:LicenseRef-Monofur-Free-License')
  conflicts=(nerd-fonts-monofur)
  replaces=(nerd-fonts-monofur)

  install -Dm644 monofur/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 monofur/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-monoid-nerd() {
  pkgdesc="Patched font Monoid from nerd fonts library"
  license=('MIT' 'OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-monoid)
  replaces=(nerd-fonts-monoid)

  install -Dm644 monoid/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 monoid/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-mononoki-nerd() {
  pkgdesc="Patched font Mononoki from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-mononoki)
  replaces=(nerd-fonts-mononoki)

  install -Dm644 mononoki/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 mononoki/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-mplus-nerd() {
  pkgdesc="Patched font MPlus from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-mplus)
  replaces=(nerd-fonts-mplus)

  install -Dm644 mplus/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 mplus/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-noto-nerd() {
  pkgdesc="Patched font Noto from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-noto)
  replaces=(nerd-fonts-noto)

  install -Dm644 noto/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 noto/LICENSE_OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-opendyslexic-nerd() {
  pkgdesc="Patched font OpenDyslexic from nerd fonts library"
  license=('Bitstream-Vera')

  install -Dm644 opendyslexic/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 opendyslexic/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_otf-overpass-nerd() {
  pkgdesc="Patched font Overpass from nerd fonts library"
  license=('OFL-1.1-no-RFN' 'LGPL-2.1-only')
  conflicts=(nerd-fonts-overpass)
  replaces=(nerd-fonts-overpass)

  install -Dm644 overpass/*.otf -t "${pkgdir}/usr/share/fonts/OTF"
  install -Dm644 overpass/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-profont-nerd() {
  pkgdesc="Patched font ProFont from nerd fonts library"
  license=('MIT')
  conflicts=(nerd-fonts-profont)
  replaces=(nerd-fonts-profont)

  install -Dm644 profont/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 profont/LICENSE -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-proggyclean-nerd() {
  pkgdesc="Patched font ProggyClean from nerd fonts library"
  license=('MIT')

  install -Dm644 proggyclean/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 proggyclean/Licence.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-recursive-nerd() {
  pkgdesc="Patched font Recursive Mono (Rec Mono) from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 recursive/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 recursive/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-roboto-mono-nerd() {
  pkgdesc="Patched font Roboto Mono from nerd fonts library"
  license=('Apache-2.0')
  conflicts=(nerd-fonts-roboto-mono)
  replaces=(nerd-fonts-roboto-mono)

  install -Dm644 robotomono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 robotomono/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-sharetech-mono-nerd() {
  pkgdesc="Patched font Share Tech Mono (Shure Tech Mono) from nerd fonts library"
  license=('OFL-1.1-RFN')

  install -Dm644 sharetechmono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 sharetechmono/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-sourcecodepro-nerd() {
  pkgdesc="Patched font Source Code Pro from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-source-code-pro)
  replaces=(nerd-fonts-source-code-pro)

  install -Dm644 sourcecodepro/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 sourcecodepro/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-space-mono-nerd() {
  pkgdesc="Patched font Space Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(nerd-fonts-source-space-mono)
  replaces=(nerd-fonts-source-space-mono)

  install -Dm644 spacemono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 spacemono/OFL.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-terminus-nerd() {
  pkgdesc="Patched font Terminus (Terminess) from nerd fonts library"
  license=('OFL-1.1-RFN')
  conflicts=(nerd-fonts-terminus)
  replaces=(nerd-fonts-terminus)

  install -Dm644 terminus/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 terminus/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-tinos-nerd() {
  pkgdesc="Patched font Tinos from nerd fonts library"
  license=('Apache-2.0')
  conflicts=(nerd-fonts-source-tinos)
  replaces=(nerd-fonts-source-tinos)

  install -Dm644 tinos/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 tinos/"Apache License.txt" -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-ubuntu-mono-nerd() {
  pkgdesc="Patched font Ubuntu Mono from nerd fonts library"
  license=('custom:LicenseRef-Ubuntu-Font-License-1.0')
  conflicts=(nerd-fonts-ubuntu-mono ttf-ubuntumono-nerd)
  replaces=(nerd-fonts-ubuntu-mono ttf-ubuntumono-nerd)

  install -Dm644 ubuntumono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 ubuntumono/LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-ubuntu-nerd() {
  pkgdesc="Patched font Ubuntu from nerd fonts library"
  license=('custom:LicenseRef-Ubuntu-Font-License-1.0')
  conflicts=(nerd-fonts-ubuntu)
  replaces=(nerd-fonts-ubuntu)

  install -Dm644 ubuntu/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 ubuntu/LICENCE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-victor-mono-nerd() {
  pkgdesc="Patched font Victor Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')
  conflicts=(ttf-nerd-fonts-victor-mono)
  replaces=(ttf-nerd-fonts-victor-mono)

  install -Dm644 victormono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 victormono/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pacname}/"
}

package_ttf-zed-mono-nerd() {
  pkgdesc="Patched font Zed Mono from nerd fonts library"
  license=('OFL-1.1-no-RFN')

  install -Dm644 zedmono/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 zedmono/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pacname}/"
}
