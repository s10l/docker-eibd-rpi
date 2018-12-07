# docker-eibd-rpi
Run eibd on the RaspberryPI

chown 1000:1000 /dev/ttyAMA0
docker run \
	-rm \
	-d \
	--device=/dev/ttyAMA0 \
	--net=host
	-p 6720:6720 \
	-p 3671:3671/udp \
	--restart unless-stopped \
	docker-eibd-rpi

--rm                        Automatically remove the container when it exits	
--device=/dev/ttyAMA0		Add the UART device from host to the container
--net=host					Connect a container to the host network
-p 6720:6720				Publish the container's port(s) for eibd connection to the host
-p 3671:3671/udp			Publish the container's port(s) for ets connection to the host
--restart unless-stopped	Restart policy to apply when a container exits
eibd-rpi					Name of the image
