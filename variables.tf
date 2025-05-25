
# Variabili per la configurazione della VM
variable "vm_name" {
  description = "Nome della macchina virtuale"
  type        = string
  default     = "win"
}

variable "template_image_path" {
  description = "Percorso assoluto dell'immagine qcow2 del template sull'host KVM"
  type        = string
  default     = "/var/lib/libvirt/images/windows10-template.qcow2"
}

variable "storage_pool" {
  description = "Storage Pool"
  type        = string
  default     = "default"
}


variable "disk_size_gb" {
  description = "Dimensione del disco per la nuova VM in GB"
  type        = number
  default     = 50
}

variable "vm_memory_mb" {
  description = "Memoria RAM per la VM in MiB"
  type        = number
  default     = 4096 # 2GB
}

variable "vm_vcpu" {
  description = "Numero di vCPU per la VM"
  type        = number
  default     = 2
}

variable "network_name" {
  description = "Nome della rete Libvirt a cui collegare la VM"
  type        = string
  default     = "Deep" # O il nome della tua rete KVM
}

