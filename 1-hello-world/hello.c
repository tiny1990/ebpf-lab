// +build ignore

#include "bpf_tracing.h"
#include "common.h"

char __license[] SEC("license") = "Dual MIT/GPL";

SEC("kprobe/sys_execve")
int kprobe_sys_execve(struct pt_regs *ctx, const char *__file) {
  int pid = bpf_get_current_pid_tgid() >> 32;
  const char fmt_str[] = "Hello, world, from BPF! My PID is %d\n";
  bpf_trace_printk(fmt_str, sizeof(fmt_str), pid);

  return 0;
}