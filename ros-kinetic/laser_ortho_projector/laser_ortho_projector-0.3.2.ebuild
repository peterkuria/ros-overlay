# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The laser_ortho_projector package calculates orthogonal projections of LaserScan messages."
HOMEPAGE="http://wiki.ros.org/laser_scan_matcher"
SRC_URI="https://github.com/ros-gbp/scan_tools-release/archive/release/kinetic/laser_ortho_projector/0.3.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/pcl_conversions
    ros-kinetic/roscpp
    ros-kinetic/message_filters
    ros-kinetic/sensor_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/tf
    ros-kinetic/nodelet
    ros-kinetic/pcl_ros
    sci-libs/pcl
"
DEPEND="${RDEPEND}
    sci-libs/pcl
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
