variable "id_user" {
  type = object({
    token     = string
    cloud_id  = string
    folder_id = string
  })
}
variable "key_path" {
  type = string
}
