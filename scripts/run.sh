image_tag=${1:?'Image tag needs to be param #1'}
im=utkusarioglu/tf-devcontainer:${image_tag}

docker image rm $im
docker pull $im
docker run -it --rm $im
