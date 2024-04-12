# Cudalab
Cudalab is a tool that allows you to isolate a single CUDA environment using Docker containers on Ubuntu.

## Getting Started
To get started with Cudalab, follow these steps:


### Build the Docker image.
Use the following command to build the Docker image:
```
docker build -t <image_name>:<version> .
```

### Run the container.
Run the Docker container with the following command:
```
docker run --hostname ubuntu --name MyCudaLab \
--restart always \
-p port:22 \
-itd \
--gpus '"device=1,2,3"' \
--memory=256g \
--cpuset-cpus="0-63" \
-v /path/to/data:/root/data
<image_name>:<version>
```
Make sure to replace <image_name> and <version> with your desired image name and version. This command will create and run a Docker container with the specified configurations for your CUDA environment.

Feel free to customize the configurations and paths according to your specific requirements.