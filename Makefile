DOCKER_CMD = podman
IMAGE_NAME = testimg
TAG = latest

ifneq ($(strip $(PLATFORM)),)
PLATFORM_ARG=--platform=$(PLATFORM)
else
PLATFORM_ARG=
endif

RUN = $(DOCKER_CMD) run -it --rm -t

all: build test

build:
	$(DOCKER_CMD) build $(PLATFORM_ARG) -f Dockerfile -t $(IMAGE_NAME):$(TAG) .

rebuild:
	$(DOCKER_CMD) build --no-cache $(PLATFORM_ARG) -f Dockerfile -t $(IMAGE_NAME):$(TAG) .

test:
	DOCKER_CMD=$(DOCKER_CMD) ./shell.sh $(IMAGE_NAME):$(TAG) sh -c "sh /test.sh"

shell:
	DOCKER_CMD=$(DOCKER_CMD) ./shell.sh $(IMAGE_NAME):$(TAG)

clean:
	-$(DOCKER_CMD) image rm $(IMAGE_NAME):$(TAG)

vhs:
	vhs < demo.vhs.tape
