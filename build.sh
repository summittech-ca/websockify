TAG=$(git describe --tags --always)
docker build -t summittech/websockify -t summittech/websockify:${TAG} .
docker push summittech/websockify
