


resource "alicloud_instance" "instance" {
  count                = var.instance_number
  availability_zone = var.availability_zone
  # alicloud_security_group.default.*.id 安全组id
  security_groups = var.security_group_id
  instance_type        = var.instance_type
  system_disk_category = "cloud_efficiency"
  image_id             = var.image_id
  instance_name        = var.app_name
  vswitch_id = var.vswitch_id
  # 设置带宽大于1， 则自动分配公网IP
  internet_max_bandwidth_out = var.bandwidth_out
  key_name   = var.ssh_key_name
}

resource "ansible_host" "middleware" {
  count                = var.instance_number
  inventory_hostname = var.bandwidth_out >= 1 ? alicloud_instance.instance[count.index].public_ip : alicloud_instance.instance[count.index].private_ip
  groups             = [format("%s",var.app_name)]
  vars = {
      wait_connection_timeout = 600
      public_ip = alicloud_instance.instance[count.index].public_ip
      private_ip = alicloud_instance.instance[count.index].private_ip
    }
}

output "public_ip" {
  value = alicloud_instance.instance.*.public_ip
}

output "private_ip" {
  value = alicloud_instance.instance.*.private_ip
}
