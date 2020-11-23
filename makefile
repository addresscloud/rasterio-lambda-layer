# Adapted from https://github.com/mapbox/aws-lambda-python-packages/blob/master/Dockerfiles/rasterio

.PHONY: deps

deps:
	$(info Building lambda dependencies with docker...)
	@eval "$(ssh-agent -s)" && \
	DOCKER_BUILDKIT=1 docker build --ssh default=$$SSH_AUTH_SOCK -f dockerfiles/python3.8 --tag lambda:python3.8 . && \
	DOCKER_BUILDKIT=1 docker build --no-cache --ssh default=$$SSH_AUTH_SOCK -f dockerfiles/rasterio --tag lambda:rasterio .
	docker run --name lambda-layer -itd lambda:rasterio
	docker cp lambda-layer:/tmp/package.zip build/package_rio.zip
	docker stop lambda-layer
	docker rm lambda-layer
