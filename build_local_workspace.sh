#!/bin/bash

# Update package lists to ensure we have the latest information
echo "Updating package lists..."
sudo apt-get update

# List of packages to install
INSTALL_PACKAGES="
    sim_px4_ros2
    px4_msgs
"

# Update rosdep and install dependencies from the workspace, excluding the ignored packages
echo "Updating rosdep and installing dependencies from ${LOCAL_ROS_WS}/src..."
rosdep update
rosdep install -i -r --from-paths ${INSTALL_PACKAGES} --rosdistro humble -y

# Navigate to the isaac_ros-dev workspace
echo "Navigating to ${LOCAL_ROS_WS}..."
cd ${LOCAL_ROS_WS}

# Build the workspace using colcon, ignoring the specified packages
echo "Building the workspace with colcon..."
colcon build --symlink-install --packages-select ${INSTALL_PACKAGES} 

echo "Script completed successfully!"
