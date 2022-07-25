

variable "availability_zone" {
  description = "可用区域"
}

variable "vswitch_id" {
  description = "vswitch id"
}

variable "app_name" {
  description = "application name" 
}

variable "instance_type" {
  # default = "ecs.s6-c1m2.small"
  description = "创建ecs服务器实例规格"
}

variable "ssh_key_name" {
  # default = "cmp_ssh_key"
  description = "配置的公钥名称"
}

variable "image_id" {
  # default = "centos_7_7_x64_20G_alibase_20200426.vhd"
  description = "ecs 镜像id"
}

variable "security_group_id" {
  type = list
  description = "安全组 id 列表"
  default = []
}

variable "instance_number" {
  default = 1
  description = "创建ecs服务器数据量，默认值为一台"
}

variable "bandwidth_out" {
  description = "机器带宽，大于 0 则分配公网ip"
  default = 0
}
