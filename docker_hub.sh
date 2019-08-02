docker login -u ${DOCKER_ID} -p ${DOCKER_PASSWORD}
docker tag ${IMAGE_LATEST_TAG} ${DOCKER_ID}/gcloud:latest
docker tag ${IMAGE_LATEST_TAG} ${DOCKER_ID}/gcloud:$(cat version)
docker push ${DOCKER_ID}/gcloud:latest
docker push ${DOCKER_ID}/gcloud:$(cat version)
