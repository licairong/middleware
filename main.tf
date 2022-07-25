
provider "alicloud" {
  region = var.region 
}

#ssh 密钥对相关
resource "alicloud_ecs_key_pair" "default" {
  key_pair_name = var.key_name
  public_key    = var.public_key
}

# 安全组相关
resource "alicloud_security_group" "default" {
  name = var.sec_name
  vpc_id = var.vpc_id
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "all"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = var.sec_port
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}

module "middleware" {
    source = "./modules/app"
    # 应用名称
    app_name = "middleware"
    # 应用组集群机器数量
    instance_number = var.instance_number
    # 可用区域
    availability_zone = var.availability_zone
    # 机器类型
    instance_type = var.instance_type
    # 机器镜像id
    image_id = var.image_id
    # 交换机id
    vswitch_id = var.vswitch_id
    # 带宽值，默认1M， 设置1以上自动分配公网ip
    bandwidth_out = var.bandwidth_out
    # ssh链接机器公钥名称
    ssh_key_name = alicloud_ecs_key_pair.default.key_pair_name
    # 安全组id
    security_group_id = [alicloud_security_group.default.id]
}


resource "ansible_group" "all" {
  inventory_group_name = "all"
  vars = {
    wait_connection_timeout = 600
    #ansible_ssh_common_args = "-o ProxyCommand='ssh -o StrictHostKeyChecking=no -i ../ssh_key -W %h:%p -q root@${alicloud_eip.jumpserver.ip_address}'"

    ZOOKEEPER_USER = var.ZOOKEEPER_USER
    ZOOKEEPER_PASSWORD = var.ZOOKEEPER_PASSWORD
    KAFKA_USER = var.KAFKA_USER
    KAFKA_PASSWORD = var.KAFKA_PASSWORD
    REDIS_PASSWORD = var.REDIS_PASSWORD
    MYSQL_USER = var.MYSQL_USER
    MYSQL_PASSWORD = var.MYSQL_PASSWORD
    MYSQL_ROOT_PASSWORD = var.MYSQL_ROOT_PASSWORD
    MYSQL_REPLICATION_USER = var.MYSQL_REPLICATION_USER
    MYSQL_REPLICATION_PASSWORD = var.MYSQL_REPLICATION_PASSWORD
    MINIO_USER = var.MINIO_USER
    MINIO_PASSWORD = var.MINIO_PASSWORD
  }
}

