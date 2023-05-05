# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2022-present Fewtarius

PKG_NAME="jack2"
PKG_VERSION="v1.9.22"
PKG_LICENSE=""
PKG_SITE="https://github.com/jackaudio/jack2"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain waf:host"
PKG_LONGDESC=""
PKG_TOOLCHAIN="manual"

configure_target() {
  cd ${PKG_BUILD}
  ${PKG_BUILD}/waf configure --debug --opus=no --firewire=no --samplerate=no --prefix=${PKG_BUILD}/jackroot ${PKG_WAF_OPTS}
}

make_target() {
  ${PKG_BUILD}/waf build
}

makeinstall_target() {
	${PKG_BUILD}/waf install
}
