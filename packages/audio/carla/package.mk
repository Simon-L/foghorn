# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2022-present Fewtarius

PKG_NAME="carla"
PKG_VERSION="v2.5.4"
PKG_LICENSE=""
PKG_SITE="https://github.com/falkTX/Carla"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC=""

pre_build_target() {
  cd ${PKG_BUILD}
	env
	make ${PKG_MAKE_OPTS_TARGET} ${MAKEFLAGS} features
}
# 
# make_target() {
# 	echo "Executing (target): make ${PKG_MAKE_OPTS_TARGET} ${MAKEFLAGS}"
# 	env
#   make ${PKG_MAKE_OPTS_TARGET} ${MAKEFLAGS}
# }

makeinstall_target() {
 	make install PREFIX=/carlaroot DESTDIR=${PKG_BUILD}
}
