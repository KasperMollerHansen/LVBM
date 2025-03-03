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

Add the following line to your `.bashrc`:

```
echo "export ISAAC_ROS_WS=${HOME}/workspaces/isaac_ros-dev/" >> ~/.bashrc
source ~/.bashrc

```

3. **Clone the LVBM repository**:

Clone the repository into the workspace:
```
git clone https://github.com/KasperMollerHansen/LVBM.git isaac_ros-dev
```

4. **Setup Docker Environment**:

Navigate to the workspace and run the environment setup script:
```
${ISAAC_ROS_WS} && \
./docker_env_setup.sh
```


### Launching Docker

To launch the Docker container, run the following commands:

1. Navigate to the `isaac_ros_common` directory:

```
cd $ISAAC_ROS_WS/src/isaac_ros_common && \
./scripts/run_dev.sh
```


### Build the Workspace

Once the Docker environment is up and running, you can build the workspace:
```
cd $ISAAC_ROS_WS/ && \
./build_workspace.sh
```