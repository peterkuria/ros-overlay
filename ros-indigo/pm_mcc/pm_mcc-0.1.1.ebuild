# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The pm_mcc package  A polygon matcher based on the Multiscale Convexity Conc"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/lama-imr/lama_polygon_matcher-release/archive/release/indigo/pm_mcc/0.1.1-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="CC-BY-SA-3.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/geometry_msgs
	ros-indigo/lama_common
	ros-indigo/polygon_matcher
	ros-indigo/roscpp
	ros-indigo/std_msgs
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

