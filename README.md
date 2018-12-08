# docker-eibd-rpi
Run eibd from [BCUSDK](https://www.auto.tuwien.ac.at/~mkoegler/index.php/bcusdk) on the Raspberry Pi. You can find a ready to run image on [s10l/eibd-rpi](https://hub.docker.com/r/s10l/eibd-rpi).

If you want to build BCUSDK by your own, you can use my ready to run image to build the ARM binaries of BCUSDK for your Raspberry on your x64 machine running docker. For more information visit [s10l/docker-eibd-rpi-build on GitHub](https://github.com/s10l/docker-eibd-rpi-build) or use the image [s10l/eibd-rpi-build on Docker Hub](https://hub.docker.com/r/s10l/eibd-rpi-build)

Due to Docker Hub's build architecture is based on AMD64, the Dockerfile injects */etc/passwd*, */etc/shadow*, */etc/group* instead of using the *useradd* command. If you want you can build you own credentials, see *mk-credentials.sh* for details.

## Running
```
chown 1000:1000 /dev/ttyAMA0
docker run \
	-rm \
	-d \
	--device=/dev/ttyAMA0 \
	--net=host \
	-p 6720:6720 \
	-p 3671:3671/udp \
	--restart unless-stopped \
	docker-eibd-rpi
```

### Parameters
| Parameter | Value | Description
--- | --- | ---
-rm | --- | Automatically remove the container when it exits
-\-device | /dev/ttyAMA0 | Add the UART device from host to the container
-\-net | host | Connect a container to the host network
-p | 6720:6720 | Publish the container's port(s) for eibd connection to the host
-p | 3671:3671/udp | Publish the container's port(s) for ets connection to the host
-\-restart | unless-stopped |	Restart policy to apply when a container exits
--- | s10l/eibd-rpi | Name of the image

### Note
The combination of *-p 6720:6720 -p 3671:3671/udp* and *--net=host* is suboptimal, because *-p* is bypassed if *--net=host* is used.

My prefered way is without *--net=host*, but i don't know how to supply multicast network ability in a docker container. If you have some good advices feel free to share.