#!/bin/bash

# Update package lists to ensure we have the latest information
echo "Updating package lists..."
sudo apt-get update

# List of packages to install
INSTALL_PACKAGES="
    ${ISAAC_ROS_WS}/src/isaac_ros_nvblox/
"

# Update rosdep and install dependencies from the workspace, excluding the ignored packages
echo "Updating rosdep and installing dependencies from ${ISAAC_ROS_WS}/src..."
rosdep update
rosdep install -i -r --from-paths ${INSTALL_PACKAGES} --rosdistro humble -y


# Navigate to the isaac_ros-dev workspace
echo "Navigating to ${ISAAC_ROS_WS}..."
cd ${ISAAC_ROS_WS}

# Build the workspace using colcon, ignoring the specified packages
echo "Building the workspace with colcon, ignoring specified packages..."
colcon build --symlink-install --base-paths ${INSTALL_PACKAGES}

echo "Script completed successfully!"
