#!/bin/bash

# Update package lists to ensure we have the latest information
echo "Updating package lists..."
sudo apt-get update

# List of packages to install
INSTALL_PACKAGES="
    ${ISAAC_ROS_WS}/src/isaac_ros_nvblox/
    ${ISAAC_ROS_WS}/src/px4_msgs/
    ${ISAAC_ROS_WS}/src/sim_px4_ros2
"

# Update rosdep and install dependencies from the workspace, excluding the ignored packages
echo "Updating rosdep and installing dependencies from ${ISAAC_ROS_WS}/src, ignoring specified packages..."
rosdep update
rosdep install -i -r --from-paths ${INSTALL_PACKAGES} --rosdistro humble -y


# Navigate to the isaac_ros-dev workspace
echo "Navigating to /workspaces/isaac_ros-dev..."
cd /workspaces/isaac_ros-dev

# Build the workspace using colcon, ignoring the specified packages
echo "Building the workspace with colcon, ignoring specified packages..."
colcon build --symlink-install --base-paths ${INSTALL_PACKAGES}
#colcon build --symlink-install --base-paths ${ISAAC_ROS_WS}/src/isaac_ros_nvblox/ 

# Source the setup script to overlay the workspace environment
echo "Sourcing the setup.bash to overlay the environment..."
source install/setup.bash

echo "Script completed successfully!"
