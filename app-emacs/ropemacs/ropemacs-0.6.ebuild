# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=""

inherit distutils eutils elisp-common

DESCRIPTION="Emacs interface for rope"
HOMEPAGE="http://rope.sourceforge.net/"
SRC_URI="mirror://sourceforge/rope/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="nomirror"

DEPEND=">=dev-python/rope-0.7
		>=app-emacs/pymacs-0.22-r1"
RDEPEND="${DEPEND}"
SITEFILE=55${PN}-gentoo.el

src_install() {
	distutils_src_install

	dodir docs
	dodoc docs/*.txt

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}

pkg_postinst() {
	elisp-site-regen
}

pkg_postrm() {
	elisp-site-regen
}
