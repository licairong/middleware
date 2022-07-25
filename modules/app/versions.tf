terraform {
  required_providers {
    ansible = {
      source = "iac-registry.idcos.com/idcos/ansible"
    }
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.128.0"
   }
  }
}
