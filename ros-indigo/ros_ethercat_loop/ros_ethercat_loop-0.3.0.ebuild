# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Main loop to run EtherCAT robot hardware."
HOMEPAGE="http://www.shadowrobot.com/"
SRC_URI="https://github.com/shadow-robot/ros_ethercat-release/archive/release/indigo/ros_ethercat_loop/0.3.0-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/controller_manager
    ros-indigo/diagnostic_msgs
    ros-indigo/diagnostic_updater
    ros-indigo/ethercat_grant
    ros-indigo/pluginlib
    ros-indigo/realtime_tools
    ros-indigo/ros_ethercat_hardware
    ros-indigo/ros_ethercat_model
    ros-indigo/roscpp
    ros-indigo/std_msgs
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
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