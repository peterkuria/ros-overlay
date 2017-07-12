# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The romeo_bringup package	 contains launch and configuration files required "
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-aldebaran/romeo_robot-release/archive/release/indigo/romeo_bringup/0.1.5-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/naoqi_driver
	ros-indigo/romeo_description
	ros-indigo/romeo_sensors_py
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

