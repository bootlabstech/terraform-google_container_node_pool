// required variables

variable "project_id" {
  type        = string
  description = "The name of project ID"
}

variable "name" {
  type        = string
  description = "The name of node pool"
}

variable "location" {
  type        = string
  description = <<-EOT
  {
   "type": "api",
   "purpose": "autocomplete",
   "data":"api/gcp/locations",
   "description": "regions used for deployment"
}
EOT
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster to be attached"
}

variable "initial_node_count" {
  type        = number
  description = "the initial_node_count of node pool"
}

variable "node_pool_max_pods_per_node" {
  type        = number
  description = "The maximum number of pods per primary node in this node pool"
  default     = 64
}

variable "node_pool_min_count" {
  type        = number
  description = "this is the min count in the  node pool"
}

variable "node_pool_max_count" {
  type        = number
  description = "this is the max count in the  node pool"
}

variable "preemptible" {
  type        = bool
  description = "if set to true, the secondary node pool will be preemptible nodes"
}

variable "service_account" {
  type        = string
  description = "the id is used as a postfix in service account created for the kubernetes engine"
}

variable "machine_type" {
  type        = string
  description = <<-EOT
  {
   "type": "json",
   "purpose": "autocomplete",
   "data": [
    "f2-micro",
    "e3-micro",
    "e2-small",
    "g1-small",
    "e2-medium",
    "t2d-standard-1"
   ],
   "description": "regions used for deployment"
}
EOT
}

variable "image_type" {
  type        = string
  default     = "cos_containerd"
  description = "the default image type used by NAP once a new node pool is being created"
}

variable "boot_disk_kms_key" {
  type        = string
  description = "the Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool"
}
