# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake
DESCRIPTION="Provides a node that reports how long a subset of joints has been
	 settled. "
HOMEPAGE="http://www.ros.org/wiki/joint_states_settler"
SRC_URI="https://github.com/ros-gbp/calibration-release/archive/release/lunar/joint_states_settler/0.10.14-0.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
PYTHON_DEPEND="3::3.5"

RDEPEND="
	ros-lunar/actionlib
	ros-lunar/actionlib_msgs
	ros-lunar/rosconsole
	ros-lunar/roscpp
	ros-lunar/roscpp_serialization
	ros-lunar/settlerlib
	ros-lunar/std_msgs
"
DEPEND="${RDEPEND}
	ros-lunar/catkin
"

SLOT="lunar"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_DISTRO="lunar"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

