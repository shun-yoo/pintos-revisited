# Pintos, revisited

Developed by Hyungsun Yoo ([@shun-yoo](https://github.com/shun-yoo)).

I did the Pintos projects of Sogang University's operating systems course (CSE4070) as an undergraduate, and this repository re-implements them for study. Notes for each project are in Korean.

## Projects

The course numbers the projects differently from the Stanford Pintos manual.

| # | Topic | What is built | Stanford | Built in | Notes |
|---|---|---|---|---|---|
| 0 | Setup | Build Pintos, boot it on QEMU, run `alarm-multiple` | – | `src/threads` | [prj0](prj0/README.md) |
| 1 | User programs (1) | Argument passing on the user stack, the system call handler, `halt` `exit` `exec` `wait`, `read`/`write` on the console, checks on user pointers, two new system calls (`fibonacci`, `max_of_four_int`) | Project 2 | `src/userprog` | [prj1](prj1/README.md) |
| 2 | User programs (2) | File system calls (`create` `remove` `open` `close` `filesize` `read` `write` `seek` `tell`), a file descriptor table per process, denying writes to running executables, locking around the file system | Project 2 | `src/userprog` | [prj2](prj2/README.md) |
| 3 | Threads | Alarm clock without busy waiting, priority scheduling with aging, 4.4BSD scheduler with fixed-point arithmetic | Project 1 | `src/threads` | [prj3](prj3/README.md) |
| 4 | Virtual memory | Supplemental page table, page fault handling, frame table with second-chance eviction, swap, stack growth | Project 3 | `src/vm` | [prj4](prj4/README.md) |
| 5 | File system | Indexed inodes with indirect blocks and file growth, subdirectories (`chdir` `mkdir` `readdir` `isdir` `inumber`), a 64-sector buffer cache | Project 4 | `src/filesys` | [prj5](prj5/README.md) |

## Repository layout

```
src/            Pintos source (kernel, user library, tests, utilities)
  userprog/       user processes and system calls (projects 1, 2)
  threads/        kernel core, scheduler, synchronization (project 3)
  vm/             virtual memory, empty at the start (project 4)
  filesys/        file system (project 5)
  tests/          test programs and grading rubrics
  utils/          the pintos launcher and disk tools
docs/
  manual/         source of the Pintos manual (Texinfo)
tests/          upstream harness that builds every project in a sandbox
prjN/           notes for project N (Korean), on that project's branch
```

## Build and run

Requirements: GCC that can build 32-bit x86 (`-m32`), GNU make, Perl, and QEMU (`qemu-system-i386`).

```bash
export PATH=$PWD/src/utils:$PATH

cd src/threads
make
pintos -v -- -q run alarm-multiple     # boot, run one test, power off
make check                             # run every test of this project
```

Each project is built and tested in its own directory under `src/` (see "Built in" above). Results are written to `build/results`, and `make grade` also writes a score to `build/grade`.

## Starting code

The starting code is the course's version of Pintos: upstream [pintos-anon](https://pintos-os.org) as of June 2020 with these changes:

- QEMU is the default simulator instead of Bochs.
- `multi-recurse` has a 360-second timeout.
- Project 3 tests: `priority-aging`, `priority-lifo` and `priority-change-2` are added, and `priority-aging` runs with the kernel option `-aging`.
- Project 3 setup: the `thread_prior_aging` flag and the `-aging` option (`threads/thread.h`, `threads/thread.c`, `threads/init.c`).

## License

Pintos is distributed under the license in `LICENSE`.
