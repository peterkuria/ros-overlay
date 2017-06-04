# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="swri_image_util"
HOMEPAGE="https://github.com/swri-robotics/marti_common"
SRC_URI="https://github.com/swri-robotics-gbp/marti_common-release/archive/release/indigo/swri_image_util/0.0.14-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/camera_calibration_parsers
    ros-indigo/cmake_modules
    ros-indigo/cv_bridge
    ros-indigo/geometry_msgs
    ros-indigo/image_geometry
    ros-indigo/image_transport
    ros-indigo/message_filters
    ros-indigo/nav_msgs
    ros-indigo/nodelet
    ros-indigo/roscpp
    ros-indigo/roslib
    ros-indigo/rospy
    ros-indigo/std_msgs
    ros-indigo/swri_math_util
    ros-indigo/swri_opencv_util
    ros-indigo/tf
    dev-cpp/eigen
    dev-qt/qtcore
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
    virtual/pkgconfig
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