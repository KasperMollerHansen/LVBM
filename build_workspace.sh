#!/bin/bash

# Update package lists to ensure we have the latest information
echo "Updating package lists..."
sudo apt-get update

# List of packages to ignore for rosdep install
IGNORE_ROSDEP_PACKAGES="isaac_common isaac_common_py isaac_ros_apriltag_interfaces isaac_ros_bi3d_interfaces isaac_ros_common isaac_ros_launch_utils isaac_ros_nitros_bridge_interfaces isaac_ros_nova_interfaces isaac_ros_pointcloud_interfaces isaac_ros_r2b_galileo isaac_ros_rosbag_utils isaac_ros_tensor_list_interfaces isaac_ros_test isaac_ros_test_cmake"

# Create a temporary rosdep file excluding the ignored packages
echo "Creating temporary rosdep file to ignore specific packages..."
echo "# Temporary rosdep file to ignore specified packages" > temp_rosdep.yaml
for pkg in $IGNORE_ROSDEP_PACKAGES; do
    echo "- package: $pkg" >> temp_rosdep.yaml
done

# Update rosdep and install dependencies from the workspace, excluding the ignored packages
echo "Updating rosdep and installing dependencies from ${ISAAC_ROS_WS}/src, ignoring specified packages..."
rosdep update
rosdep install -i -r --from-paths ${ISAAC_ROS_WS}/src/ --rosdistro humble --rosdep-keys temp_rosdep.yaml -y

# Clean up the temporary rosdep file
rm temp_rosdep.yaml

# Navigate to the isaac_ros-dev workspace
echo "Navigating to /workspaces/isaac_ros-dev..."
cd /workspaces/isaac_ros-dev

# Build the workspace using colcon, ignoring the specified packages
echo "Building the workspace with colcon, ignoring specified packages..."
colcon build --symlink-install --base-paths ${ISAAC_ROS_WS}/src --packages-ignore $IGNORE_PACKAGES

# Source the setup script to overlay the workspace environment
echo "Sourcing the setup.bash to overlay the environment..."
source install/setup.bash

echo "Script completed successfully!"
