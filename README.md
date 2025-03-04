# Local Voxel-Based Mapping Setup

This guide provides instructions for setting up the Local Voxel-Based Mapping (LVBM) environment.

### Deactivating Virtual Environments
Virtual environments can sometimes cause issues. It's recommended to deactivate any active conda environments before proceeding:

```
conda deactivate
```

### Workspace Setup

This guide is based on a slightly modified version from [Isaac ROS NVBlox Setup](https://nvidia-isaac-ros.github.io/repositories_and_packages/isaac_ros_nvblox/isaac_ros_nvblox/index.html#set-up-package-name).

1. **Create a workspace directory**:

```
mkdir -p  ~/workspaces/isaac_ros-dev/
```

2. **Set the workspace environment variable**:

```
echo "export ISAAC_ROS_WS=${HOME}/workspaces/isaac_ros-dev/" >> ~/.bashrc
source ~/.bashrc

```

3. **Clone the LVBM repository**:
```
cd ${ISAAC_ROS_WS} && \
git clone https://github.com/KasperMollerHansen/LVBM.git isaac_ros-dev
git submodule update --init --recursive
```

4. **Setup Docker Environment**:
```
cd ${ISAAC_ROS_WS} && \
./docker_env_setup.sh
```


### Launching Docker

To launch the Docker container, run the following commands:

```
cd $ISAAC_ROS_WS/src/isaac_ros_common && \
./scripts/run_dev.sh
```


### Build the Workspace in the Docker

Once the Docker environment is up and running, you can build the workspace:
```
cd $ISAAC_ROS_WS/ && \
./build_workspace.sh

```
### Source the Workspace in the Docker

Once the workspace is build, the setup.bash cab be sourced
```
cd $ISAAC_ROS_WS/ && \
source install/setup.bash
```

### Test

```
ros2 launch nvblox_examples_bringup isaac_sim_example.launch.py \
rosbag:=${ISAAC_ROS_WS}/isaac_ros_assets/isaac_ros_nvblox/quickstart \
navigation:=False
```