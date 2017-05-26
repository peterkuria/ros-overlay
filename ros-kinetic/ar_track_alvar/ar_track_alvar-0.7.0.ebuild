# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package is a ROS wrapper for Alvar, an open source AR tag tracking library."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/ar_track_alvar-release/archive/release/kinetic/ar_track_alvar/0.7.0-1.tar.gz"

LICENSE="LGPL-2.1"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/pcl_conversions
    ros-kinetic/roscpp
    ros-kinetic/ar_track_alvar_msgs
    ros-kinetic/std_msgs
    ros-kinetic/message_runtime
    ros-kinetic/sensor_msgs
    ros-kinetic/resource_retriever
    ros-kinetic/image_transport
    ros-kinetic/geometry_msgs
    ros-kinetic/visualization_msgs
    ros-kinetic/tf
    ros-kinetic/rospy
    ros-kinetic/tf2
    ros-kinetic/cv_bridge
    ros-kinetic/pcl_ros
    dev-libs/tinyxml
"
DEPEND="${RDEPEND}
    ros-kinetic/cmake_modules
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
