// +build ignore

#include "common.h"

char __license[] SEC("license") = "Dual MIT/GPL";

SEC("kprobe/execve")
int kprobe_execve(struct pt_regs *ctx) {
    return 0;
}
