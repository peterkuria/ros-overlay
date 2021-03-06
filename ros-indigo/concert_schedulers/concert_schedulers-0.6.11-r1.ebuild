# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Various schedulers for the concert"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/rocon_concert-release/archive/release/indigo/concert_schedulers/0.6.11-1.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/concert_msgs
	ros-indigo/concert_scheduler_requests
	ros-indigo/rocon_app_manager_msgs
	ros-indigo/rocon_console
	ros-indigo/rocon_python_utils
	ros-indigo/rocon_uri
	ros-indigo/rosgraph
	ros-indigo/rospy
	ros-indigo/scheduler_msgs
	ros-indigo/unique_id
	ros-indigo/uuid_msgs
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

