# test-ghcr

## Update main branch

- `git push origin develop`
  - Generated Docker image tag: develop
- Create PR and merge to main branch from develop branch
- Generated Docker image tag: main

## Release with vX.Y.Z tag

- GitHub Release
  - Set git tag: "vX.Y.Z"
- Generated Docker image tag: latest, main, X.Y, X.Y.Z

## Change stable version

- change STABLE_VERSION in .github/workflows/build-push.yml

## Test on local

- Docker:
  - `make`
    - same as `make build test`
- Apple container:
  - `make DOCKER_CMD=container`
- Podman
  - `make DOCKER_CMD=podman`

![demo](./demo.gif)
