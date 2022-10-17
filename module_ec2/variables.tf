variable "machine_priv" {  # machine-priv -> machine_priv
  type = map(string)
}

variable "machine_pub" {   # machine-pub -> machine_pub
  type = map(string)
}

variable "bucket_public" {
  type = any
}


variable "iam_profile" {
  type = any
}
