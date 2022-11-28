

CLANG ?= clang-14
STRIP ?= llvm-strip-14
OBJCOPY ?= llvm-objcopy-14
CFLAGS := -O2 -g -Wall -Werror $(CFLAGS)

REPODIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
CONTAINER_ENGINE ?= $(if $(shell command -v podman), podman, docker)
CONTAINER_RUN_ARGS ?= $(if $(filter ${CONTAINER_ENGINE}, podman), --log-driver=none)
IMAGE = ghcr.io/cilium/ebpf-builder
VERSION = 1666886595


.PHONY: all clean container-all container-shell generate


container-all:
	${CONTAINER_ENGINE} run --rm ${CONTAINER_RUN_ARGS} \
		-v "${REPODIR}":/ebpf -w /ebpf --env MAKEFLAGS \
		--env CFLAGS="-fdebug-prefix-map=/ebpf=." \
		--env HOME="/tmp" \
		"${IMAGE}:${VERSION}" \
		make all

container-shell:
	${CONTAINER_ENGINE} run --rm -ti \
		-v "${REPODIR}":/ebpf -w /ebpf \
		"${IMAGE}:${VERSION}"

format:
	find . -type f -name "*.c" | xargs clang-format -i

all: generate

generate: export BPF_CLANG := $(CLANG)
generate: export BPF_CFLAGS := $(CFLAGS)
generate:
	BPF_CFLAGS='-D__TARGET_ARCH_x86' go generate ./...


