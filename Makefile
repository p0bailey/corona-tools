#Authored by Phillip Bailey
.PHONY: all 
.SILENT:

docker_tag ?= corona-tools-$(shell git rev-parse --short HEAD)

all: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:  ## build
	docker build -t $(docker_tag) -f Dockerfile .

run:  ## run
	docker run --rm  $(docker_tag)  corona  --xcolor

clean:  ## clean
	docker rmi -f $(docker_tag) || true

		
