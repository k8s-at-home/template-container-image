FROM golang:1.16 AS build

WORKDIR /workspace
ENV GO111MODULE=on

COPY src src

# Build
RUN cd src; go mod download

RUN cd src; CGO_ENABLED=0 go build -o ../bin/app -ldflags '-w -extldflags "-static"' .

#Test
RUN  cd src; CCGO_ENABLED=0 go test -v .

# Use distroless as minimal base image to package the manager binary
# Refer to https://github.com/GoogleContainerTools/distroless for more details
# debug tag adds a shell (not recommended for prod)
FROM gcr.io/distroless/static:nonroot
WORKDIR /
COPY --from=build /workspace/bin/app /app/app
USER nonroot:nonroot

ENTRYPOINT ["/app/app"]

ARG IMAGE_SOURCE
#https://github.com/k8s-at-home/template-container-image
LABEL org.opencontainers.image.source $IMAGE_SOURCE 
