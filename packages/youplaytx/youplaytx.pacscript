pkgname="youplaytx"
pkgver="0.4.3"
pkgrel=6
pkgdesc="A full-screen, dual-pane YouTube audio player for the terminal"
url="https://codeberg.org/ProfP303/youplaytx"
license=("GPL-3.0-or-later")
arch=("any")
maintainer=("ProfP303 <prof.p@gmx.net>")

depends=(
    "python3"
    "mpv"
    "python3-mpv"
    "yt-dlp"
    "python3-pyperclip"
    "python3-platformdirs"
    "python3-tomli-w"
    "python3-pip"
    "python3-mdit-py-plugins"
    "python3-linkify-it"
)

makedepends=(
    "python3-build"
    "python3-installer"
    "python3-wheel"
    "python3-setuptools"
    "python3-setuptools-scm"
)

# Debian trixie versions of the following are too old for textual 8.x:
#   python3-textual  2.1.2   (needs >=3.0.0, compact= missing)
#   python3-rich     13.7.1  (needs >=14.2.0)
#   python3-pygments 2.17.2  (needs >=2.19.2)
#   python3-markdown-it-py — not packaged separately
# All four are downloaded here (before bwrap) and installed offline.
_textual_ver="8.2.7"
_rich_ver="15.0.0"
_pygments_ver="2.20.0"
_mditpy_ver="4.2.0"

source=(
    "https://codeberg.org/ProfP303/youplaytx/archive/v${pkgver}.tar.gz"
    "textual-${_textual_ver}-py3-none-any.whl::https://files.pythonhosted.org/packages/a8/f5/c1e18bc0707300a0e90204343abbf7d7acd6fb7ebe03a6d4893b99a234b8/textual-${_textual_ver}-py3-none-any.whl"
    "rich-${_rich_ver}-py3-none-any.whl::https://files.pythonhosted.org/packages/82/3b/64d4899d73f91ba49a8c18a8ff3f0ea8f1c1d75481760df8c68ef5235bf5/rich-${_rich_ver}-py3-none-any.whl"
    "pygments-${_pygments_ver}-py3-none-any.whl::https://files.pythonhosted.org/packages/f4/7e/a72dd26f3b0f4f2bf1dd8923c85f7ceb43172af56d63c7383eb62b332364/pygments-${_pygments_ver}-py3-none-any.whl"
    "markdown_it_py-${_mditpy_ver}-py3-none-any.whl::https://files.pythonhosted.org/packages/b3/81/4da04ced5a082363ecfa159c010d200ecbd959ae410c10c0264a38cac0f5/markdown_it_py-${_mditpy_ver}-py3-none-any.whl"
)
hash=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

build() {
    cd "${srcdir}/${pkgname}"
    python3 -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python3 -m installer --destdir="${pkgdir}" dist/*.whl

    # Debian Python uses dist-packages, not site-packages.
    # pip --prefix installs to site-packages (wrong), so we use --target directly.
    local _pyver
    _pyver="python$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
    local _destlib="${pkgdir}/usr/local/lib/${_pyver}/dist-packages"
    mkdir -p "${_destlib}"

    pip3 install --no-index --no-deps --ignore-installed \
        --target="${_destlib}" \
        "${srcdir}/markdown_it_py-${_mditpy_ver}-py3-none-any.whl" \
        "${srcdir}/pygments-${_pygments_ver}-py3-none-any.whl" \
        "${srcdir}/rich-${_rich_ver}-py3-none-any.whl" \
        "${srcdir}/textual-${_textual_ver}-py3-none-any.whl"
}
