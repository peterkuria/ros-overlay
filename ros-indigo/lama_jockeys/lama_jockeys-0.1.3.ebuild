# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The lama_jockeys package contains base classes for learning,  localizing, and n"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/lama-imr/lama-release/archive/release/indigo/lama_jockeys/0.1.3-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/actionlib
	ros-indigo/actionlib_msgs
	ros-indigo/lama_interfaces
	ros-indigo/lama_msgs
	ros-indigo/message_runtime
	ros-indigo/roscpp
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
	ros-indigo/message_generation
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

