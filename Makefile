
# Image URL to use all building/pushing image targets
IMG ?= template-container-image:latest

# Run tests
test: build
	cd src; go test -v .

# Build manager binary
build: fmt vet
	cd src; go build -o ../bin/webhook main.go

# Download dependencies
download:
	cd src; go mod download

# Download dependencies
tidy: download
	cd src; go mod tidy

# Run go fmt against code
fmt: tidy
	cd src; go fmt ./...

# Run go vet against code
vet: tidy
	cd src; go vet ./...

# Build the docker image
docker-build:
	docker build . -t ${IMG}

# Push the docker image
docker-push:
	docker push ${IMG}