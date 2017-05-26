# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Shared communication types for the concert framework."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/rocon_msgs-release/archive/release/kinetic/concert_msgs/0.9.0-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/gateway_msgs
    ros-kinetic/message_runtime
    ros-kinetic/std_msgs
    ros-kinetic/rocon_app_manager_msgs
    ros-kinetic/uuid_msgs
    ros-kinetic/rocon_std_msgs
"
DEPEND="${RDEPEND}
    ros-kinetic/message_generation
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
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
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}"
    rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
    rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
}
