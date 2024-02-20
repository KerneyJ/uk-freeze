#!/bin/bash
# qemu-system-x86_64 -s -S -cpu host -enable-kvm -m 128 -nodefaults -no-acpi -display none -nographic -device isa-debug-exit -kernel build/app-helloworld_kvm-x86_64 -append verbose
qemu-system-x86_64 \
	-fsdev local,id=myid,path="rootfs",security_model=none \
        -device virtio-9p-pci,fsdev=myid,mount_tag=fs1,disable-modern=on,disable-legacy=off \
        -kernel workdir/build/python3_qemu-x86_64 \
	-nographic # -s -S \
