variable "region" {
  default = "cn-hangzhou"
}

variable "availability_zone" {
  default = "cn-hangzhou-k"
  description = "可用区"
}

variable "vpc_id" {
  description = "vpc id"
  default = "vpc-bp1m4qctfyphka5z96n9d"
}

variable "vswitch_id" {
  description = "vswitch id"
  default = "vsw-bp1kynlp582g1y0eqyaau"
}

variable "public_key" {
  description = "ssh 公钥"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjSh5R1dphAxLKkf2JmTGnh1HVj2xRZ68ll6no349D70xXSabTLB1Y1NTZip5f3U/ur1qiKkw72Gb6/E7eEGis7TFl5klsdeFWmYjfAwvsV1cdmC/IwSXCtpXItO+219E3FZJIde6zm/KC9vP9W4i847+j0GWRyN2LLy8cnWIeuIuwKZKz516fy4LtXJVgASNcoOnuyGMNzqK7sHgE6L67NfBGEvkuA/cHyffolQsPLo/P4MK/OuvWIJV7LFf17yv/J2VY/7VvN7qBg7OmmRfl4qFEZIumi0QD1CD6IS0d9o8L9IdmesB3qwnc3f8NtEAI3mKKVndJzpDVvqZBlyN3 root@CloudCMP-poc-7-44"
}

variable "instance_number" {
  default = 3
  description = "创建ecs服务器数据量，默认值为三台"
}

variable "instance_type" {
  default = "ecs.c6.large"
  description = "ecs 实例规格"
}

variable "image_id" {
  default = "centos_7_7_x64_20G_alibase_20200426.vhd"
  description = "ecs 镜像id"
}

variable "bandwidth_out" {
  description = "机器带宽，大于1默认分配公网ip"
  default = 0
}

variable "bandwidth_out_wan" {
  description = "机器外网默认带宽"
  default = 5
}


variable "sec_name" {
  default = "sg-cmp"
  description = "安全组名称"
}

variable "sec_port" {
  default = "1/65535"
  description = "安全组开放端口"
}

variable "key_name" {
  default = "cmp_ssh_key"
  description = "配置的公钥名称"
}

variable "ZOOKEEPER_USER" {}
variable "ZOOKEEPER_PASSWORD" {}
variable "KAFKA_USER" {}
variable "KAFKA_PASSWORD" {}
variable "REDIS_PASSWORD" {}
variable "MYSQL_USER" {}
variable "MYSQL_PASSWORD" {}
variable "MYSQL_ROOT_PASSWORD" {}
variable "MYSQL_REPLICATION_USER" {}
variable "MYSQL_REPLICATION_PASSWORD" {}
variable "MINIO_USER" {}
variable "MINIO_PASSWORD" {}