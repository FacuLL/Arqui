docker start itba-so
docker exec -it itba-so make clean -C /root/Toolchain
docker exec -it itba-so make clean -C /root/
docker exec -it itba-so make -C /root/Toolchain
docker exec -it itba-so make -C /root/
docker stop itba-so
