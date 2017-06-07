# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="The bayesian_belief_networks package form https://github.com/eBay/bayesian-belie"
HOMEPAGE="https://github.com/eBay/bayesian-belief-networks"
SRC_URI="https://github.com/tork-a/jsk_3rdparty-release/archive/release/kinetic/bayesian_belief_networks/2.0.20-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="|| ( Apache-1.0 CC-BY-SA-3.0 )"
KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-kinetic/message_runtime
    ros-kinetic/rospy
    ros-kinetic/std_msgs
"
DEPEND="${RDEPEND}
    ros-kinetic/catkin
    ros-kinetic/message_generation
    ros-kinetic/mk
    dev-vcs/git
"

SLOT="0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    append-cxxflags "-std=c++11"
    export DEST_SETUP_DIR="/${ROS_PREFIX}"
    local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=${D}${ROS_PREFIX}
        -DCMAKE_PREFIX_PATH=/${ROS_PREFIX}
        -DPYTHON_EXECUTABLE=/usr/bin/ros-python
        -DCATKIN_BUILD_BINARY_PACKAGE=1
     )
    cmake-utils_src_configure
}

src_install() {
    cd ${WORKDIR}/${P}_build
    make install || die
}
