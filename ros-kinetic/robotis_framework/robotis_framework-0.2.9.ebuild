# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="ROS packages for the robotis_framework \(meta package\)"
HOMEPAGE="http://wiki.ros.org/robotis_framework"
SRC_URI="https://github.com/ROBOTIS-GIT-release/ROBOTIS-Framework-release/archive/release/kinetic/${PN}/0.2.9-0.tar.gz -> ${PN}-kinetic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/robotis_controller
	ros-kinetic/robotis_device
	ros-kinetic/robotis_framework_common
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
