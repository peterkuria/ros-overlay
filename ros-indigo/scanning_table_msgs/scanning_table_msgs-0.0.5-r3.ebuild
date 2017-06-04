# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="catkinized common interface for turn table"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/code-iai-release/iai_common_msgs-release/archive/release/indigo/scanning_table_msgs/0.0.5-3.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="GPLv3+"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/actionlib_msgs
    ros-indigo/message_runtime
    ros-indigo/std_msgs
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
    ros-indigo/message_generation
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}