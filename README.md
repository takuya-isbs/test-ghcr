# test-ghcr

## main branch

- `git push origin main`
- PR and merge to main branch
- Generated Docker image tag: latest, main

## Release with vX.Y.Z tag

- GitHub Release
- Git tag: "vX.Y.Z"
- Generated Docker image tag: latest, main, X.Y, X.Y.Z, stable

## Change stable version

- change STABLE_VERSION
