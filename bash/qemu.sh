if [[ -x "$(command -v qemu-system-x86_64)" ]]; then
  qimg () {
    qemu-img create -f qcow2 ${1:-mydisk.qcow2} ${2:-15}G
  }

  qiso () {
    qemu-system-x86_64 \
    -cpu host \
    -accel hvf \
    -cdrom "${1:-./my.iso}" \
    -drive file="${2:-mydisk.qcow2}",if=virtio \
    -smp ${3:-6} \
    -m ${4:-8}G \
    -vga virtio \
    -display default,show-cursor=on \
    -usb \
    -device usb-tablet
  }

  # -cpu host,-rtdscp \
  qrun () {
    qemu-system-x86_64 \
    -cpu host \
    -accel hvf \
    -drive file=${1:-mydisk.qcow2},if=virtio \
    -smp ${2:-6} \
    -m ${3:-8}G \
    -vga virtio \
    -display default,show-cursor=on \
    -usb \
    -device usb-tablet \
    -device ich9-intel-hda -device hda-output,audiodev=coreaudio \
    -device virtio-net,netdev=vmnic -netdev user,id=vmnic \
    -audiodev coreaudio,id=coreaudio
  }
fi
