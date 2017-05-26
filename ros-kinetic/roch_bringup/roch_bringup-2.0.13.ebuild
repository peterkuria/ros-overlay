# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="SawYer roch installation and integration package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/SawYerRobotics-release/roch_robot-release/archive/release/kinetic/roch_bringup/2.0.13-2.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/robot_upstart
    ros-kinetic/roch_description
    ros-kinetic/nmea_navsat_driver
    ros-kinetic/robot_localization
    ros-kinetic/roch_sensorpc
    ros-kinetic/rgbd_launch
    ros-kinetic/roch_safety_controller
    ros-kinetic/zeroconf_avahi
    ros-kinetic/roch_base
    ros-kinetic/astra_launch
    ros-kinetic/nmea_comms
    ros-kinetic/tf2_ros
    ros-kinetic/tf
    ros-kinetic/nodelet
    ros-kinetic/roch_control
    ros-kinetic/freenect_launch
    ros-kinetic/diagnostic_aggregator
    ros-kinetic/robot_state_publisher
    ros-kinetic/laser_filters
    ros-kinetic/rocon_app_manager_msgs
    ros-kinetic/imu_transformer
    ros-kinetic/rocon_bubble_icons
    ros-kinetic/imu_filter_madgwick
    ros-kinetic/openni2_launch
    ros-kinetic/rocon_interaction_msgs
    ros-kinetic/depthimage_to_laserscan
    ros-kinetic/rplidar_ros
    ros-kinetic/microstrain_3dmgx2_imu
    ros-kinetic/rocon_app_manager
    ros-kinetic/realsense_camera
    ros-kinetic/rospy
    ros-kinetic/roch_capabilities
    dev-libs/scipy
"
DEPEND="${RDEPEND}
    ros-kinetic/roslaunch
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}"
    rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
    rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
}
