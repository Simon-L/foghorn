# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020-present Fewtarius

PKG_NAME="foghorn"
PKG_VERSION="0.1.0"
PKG_ARCH="any"
PKG_LICENSE="custom"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET=""
PKG_SHORTDESC="bla bla"
PKG_LONGDESC="bla bla"
PKG_TOOLCHAIN="manual"

JACK2_VERSION="v1.9.22"
CARLA_VERSION="v2.5.4"

JACK2_BUILD_DIR=${BUILD}/jack2-${JACK2_VERSION}/jackroot
CARLA_BUILD_DIR=${BUILD}/carla-${CARLA_VERSION}/carlaroot

pre_build_target() {
	echo ${JACK2_BUILD_DIR}
	ls ${JACK2_BUILD_DIR}
	echo ${CARLA_BUILD_DIR}
	ls ${CARLA_BUILD_DIR}
	mkdir -p ${PKG_BUILD}/foghornroot
	cp -r ${JACK2_BUILD_DIR}/* ${PKG_BUILD}/foghornroot
	cp -r ${CARLA_BUILD_DIR}/* ${PKG_BUILD}/foghornroot
	tar -C ${PKG_BUILD} -cvzf ${PKG_BUILD}/foghornroot.tar.gz foghornroot
}

# make_target() {
#   :
# }
#
# makeinstall_target() {
#   mkdir -p ${INSTALL}/usr/config/modules
#   cp -rf ${PKG_DIR}/sources/* ${INSTALL}/usr/config/modules
#   chmod 0755 ${INSTALL}/usr/config/modules/*
# }
#
# post_makeinstall_target() {
#   case ${ARCH} in
#     x86_64)
#       rm -f ${INSTALL}/usr/config/modules/*32bit*
#       rm -f ${INSTALL}/usr/config/modules/*Master*
#       rm -f ${INSTALL}/usr/config/modules/*351Files*
#     ;;
#     *)
#       rm -f ${INSTALL}/usr/config/modules/Install*
#     ;;
#   esac
# }
