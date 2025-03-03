#!/bin/bash

# Update package lists to ensure we have the latest information
echo "Updating package lists..."
sudo apt-get update

# Update rosdep and install dependencies from the workspace
echo "Updating rosdep and installing dependencies from ${ISAAC_ROS_WS}/src..."
rosdep update && rosdep install -i -r --from-paths ${ISAAC_ROS_WS}/src/ --rosdistro humble -y

# Navigate to the isaac_ros-dev workspace
echo "Navigating to /workspaces/isaac_ros-dev..."
cd /workspaces/isaac_ros-dev

# List of packages to ignore
IGNORE_PACKAGES="isaac_common isaac_common_py isaac_ros_apriltag_interfaces isaac_ros_bi3d_interfaces isaac_ros_common isaac_ros_nitros_bridge_interfaces isaac_ros_nova_interfaces isaac_ros_pointcloud_interfaces isaac_ros_r2b_galileo isaac_ros_rosbag_utils isaac_ros_tensor_list_interfaces isaac_ros_test"

# Build the workspace using colcon, ignoring the specified packages
echo "Building the workspace with colcon, ignoring specified packages..."
colcon build --symlink-install --base-paths ${ISAAC_ROS_WS}/src --packages-ignore $IGNORE_PACKAGES

# Source the setup script to overlay the workspace environment
echo "Sourcing the setup.bash to overlay the environment..."
source install/setup.bash

echo "Script completed successfully!"