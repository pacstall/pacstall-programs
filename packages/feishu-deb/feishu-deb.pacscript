pkgname="feishu-deb"
gives="feishu"
repology=("project: feishu")
pkgver="7.66.11"
pkgrel="1"
pkgdesc="飞书 — 字节跳动出品的一站式企业协作平台，整合即时沟通、日历、音视频会议、云文档、云盘、工作台等功能"
url="https://www.feishu.cn/"
arch=("amd64" "arm64")
license=("custom:proprietary")
maintainer=("Hapenia <hapenia@outlook.com>")

# 运行依赖
depends=("ca-certificates" "gtk3" "nss" "xdg-utils")

# 包关系
provides=("feishu" "bytedance-feishu")
conflicts=("feishu" "bytedance-feishu-stable-bin")
replaces=("bytedance-feishu-stable-bin")

# 不同架构使用不同的 source URL 和哈希
# 注意：URL 中的哈希值随版本变化，更新 pkgver 时需同步更新
_pkghash_x86_64="6e3610b5"
_pkghash_arm64="36c6e858"

source_amd64=("https://sf3-cn.feishucdn.com/obj/ee-appcenter/${_pkghash_x86_64}/Feishu-linux_x64-${pkgver}.deb")
source_arm64=("https://sf3-cn.feishucdn.com/obj/ee-appcenter/${_pkghash_arm64}/Feishu-linux_arm64-${pkgver}.deb")

sha256sums_amd64=("dc4f0d2c2db3cc83bb9758cf71e3e131f09a7e08eec963b378d660c534ccfd31")
sha256sums_arm64=("da73070ae272d9d622a24c11ddd1409084de0601fc2bda6827d82424da78d9a4")

package() {
  # 创建包装启动脚本，支持 ~/.config/feishu-flags.conf 传参
  cat << 'WRAPPER' > "${pkgdir}/usr/bin/feishu"
#!/bin/bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ -f "${XDG_CONFIG_HOME}/feishu-flags.conf" ]]; then
    FEISHU_USER_FLAGS="$(grep -v '^#' "${XDG_CONFIG_HOME}/feishu-flags.conf")"
fi
exec /usr/bin/bytedance-feishu-stable ${FEISHU_USER_FLAGS} "$@"
WRAPPER
  chmod +x "${pkgdir}/usr/bin/feishu"

  # 修正 desktop 文件
  local desktop="${pkgdir}/usr/share/applications/bytedance-feishu.desktop"
  if [[ -f ${desktop} ]]; then
    sed -i "s|bytedance-feishu-stable|feishu|g" "${desktop}"
    sed -i 's|StartupNotify=true|StartupNotify=true\nStartupWMClass=feishu|g' "${desktop}"
    mv "${desktop}" "${pkgdir}/usr/share/applications/feishu.desktop"
  fi

  # 修正菜单文件
  local menu="${pkgdir}/usr/share/menu/bytedance-feishu.menu"
  if [[ -f ${menu} ]]; then
    sed -i "s|bytedance-feishu-stable|feishu|g" "${menu}" 2> /dev/null || true
    sed -i "s|bytedance-feishu|feishu|g" "${menu}" 2> /dev/null || true
    mv "${menu}" "${pkgdir}/usr/share/menu/feishu.menu"
  fi

  # 修正 appdata 文件
  local appdata="${pkgdir}/usr/share/appdata/bytedance-feishu.appdata.xml"
  if [[ -f ${appdata} ]]; then
    sed -i 's|bytedance-feishu|feishu|g' "${appdata}"
    mv "${appdata}" "${pkgdir}/usr/share/appdata/feishu.appdata.xml"
  fi

  # 修正主二进制中的路径引用
  local binary="${pkgdir}/opt/bytedance/feishu/bytedance-feishu-stable"
  if [[ -f ${binary} ]]; then
    sed -i 's|bytedance-feishu-stable|feishu|g' "${binary}"
  fi

  # 重命名 man page
  if [[ -f "${pkgdir}/usr/share/man/man1/bytedance-feishu-stable.1.gz" ]]; then
    mv "${pkgdir}/usr/share/man/man1/bytedance-feishu-stable.1.gz" \
      "${pkgdir}/usr/share/man/man1/feishu.1.gz"
  fi

  # 重命名文档目录
  if [[ -d "${pkgdir}/usr/share/doc/bytedance-feishu-stable" ]]; then
    mv "${pkgdir}/usr/share/doc/bytedance-feishu-stable" \
      "${pkgdir}/usr/share/doc/feishu"
  fi

  # 修复目录权限
  find "${pkgdir}" -type d -exec chmod 755 {} +
}
