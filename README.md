# ebpf-lab

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
# bpftool btf dump file /sys/kernel/btf/vmlinux > ./headers/vmlinux.h
```

