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
pkgver="3.3.0"
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
  'd72bdd83f02a9071d4bb0acd38a37fe687a47bd29189e838edf847ed39b87e10'
  '304010729a11da9bea9f2f1e35e84f4f2240cd8b0ec2a315ef3c1af0ba3af185'
  '2f7939592934ac02ed74e90556a7e13e95ca621b6e44df31db729ae6930f9cb4'
  '85798dd957cb18837c387ca7fd43044a62830a58860d24e7bd315fc10b5b94f6'
  '4abbf467968a0f31bb3ad8da7ecd15117cdc8265a67a793e5b9ded6437654ce7'
  'b1898e9bbfa1cbea8fd514b151ff4bb572d2562234e942408a9ef90dfb14075f'
  '44bf48101c6c31f6777a42430021681cf54c2f0699f1357a33c73c8788c5aa35'
  '0e5c4ed24358be59a8f7268f3b7352d92f5f19894cdbc62e3c0d91af16250d95'
  '86ac1e16199fe9c3448a7882e4f3e90c11c27396fd4771c552661648e3d18f96'
  '29e494f00c6ec0bbbeba031cb69f30ebbe4cf46945d341e0347aab7073049bf0'
  'b032b5521c070076148f986d861708ed142fe19f2014a9f248ca4d0a43e9cc8e'
  'cb3667e107e265010566d05e544170b57eec3808f33b0c1790b3b1bd069690aa'
  'aa7f15a591374a04379223a0c224cd66a7c98938e52cda306311681cc51a1c22'
  'c7ee3224ff34c69fadfe947d5a9bf349952206cf8e0708564f7cf3d49095d4d8'
  '8a4b6f1fda69bad7dbf102059416998caa5a870fb413c49e88d64ac2912a93e5'
  'cad0abe4898b6d9aa12d28c4383ea7260eadba951b6ed9d347a524efc234dd1b'
  'e02d9dcf740b6fe72288ece5ea235a78cdc3763502b2682d7659c7618d4400c5'
  '1e2b79f888e4d07617857ddae0f82ffe07b65328fc0664e9a94bc0fac1aef888'
  'be99355fc93e9c351a4c70d7713c8f4fe038a65ac72f7ac9cc5550bc52734b70'
  '947166571476762b8e9b87a6b0532f9eab29147dc9e5d15aad1b7983229328d7'
  '7c64c44d7e530b25faf23904e135e9d1ff0339a92ee64e35e7da9116aa48af67'
  'd23c8db9d53397606bcfe6593f576abb12dd8e3d0605062231e391e2719e92c0'
  '8c5cacfa8a1fe276ea4ebdbe3b542ce71a7144c04a811c9f210faa401b436b3b'
  'd3d2a8ec7f30513e52412f8907ec4838fd5843323b9e2a5a841de6531aff9a3a'
  'da43efcf1eb53dc1773938861a9f3fcb19b71065a6a5bb0295e6038e90545027'
  'f797524e4b99191a5f35614c6fe48e96f7b8872712e2943a2aaf59cda086e909'
  '9cb2f02337782dd5eb1711f9890edaeea3d59eca00dd7ea3810c237336883fe3'
  'a3473e58cf5a7469a511dfdba2935611945e5cbd2f17d09a361c1ce19a30df0f'
  'fddd0ada8ab3266042d4f6ddb3dd7a9c652c15ac80eda35097c3914281e14db0'
  '50d885c7f03931323c5ea232c677b8963f8d1a196cfd8f2935e2ddcf535b5971'
  'f7b420dae1361d347858c78d6d48e385bc644e32781cc21eb7dcc483c3682eb1'
  'd843486d7bab95ccf06c6c17ef03773b2dc5b284602b3926356a668c49be565f'
  '105963a2025b4cb96798d1538f38aa65bd13a856cda9941ce25c139959eccd03'
  '442501cffb407e11539fa9fb4714253d779dd0508c0257c42eec187f11a18b13'
  '0a5287b9e24a9adce148daea25c04242ae65f9bb04e3610c8374eaca7379ec20'
  '01b352cd732b36d24fb7b0f2b331ddc34c2a39155af6e7a42bddf2ee279bb25d'
  '5ca2a43d1ed2a0098fbc9f87e7dc89c6a13d0399bcb82f09359fa141f9afb70b'
  'c8e7e72b6652adb34e4f0af20e22d1eda06368db3a6ebab5194d1078944ea31a'
  '7d171ea3884be22fc08bf1a1aee640a3dc93f031989c27f6f9ceb30a6a668de1'
  '2f83aabdf69d1ae28e9b60ef3777e572aafc359f32c8eae7a6278337f1364014'
  'cc2d9a78c88c91875d8fee10d7d5d67ee9f0687ef004fd61bee4e7a1ecef700b'
  '1f4d1c13252f12e9b09e09f881ea21a77645e1eac3472604990b3a11deea78c1'
  '7cad96ae914fecff010fa438276a99daf984044ade8b473049b3b63f771a5603'
  '6ad716ed719e2c97794abd5856a90c6131c406606b249debdc83b04ae11f4cb7'
  'faeb907827a2a07ae64c8fa1a5ca48cd9e60c9084a24c48d779a30cf6bd0693a'
  '9dfad24a7debf0ca56db2465e8bd5a0a28435945c23e2a831bcd111785b57480'
  '51765143936c5c5078249eb77f2dc862f0d9436328c4c698918b276637d5caee'
  'b9bff1032796daffef71610639685d28a4a5baf31cb4ca43dd53f3d14820f5cf'
  '55d7390e8b45fc19a028dd93d42aebf0fe55fd85321940d1be13a5f6fa592e76'
  '556a30d1dcdbf565946605f50657fa77105d95d150413492cfa7065263f56427'
  '5cd679c82f992f4140f2ab4f6cb77b0080f71a3d7152fb8c91fe0c07f4dcce83'
  '6dc50cddca27afa51bd2cce334d6b451d6ce56e6f955c06518ae5b9b1f99e9fc'
  '960a9f36ea58ab07c2955b8cb37b4386626ae19b23d026095ef896a05842dadb'
  '70e91ef90a6d6230f6870a978b856e6138dcff0b98efa9ba3e84c447dda638a2'
  '2c9d0b6db82ef6acf71b235b5bd7b16f33cfbbba5ce08bfb1278f7dc6ec1eb20'
  'fad79b182e2c27454276b45d9633c0800302da996168bc5cee0109fda2181ed3'
  '0f7fb196b3700caeee85ddad56efde174416d73afc651a79d38bd319c1587d43'
  '87834bca780558bbe3ff808e51c89e1c3d98140a2c1a0d3100e10e944456a63c'
  'a2058cfc43eee5a170208c6e90fa77d8f0aa755e0d213e795f70781f7d807942'
  '88b17b50aab7ee284f9a1ed395f96c20ab4d22640fde1fe0f80a31f1eacd6585'
  'f763b82e01f06ebce5830c475306598734d2fc91ded1760fe925a826b3cba8ef'
  '4ff08c04bec3ec86b60d75a987b5c09d7e5c434f006f426bcfdac80f6f66d938'
  'dc8a6aebd8950e59dd89a1c5f49be3914879691e2e1293c157b7f66291c09712'
  'f61229287e333e575f134923fd46da32fe4e01120a2a74a17d2d9b7591a9b87e'
  'fa29af2373bbf6edda1c3c9a42655227748d1a9f7b2563bf4b79253618768318'
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
