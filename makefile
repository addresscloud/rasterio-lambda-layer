# Adapted from https://github.com/mapbox/aws-lambda-python-packages/blob/master/Dockerfiles/rasterio

.PHONY: deps

deps:
	$(info Building lambda dependencies with docker...)
	@eval "$(ssh-agent -s)" && \
	DOCKER_BUILDKIT=1 docker build --ssh default=$$SSH_AUTH_SOCK -f dockerfiles/python3.6 --tag lambda:python3.6 . && \
	DOCKER_BUILDKIT=1 docker build --no-cache --ssh default=$$SSH_AUTH_SOCK -f dockerfiles/addresscloud-raster --tag lambda:rasterio .
	docker run --name lambda -itd lambda:rasterio
	docker cp lambda:/tmp/package.zip src/deps/package_rio.zip
	docker stop lambda
	docker rm lambda
