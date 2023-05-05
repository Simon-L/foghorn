# foghorn

This repo is mostly just `cmake-init`, with some initial structural bits for audio on JELOS.

Patch some things:
- `patches/options.patch`: verbose boot for easier diagnosis

Add the packages to your local repo:
`cp -r packages/* <pathtojelosdistribution>/packages`

And build from <pathtojelosdistribution>:
```bash
DEVICE=AMD64 ARCH=x86_64 ./scripts/clean jack2
DEVICE=AMD64 ARCH=x86_64 ./scripts/build jack2
DEVICE=AMD64 ARCH=x86_64 ./scripts/clean carla
DEVICE=AMD64 ARCH=x86_64 ./scripts/build carla
DEVICE=AMD64 ARCH=x86_64 ./scripts/clean foghorn
DEVICE=AMD64 ARCH=x86_64 ./scripts/build foghorn
```

Minimal build needed is `EMULATION_DEVICE=no`, `BASE_ONLY` isn't enough.

## Tinkering JELOS

Qemu stuff
First `gunzip` the .img file
```
qemu-system-x86_64 -bios /usr/share/OVMF/OVMF_CODE.fd \
-m 4G \
-machine type=q35,accel=kvm \
-smp 4 \
-drive format=raw,file=release/JELOS-AMD64.x86_64-20230504.img \
-cpu host \
-usb -device usb-kbd \
-device virtio-vga-gl \
-display sdl,gl=on
```

# Building and installing

See the [BUILDING](BUILDING.md) document.

# Contributing

See the [CONTRIBUTING](CONTRIBUTING.md) document.

# Licensing

GPLv3, only applies to code, not audio sample files
