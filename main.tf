# Defining VM Volume
resource "libvirt_volume" "vm" {
  name = var.vm_name
  pool = var.storage_pool # List storage pools using virsh pool-list
  source = var.template_image_path
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "vm" {
  name   = var.vm_name
  memory = var.vm_memory_mb
  vcpu   = var.vm_vcpu

cpu {
mode = "host-passthrough"
}

  network_interface {
    network_name = "Deep" # List networks with virsh net-list
  }

  disk {
    volume_id = "${libvirt_volume.vm.id}"
  }


  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "vnc"
    listen_type = "address"
    autoport = true
  }
}

output "VM_Name" {
  value = libvirt_domain.vm.name
}
output "VM_Memory" {
  value = libvirt_domain.vm.memory
}
