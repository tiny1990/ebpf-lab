# ebpf-lab

## two ways
- use github.com/cilium/ebpf
- use origin

## require environments
- Linux kernel version 5.7 or later
- LLVM 11
- libbpf headers by shell
- Linux Header by command


## getting started
### libbpf headers by shell
```shell
# run ./headers/update.sh download libbpf header
```

### Linux Header by command
```shell
# apt install linux-tools-common
# apt install linux-tools-6.5.0-13-generic
# bpftool btf dump file /sys/kernel/btf/vmlinux format c > ./headers/vmlinux.h
```

