# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Common xacros for ReApp"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/reapp-project/reapp_ros-release/archive/release/indigo/reapp_description/0.1.1-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="LGPL-3"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/xacro
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

