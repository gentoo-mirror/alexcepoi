# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

GCONF_DEBUG=no

inherit eutils gnome2

DESCRIPTION="Video Thumbnailer that uses mplayer"
HOMEPAGE="http://code.google.com/p/mplayer-video-thumbnailer/"
SRC_URI="http://mplayer-video-thumbnailer.googlecode.com/files/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="media-video/mplayer"

src_unpack() {
	unpack ${A}

	cd ${S}
	epatch ${FILESDIR}/x-flv.patch
}

src_install() {
	addpredict /etc/gconf/gconf.xml.defaults/.testing.writeability
	emake DESTDIR="${D}" install || die "emake install failed"
}
