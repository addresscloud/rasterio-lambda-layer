# rasterio-lambda-layer

[![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> RasterIO Python Module as AWS Lambda Layer

Upload the zip file to an S3 bucket to create a layer (see [Usage](#usage)). You can optionally use the Docker script to build the package from scratch.  Extends [this work](https://blog.mapbox.com/aws-lambda-python-magic-e0f6a407ffc6?gi=b5c72b8b25f6) by Vincent Sarago at Mapbox.

Currently build is for Python 3.6 with RasterIO 1.0.18

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)


## Install

1. Upload `build/package_rio.zip` to an S3 bucket.
2. Create a Lambda layer using this package through the AWS console.

## Usage

Inside your Lambda code:

```python
import sys
sys.path.append('/opt') # Add the /opt path so Python can find the modules

import rasterio
```

## Build

To build your own package (requires docker running on Linux):

```sh
make
```

## Maintainers

[@talltom](https://github.com/talltom)

## Contributing

PRs accepted.

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

BSD-3-Clause © 2019 Addresscloud
