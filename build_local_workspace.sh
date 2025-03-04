#!/bin/bash

# Update package lists to ensure we have the latest information
echo "Updating package lists..."
sudo apt-get update

# List of packages to install
INSTALL_PACKAGES="
    ${LOCAL_ROS_WS}/src/sim_px4_ros2/
    ${LOCAL_ROS_WS}/src/px4_msgs/
"

# Navigate to the isaac_ros-dev workspace
echo "Navigating to ${LOCAL_ROS_WS}..."
cd ${LOCAL_ROS_WS}

# Build the workspace using colcon, ignoring the specified packages
echo "Building the workspace with colcon, ignoring specified packages..."
colcon build --symlink-install --base-paths ${INSTALL_PACKAGES}

echo "Script completed successfully!"
