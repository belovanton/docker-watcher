This container connect throw ssh to server add inventory file and make ssh tunel. I use it to pull configuration for composition.
docker run -e "NAME=test" -e "SSH_PORT=***" -e "SSH_HOST=***.***.***.***" -it watcher
