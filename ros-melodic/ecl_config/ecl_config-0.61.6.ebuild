# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="These tools inspect and describe your system with macros, types \
	 and [...]"
HOMEPAGE="http://wiki.ros.org/ecl_config"
SRC_URI="https://github.com/yujinrobot-release/ecl_lite-release/archive/release/melodic/${PN}/0.61.6-0.tar.gz -> ${PN}-melodic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-melodic/ecl_build
	ros-melodic/ecl_license
"
DEPEND="${RDEPEND}
	ros-melodic/catkin
"

SLOT="0"
ROS_DISTRO="melodic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
