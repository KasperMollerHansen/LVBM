# Local Voxel-Based Mapping Setup

This guide provides instructions for setting up the Local Voxel-Based Mapping (LVBM) environment.

### Deactivating Virtual Environments
Virtual environments can sometimes cause issues. It's recommended to deactivate any active conda environments before proceeding:

```
conda deactivate
```
<details>
<summary> <b>Docker Workspace Setup</b> </summary>

This guide is based on a slightly modified version from [Isaac ROS NVBlox Setup](https://nvidia-isaac-ros.github.io/repositories_and_packages/isaac_ros_nvblox/isaac_ros_nvblox/index.html#set-up-package-name).

1. **Create a workspace directory**:

```
mkdir -p  ~/workspaces/
```

2. **Clone the LVBM repository**:
```
cd  ~/workspaces && \
git clone https://github.com/KasperMollerHansen/LVBM.git isaac_ros-dev

cd ~/workspaces/isaac_ros-dev/ && \
git submodule update --init --recursive
```

3. **Set the workspace environment variable**:

```
echo "export ISAAC_ROS_WS=${HOME}/workspaces/isaac_ros-dev/" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=<your_domain_id>" >> ~/.bashrc
source ~/.bashrc
```

4. **Setup Docker Environment**:
```
cd ${ISAAC_ROS_WS} && \
./scripts/docker_env_setup.sh
```
</details>

<details>
<summary><b>Using the Docker Workspace</b></summary>


1. **Launching Docker**

To launch the Docker container, run the following commands:

```
cd $ISAAC_ROS_WS/src/isaac_ros_common && \
./scripts/run_dev.sh
```


2. **Build the Workspace in the Docker**

Once the Docker environment is up and running, you can build the workspace:
```
cd $ISAAC_ROS_WS/ && \
./scripts/build_docker_workspace.sh
```
3. **Run Nvblox**
```
cd $ISAAC_ROS_WS/ && \
source install/setup.bash
ros2 launch sim_nvblox 2d_nvblox.launch.py 
```
4. **Test**

It can be nice to test if the error is in nvblox or in the sim_nvblox_script.
```
cd $ISAAC_ROS_WS/ && \
source install/setup.bash
ros2 launch nvblox_examples_bringup isaac_sim_example.launch.py \
rosbag:=${ISAAC_ROS_WS}/isaac_ros_assets/isaac_ros_nvblox/quickstart \
navigation:=False
```
</details>

<details>
<summary> <b>Local Workspace Setup</b> </summary>

1. **Clone the LVBM repository**:
```
cd  ~/workspaces && \
git clone https://github.com/KasperMollerHansen/LVBM.git
cd ~/workspaces/LVBM && \
git submodule update --init --recursive
```

2. **Set the workspace environment variable**:

```
echo "export LOCAL_ROS_WS=${HOME}/workspaces/LVBM/" >> ~/.bashrc
source ~/.bashrc
```
3. **Build the local workspace**
```
cd $LOCAL_ROS_WS/ && \
./scripts/build_local_workspace.sh
```
</details>

<details>
<summary> <b>Using the Local Workspace</b> </summary>

1. **Start simulation**
```
cd $LOCAL_ROS_WS/
source install/setup.bash
./src/pegasus_sim_env/launch_pegasus.sh
```
2. **Launch Planer Node**
```
cd $LOCAL_ROS_WS/
source install/setup.bash
ros2 launch pegasus_sim_env pegasus.launch.py
```

</details>

