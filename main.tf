resource "google_container_node_pool" "node_pool" {
  provider           = google-beta
  project            = var.project_id
  name               = var.name
  location           = var.location
  cluster            = var.cluster_name
  initial_node_count = var.initial_node_count
  max_pods_per_node  = var.node_pool_max_pods_per_node

  autoscaling {
    min_node_count = var.node_pool_min_count
    max_node_count = var.node_pool_max_count
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible       = var.preemptible
    service_account   = var.service_account
    machine_type      = var.machine_type
    image_type        = var.image_type
    boot_disk_kms_key = var.boot_disk_kms_key
    disk_size_gb      = var.disk_size_gb

    shielded_instance_config {
      enable_secure_boot          = true
      enable_integrity_monitoring = true
    }
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to node_config, because it usually always changes after
      # resource is created
      node_config,
    ]
  }
}
