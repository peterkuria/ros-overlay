# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="rosservice contains the rosservice command-line tool for listing\
	and q[...]"
HOMEPAGE="http://ros.org/wiki/rosservice"
SRC_URI="https://github.com/ros-gbp/ros_comm-release/archive/release/kinetic/${PN}/1.12.13-0.tar.gz -> ${PN}-kinetic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/genpy
	ros-kinetic/rosgraph
	ros-kinetic/roslib
	ros-kinetic/rosmsg
	ros-kinetic/rospy
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
