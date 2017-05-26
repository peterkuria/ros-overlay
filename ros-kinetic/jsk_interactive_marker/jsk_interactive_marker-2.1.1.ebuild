# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="jsk interactive markers"
HOMEPAGE="http://ros.org/wiki/interactive_marker"
SRC_URI="https://github.com/tork-a/jsk_visualization-release/archive/release/kinetic/jsk_interactive_marker/2.1.1-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/urdf
    ros-kinetic/dynamic_tf_publisher
    ros-kinetic/roscpp
    ros-kinetic/actionlib
    ros-kinetic/roslib
    ros-kinetic/eigen_conversions
    ros-kinetic/jsk_footstep_msgs
    ros-kinetic/visualization_msgs
    ros-kinetic/tf
    ros-kinetic/jsk_recognition_msgs
    ros-kinetic/jsk_topic_tools
    ros-kinetic/interactive_markers
    ros-kinetic/message_filters
    ros-kinetic/moveit_msgs
    ros-kinetic/message_runtime
    ros-kinetic/sensor_msgs
    ros-kinetic/tf_conversions
    ros-kinetic/rviz
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/roseus
    ros-kinetic/jsk_rviz_plugins
    ros-kinetic/geometry_msgs
    dev-cpp/yaml-cpp
    dev-libs/tinyxml
"
DEPEND="${RDEPEND}
    ros-kinetic/cmake_modules
    ros-kinetic/rosbuild
    ros-kinetic/message_generation
    ros-kinetic/mk
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
