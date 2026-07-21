# Linux Fundamentals

This directory contains hands-on Linux exercises completed using Ubuntu WSL as part of my DevOps foundations portfolio.

## Topics Covered

### File System Navigation

- `cd`
- `ls`
- `pwd`
- `mkdir`
- `cp`
- `mv`
- `rm`
- `cat`
- `head`
- `tail`
- `less`

### Permissions and Ownership

- `chmod`
- `chown`
- `ls -l`

Examples:

```bash
chmod +x hello.sh
chmod 644 secret.txt
sudo chown root:root hello.sh
```

### Process Management

- `ps aux`
- `top`
- `htop`
- `jobs`
- `fg`
- `bg`
- `kill`
- `killall`

Examples:

```bash
sleep 100 &
ps aux | grep sleep
kill <PID>
```

### Text Processing

- `grep`
- `wc`
- `awk`
- `sed`
- `sort`
- `uniq`
- Pipes (`|`)

Examples:

```bash
grep "root" /etc/passwd
grep "root" /etc/passwd | wc -l
ps aux | awk '{print $1, $11}'
sed 's/old/new/g' file.txt
cat /etc/passwd | grep "root"
```

## Directory Structure

linux/
├── README.md
├── file-system-notes.md
├── file.txt
└── permissions/
    ├── hello.sh
    └── secret.txt

## Skills Demonstrated

- Linux command-line proficiency
- File and directory management
- File permissions and ownership
- Process monitoring and management
- Text processing and filtering
- Working with system utilities
- Bash scripting fundamentals
- Ubuntu (WSL) administration

## Technologies

- Ubuntu (WSL)
- Bash
- Linux Command Line
- Git
- GitHub

## Objective

This section showcases foundational Linux skills commonly used in DevOps, Site Reliability Engineering (SRE), Platform Engineering, and Cloud Engineering environments.
