terraform {
  required_providers {
    ansible = {
      source = "iac-registry.idcos.com/idcos/ansible"
      version = "1.0.4"
    }
    alicloud = {
      source = "aliyun/alicloud"
      version = "1.128.0"
   }
  }
}
