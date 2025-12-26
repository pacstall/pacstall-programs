# This script mostly builds on the work done by
# Daniel Tufvesson (https://www.danieltufvesson.com/makeresolvedeb)
# and authors of the AUR and Nixpkgs packages.

pkgname='davinci-resolve'
pkgver='19.0.1'
pkgdesc='Professional A/V post-production software suite from Blackmagic Design'
url='https://www.blackmagicdesign.com/support/family/davinci-resolve-and-fusion'
license=('custom:commercial')
repology=("project: ${pkgname}")
external_connection='true'
arch=('amd64')
depends=(
  'dbus'
  'fontconfig'
  'libapr1t64 | libapr1'
  'libaprutil1t64 | libaprutil1'
  'libasound2t64 | libasound2'
  'libbz2-1.0'
  'libc++1'
  'libexpat1'
  'libfreetype6'
  'libglib2.0-0t64 | libglib2.0-0'
  'libglu1-mesa'
  'libglvnd0'
  'libgomp1'
  'libgstreamer-plugins-bad1.0-0'
  'libice6'
  'libnuma1'
  'libsm6'
  'libstdc++6'
  'libsystemd0'
  'libuuid1'
  'libx11-6'
  'libxau6'
  'libxcb-composite0'
  'libxcb-cursor0'
  'libxcb-damage0'
  'libxcb-glx0'
  'libxcb-icccm4'
  'libxcb-image0'
  'libxcb-keysyms1'
  'libxcb-randr0'
  'libxcb-render-util0'
  'libxcb-render0'
  'libxcb-shape0'
  'libxcb-shm0'
  'libxcb-sync1'
  'libxcb-util1'
  'libxcb-xfixes0'
  'libxcb-xinerama0'
  'libxcb-xinput0'
  'libxcb-xkb1'
  'libxcb1'
  'libxcursor1'
  'libxext6'
  'libxfixes3'
  'libxi6'
  'libxinerama1'
  'libxkbcommon-x11-0'
  'libxkbcommon0'
  'libxrandr2'
  'libxrender1'
  'libxtst6'
  'libxxf86vm1'
  'ocl-icd-libopencl1'
  'python3'
  'python3-numpy'
  'udev'
  'xdg-utils'
)

product='DaVinci Resolve'
download_id='98a118a7bac24d2b919878bb5d3ae045'
resolve_sha256='4df35d349db4fdeaacce987c70595e6c43035594274917e6c44b49edfaf0c669'
siteurl='https://www.blackmagicdesign.com/api/register/us/download'
zipfile="${pkgname}-${pkgver}.zip"
source=("${zipfile}::https://github.com/oklopfer/debs/raw/master/empty")
useragent=(
  'User-Agent: Mozilla/5.0 (X11; Linux x86_64)'
  'AppleWebKit/537.36 (KHTML, like Gecko)'
  'Chrome/77.0.3865.75'
  'Safari/537.36'
)
useragent_str="${useragent[*]}"

prepare() {
  local elves f installer magic resolveurl

  installer="DaVinci_Resolve_${pkgver}_Linux.run"
  if [[ -f ${zipfile} && "$(stat --format=%s "${zipfile}")" == 1 ]]; then
    resolveurl=$(get_resolveurl)
    fancy_message info 'Downloading Resolve'
    fetch_resolve

    fancy_message info 'Checking integrity of archive'
    if ! sha256sum -c <<< "${resolve_sha256} ${zipfile}" > /dev/null; then
      fancy_message error 'Integrity check failed'
      return 1
    fi

    fancy_message info 'Unpacking archive'
    unzip "${zipfile}" "${installer}" > /dev/null
    rm "${zipfile}"
  fi

  fancy_message sub 'Extracting installer files'
  chmod +x "${installer}"
  ./"${installer}" --appimage-extract 2> /dev/null
  rm "${installer}"

  cd squashfs-root
  rm -rf CentOSUpdate AppRun* installer*
  tar --no-same-owner -xzf share/panels/dvpanel-framework-linux-x86_64.tgz

  fancy_message sub 'Fixing up file permissions'
  chmod -R u=rwX,go=rX "${srcdir}/squashfs-root"
  find . -type d -exec chmod 0755 '{}' +

  elves=()
  while IFS= read -r -d '' f; do
    read -r -n4 magic < "${f}"
    if [[ ${magic} == $'\177ELF' ]]; then
      elves+=("${f}")
    fi
  done < <(find . -type f -print0)
  chmod 0755 "${elves[@]}"
  chmod -R a=rwX LUT
  mv ./*.so lib/* libs && rmdir lib

  cd share
  sed -i 's|RESOLVE_INSTALL_LOCATION|/opt/resolve|g' ./*.{desktop,directory,menu}
  sed -i 's|^MimeType=.*|MimeType=application/x-resolveproj;application/x-resolvebin;application/x-resolvetimeline;application/x-resolvetemplatebundle;application/x-resolvedbkey|' DaVinciResolve.desktop
  echo >> DaVinciResolve.desktop 'StartupWMClass=resolve'
  echo >> blackmagicraw-player.desktop '
  Icon=/opt/resolve/graphics/blackmagicraw-player_256x256_apps.png'
}

package() {
  local i libs2replace mimedir size

  install -dm0755 "${pkgdir}/opt"
  mv squashfs-root "${pkgdir}/opt/resolve"
  cd "${pkgdir}/opt/resolve"

  libs2replace=(
    libc++.so.1
    libgio-2.0.so.0
    libglib-2.0.so.0
    libgmodule-2.0.so.0
    libgobject-2.0.so.0
    libgstaudio-1.0.so.0
    libgstbase-1.0.so.0
    libgstpbutils-1.0.so.0
    libgstreamer-1.0.so.0
    libgstrtp-1.0.so.0
    libgstsdp-1.0.so.0
    libgsttag-1.0.so.0
    libgstvideo-1.0.so.0
    libgstwebrtc-1.0.so.0
    liborc-0.4.so.0
  )
  for i in "${libs2replace[@]}"; do
    ln -sf "/usr/lib/x86_64-linux-gnu/${i}" libs
  done

  install -dm0777 .license easyDCP Fairlight
  install -dm0777 "${pkgdir}/var/BlackmagicDesign/${product}"

  pushd share > /dev/null
  install -Dm0644 ./*.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm0644 ./*.directory -t "${pkgdir}/usr/share/desktop-directories"
  install -Dm0644 ./*.menu -t "${pkgdir}/etc/xdg/menus"
  install -Dm0644 blackmagicraw.xml resolve.xml \
    -t "${pkgdir}/usr/share/mime/packages"
  install -Dm0644 default-config.dat log-conf.xml -t configs
  install -Dm0644 default_cm_config.bin -t DolbyVision

  popd > /dev/null

  pushd share/etc/udev/rules.d > /dev/null
  cat > 75-davincikb.rules <<- 'EOF'
	SUBSYSTEMS=="usb", ENV{.LOCAL_ifNum}="$attr{bInterfaceNumber}"
	# Editor Keyboard
	SUBSYSTEM=="hidraw", KERNEL=="hidraw*", ATTRS{idVendor}=="1edb", ATTRS{idProduct}=="da0b", ENV{.LOCAL_ifNum}=="04", MODE="0666"
	# Speed Editor Keyboard
	SUBSYSTEM=="hidraw", KERNEL=="hidraw*", ATTRS{idVendor}=="1edb", ATTRS{idProduct}=="da0e", ENV{.LOCAL_ifNum}=="02", MODE="0666"
	EOF
  echo > 75-davincipanel.rules 'SUBSYSTEM=="usb", ATTRS{idVendor}=="1edb", MODE="0666"'
  echo > 75-sdx.rules 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="096e", MODE="0666"'
  install -Dm0644 ./*.rules -t "${pkgdir}/usr/lib/udev/rules.d"
  popd > /dev/null

  cd graphics
  for size in 48 256; do
    for i in application-x-braw-{clip,sidecar}; do
      install -Dm0644 "${i}_${size}x${size}_mimetypes.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/${i}.png"
    done
  done

  mimedir="${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes"
  install -Dm0644 DV_ResolveBin.png "${mimedir}/application-x-resolvebin.png"
  install -Dm0644 DV_ResolveProj.png "${mimedir}/application-x-resolveproj.png"
  install -Dm0644 DV_ResolveTimeline.png "${mimedir}/application-x-resolvetimeline.png"
  install -Dm0644 DV_ServerAccess.png "${mimedir}/application-x-resolvedbkey.png"
  install -Dm0644 DV_TemplateBundle.png "${mimedir}/application-x-resolvetemplatebundle.png"
}

post_install() {
  for d in \
    blackmagicraw-player \
    blackmagicraw-speedtest \
    DaVinciControlPanelsSetup \
    DaVinciResolve \
    DaVinciResolveCaptureLogs \
    DaVinciResolveInstaller; do
    xdg-desktop-menu install --novendor /usr/share/desktop-directories/DaVinciResolve.directory \
      "/usr/share/applications/${d}.desktop"
  done
  xdg-desktop-menu forceupdate
}

get_resolveurl() {
  local curlargs reqjson
  reqjson=$(
    {
      IFS= read -rd ''
      # shellcheck disable=SC2086
      echo ${REPLY}
    } <<- JSON
	{
	  "firstname": "Pacstall",
	  "lastname": "Linux",
	  "email": "pacstall@pm.me",
	  "phone": "202-555-0194",
	  "country": "us",
	  "street": "Bowery 146",
	  "state": "New York",
	  "city": "New York",
	  "product": "${product}"
	}
	JSON
  )

  curlargs=(
    --compressed
    --data-ascii "${reqjson}"
    --fail-early
    -H "${useragent_str}"
    -H 'Accept: application/json, text/plain, */*'
    -H 'Accept-Encoding: gzip, deflate, br'
    -H 'Accept-Language: en-US,en;q=0.9'
    -H 'Authority: www.blackmagicdesign.com'
    -H 'Content-Type: application/json;charset=UTF-8'
    -H 'Cookie: _ga=GA1.2.1849503966.1518103294; _gid=GA1.2.953840595.1518103294'
    -H 'Host: www.blackmagicdesign.com'
    -H 'Origin: https://www.blackmagicdesign.com'
    -H "Referer: https://www.blackmagicdesign.com/support/download/${download_id}/Linux"
    --show-error
    --silent
    "${siteurl}/${download_id}"
  )

  curl "${curlargs[@]}"
}

fetch_resolve() {
  local curlargs=(
    --compressed
    --fail-early
    -H "${useragent_str}"
    -H 'Accept-Language: en-US,en;q=0.9'
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8'
    -H 'Upgrade-Insecure-Requests: 1'
    -o "${zipfile}"
    --progress-bar
    --retry 3
    --retry-delay 3
    --show-error
    "${resolveurl}"
  )

  curl "${curlargs[@]}"
}
