# =================================================================
# Licensed Materials - Property of IBM
# 5737-E67
# @ Copyright IBM Corporation 2016, 2017 All Rights Reserved
# US Government Users Restricted Rights - Use, duplication or disclosure
# restricted by GSA ADP Schedule Contract with IBM Corp.
# =================================================================

# This is a terraform generated template generated from apache_tomcat_v8_standalone

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "user_public_ssh_key" {
  type        = "string"
  description = "User defined public SSH key used to connect to the virtual machine, whose format is required to be the openSSH key format with optional comment"
  default     = "None"
}

variable "ibm_pm_public_ssh_key" {
  description = "Public CAMC SSH key value which is used to connect to a guest, used on VMWare only."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
}

##############################################################
# Define the vsphere provider
##############################################################
provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
}

resource "random_id" "stack_id" {
  byte_length = "16"
}

##############################################################
# Define pattern variables
##############################################################
##### unique stack name #####
variable "ibm_stack_name" {
  description = "A unique stack name."
}

#### Default OS Admin User Map ####

##### Environment variables #####
#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type        = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type        = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type        = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type        = "string"
  description = "IBM Software Repo Password"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type        = "string"
  description = "IBM Software Repo Username"
  default     = "repouser"
}

#Variable : tomcat_ui_control_users_administrator_password
variable "tomcat_ui_control_users_administrator_password" {
  type        = "string"
  description = "Password of the admin user to be configured in Tomcat."
}

##### TomcatNode01 variables #####
#Variable : TomcatNode01-image
variable "TomcatNode01-image" {
  type        = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
}

#Variable : TomcatNode01-name
variable "TomcatNode01-name" {
  type        = "string"
  description = "Short Hostname of virtual machine"
}

#Variable : TomcatNode01-os_admin_user
variable "TomcatNode01-os_admin_user" {
  type        = "string"
  description = "Name of admin user account in virtual machine to be SSHed into; Please refer to the documents from OS image vendors to obtain the default admin users"
}

#Variable : TomcatNode01_tomcat_http_port
variable "TomcatNode01_tomcat_http_port" {
  type        = "string"
  description = "The Tomcat port to service HTTP requests."
  default     = "8080"
}

#Variable : TomcatNode01_tomcat_java_java_sdk
variable "TomcatNode01_tomcat_java_java_sdk" {
  type        = "string"
  description = "Specifies the use of a Java Development Kit or Runtime Environment."
  default     = "false"
}

#Variable : TomcatNode01_tomcat_java_version
variable "TomcatNode01_tomcat_java_version" {
  type        = "string"
  description = "The version of Java to be used for Tomcat."
  default     = "1.8.0"
}

#Variable : TomcatNode01_tomcat_ssl_keystore_password
variable "TomcatNode01_tomcat_ssl_keystore_password" {
  type        = "string"
  description = "The keystore password used in Tomcat for SSL configuration."
}

#Variable : TomcatNode01_tomcat_ssl_port
variable "TomcatNode01_tomcat_ssl_port" {
  type        = "string"
  description = "Tomcat port for SSL communication"
  default     = "8443"
}

#Variable : TomcatNode01_tomcat_ui_control_users_administrator_name
variable "TomcatNode01_tomcat_ui_control_users_administrator_name" {
  type        = "string"
  description = "Name of the admin user to be configured in Tomcat."
  default     = "admin"
}

#Variable : TomcatNode01_tomcat_ui_control_users_administrator_status
variable "TomcatNode01_tomcat_ui_control_users_administrator_status" {
  type        = "string"
  description = "Specifies whether to enable the admin user in the Tomcat configuration."
  default     = "enabled"
}

#Variable : TomcatNode01_tomcat_version
variable "TomcatNode01_tomcat_version" {
  type        = "string"
  description = "The version of Tomcat to be installed."
  default     = "8.0.15"
}

#########################################################
##### Resource : TomcatNode01
#########################################################

variable "TomcatNode01-os_password" {
  type        = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "TomcatNode01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "TomcatNode01_datacenter" {
  description = "Target vSphere Datacenter for virtual machine creation"
}

variable "TomcatNode01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default     = "2"
}

variable "TomcatNode01_memory" {
  description = "Memory for virtual machine in MBs, which is required to be one or more times of 1024"
  default     = "2048"
}

variable "TomcatNode01_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
}

variable "TomcatNode01_dns_suffixes" {
  type        = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "TomcatNode01_dns_servers" {
  type        = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "TomcatNode01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "TomcatNode01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "TomcatNode01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "TomcatNode01_ipv4_prefix_length" {
  description = "IPv4 Prefix length for vNIC configuration, which is required to be numbers between 8 and 32"
}

variable "TomcatNode01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "TomcatNode01_root_disk_type" {
  type        = "string"
  description = "Type of template disk volume"
  default     = "eager_zeroed"
}

variable "TomcatNode01_root_disk_controller_type" {
  type        = "string"
  description = "Type of template disk controller"
  default     = "scsi"
}

variable "TomcatNode01_root_disk_keep_on_remove" {
  type        = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
  default     = "false"
}

# vsphere vm
resource "vsphere_virtual_machine" "TomcatNode01" {
  name         = "${var.TomcatNode01-name}"
  folder       = "${var.TomcatNode01_folder}"
  datacenter   = "${var.TomcatNode01_datacenter}"
  vcpu         = "${var.TomcatNode01_number_of_vcpu}"
  memory       = "${var.TomcatNode01_memory}"
  cluster      = "${var.TomcatNode01_cluster}"
  dns_suffixes = "${var.TomcatNode01_dns_suffixes}"
  dns_servers  = "${var.TomcatNode01_dns_servers}"

  network_interface {
    label              = "${var.TomcatNode01_network_interface_label}"
    ipv4_gateway       = "${var.TomcatNode01_ipv4_gateway}"
    ipv4_address       = "${var.TomcatNode01_ipv4_address}"
    ipv4_prefix_length = "${var.TomcatNode01_ipv4_prefix_length}"
  }

  disk {
    type            = "${var.TomcatNode01_root_disk_type}"
    template        = "${var.TomcatNode01-image}"
    datastore       = "${var.TomcatNode01_root_disk_datastore}"
    keep_on_remove  = "${var.TomcatNode01_root_disk_keep_on_remove}"
    controller_type = "${var.TomcatNode01_root_disk_controller_type}"
  }

  # Specify the connection
  connection {
    type     = "ssh"
    user     = "${var.TomcatNode01-os_admin_user}"
    password = "${var.TomcatNode01-os_password}"
  }

  provisioner "file" {
    destination = "TomcatNode01_add_ssh_key.sh"

    content = <<EOF
##############################################################
# Licensed Materials - Property of IBM
#
# For use by authorized subscribers only.
#
# Refer to Service Description and SLA available here:
# http://www-03.ibm.com/software/sla/sladb.nsf/sla/saas
#
# D0021ZX IBM Cloud Automation Library, Enterprise Middleware
# © Copyright IBM Corp. 2017
##############################################################
#!/bin/bash

if (( $# != 3 )); then
echo "usage: arg 1 is user, arg 2 is public key, arg3 is CAMC Public Key"
exit -1
fi

userid="$1"
ssh_key="$2"
camc_ssh_key="$3"

user_home=$(eval echo "~$userid")
user_auth_key_file=$user_home/.ssh/authorized_keys
echo "$user_auth_key_file"
if ! [ -f $user_auth_key_file ]; then
echo "$user_auth_key_file does not exist on this system, creating."
mkdir $user_home/.ssh
chmod 600 $user_home/.ssh
echo "" > $user_home/.ssh/authorized_keys
chmod 600 $user_home/.ssh/authorized_keys
else
echo "user_home : $user_home"
fi

if [[ $ssh_key = 'None' ]]; then
echo "skipping user key add, 'None' specified"
else
echo "$user_auth_key_file"
echo "$ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi
fi

echo "$camc_ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "sudo bash -c 'chmod +x TomcatNode01_add_ssh_key.sh'",
      "sudo bash -c './TomcatNode01_add_ssh_key.sh  \"${var.TomcatNode01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> TomcatNode01_add_ssh_key.log 2>&1'",
    ]
  }
}

#########################################################
##### Resource : TomcatNode01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "TomcatNode01_chef_bootstrap_comp" {
  depends_on      = ["camc_vaultitem.VaultItem", "vsphere_virtual_machine.TomcatNode01"]
  name            = "TomcatNode01_chef_bootstrap_comp"
  camc_endpoint   = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.TomcatNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.TomcatNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.TomcatNode01-name}",
  "node_attributes": {
    "ibm_internal": {
      "stack_id": "${random_id.stack_id.hex}",
      "stack_name": "${var.ibm_stack_name}",
      "vault": {
        "item": "secrets",
        "name": "${random_id.stack_id.hex}"
      }
    }
  }
}
EOT
}

#########################################################
##### Resource : TomcatNode01_tomcat
#########################################################

resource "camc_softwaredeploy" "TomcatNode01_tomcat" {
  depends_on      = ["camc_bootstrap.TomcatNode01_chef_bootstrap_comp"]
  name            = "TomcatNode01_tomcat"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.TomcatNode01-os_admin_user}",
  "stack_id": "${random_id.stack_id.hex}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.TomcatNode01.network_interface.0.ipv4_address}",
  "node_name": "${var.TomcatNode01-name}",
  "runlist": "role[tomcat]",
  "node_attributes": {
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[tomcat]"
    },
    "tomcat": {
      "http": {
        "port": "${var.TomcatNode01_tomcat_http_port}"
      },
      "install_dir": "/opt/tomcat8",
      "instance_dirs": {
        "log_dir": "/var/log/tomcat8",
        "temp_dir": "/var/tmp/tomcat8/temp",
        "webapps_dir": "/var/lib/tomcat8/webapps",
        "work_dir": "/var/tmp/tomcat8/work"
      },
      "java": {
        "java_sdk": "${var.TomcatNode01_tomcat_java_java_sdk}",
        "vendor": "openjdk",
        "version": "${var.TomcatNode01_tomcat_java_version}"
      },
      "os_users": {
        "daemon": {
          "gid": "tomcat",
          "ldap_user": "false",
          "name": "tomcat"
        }
      },
      "ssl": {
        "enabled": "true",
        "port": "${var.TomcatNode01_tomcat_ssl_port}"
      },
      "ui_control": {
        "all_roles": {
          "admin-gui": "enabled",
          "manager-gui": "enabled",
          "manager-jmx": "enabled",
          "manager-script": "enabled",
          "manager-status": "enabled"
        },
        "users": {
          "administrator": {
            "name": "${var.TomcatNode01_tomcat_ui_control_users_administrator_name}",
            "status": "${var.TomcatNode01_tomcat_ui_control_users_administrator_status}",
            "user_roles": {
              "admin-gui": "enabled",
              "manager-gui": "enabled",
              "manager-jmx": "enabled",
              "manager-script": "enabled",
              "manager-status": "enabled"
            }
          }
        }
      },
      "version": "${var.TomcatNode01_tomcat_version}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "tomcat": {
        "ssl": {
          "keystore": {
            "password": "${var.TomcatNode01_tomcat_ssl_keystore_password}"
          }
        },
        "ui_control": {
          "users": {
            "administrator": {
              "password": "${var.tomcat_ui_control_users_administrator_password}"
            }
          }
        }
      }
    },
    "vault": "${random_id.stack_id.hex}"
  }
}
EOT
}

#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint   = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "vault_content": {
    "item": "secrets",
    "values": {},
    "vault": "${random_id.stack_id.hex}"
  }
}
EOT
}

output "TomcatNode01_ip" {
  value = "VM IP Address : ${vsphere_virtual_machine.TomcatNode01.network_interface.0.ipv4_address}"
}

output "TomcatNode01_name" {
  value = "${var.TomcatNode01-name}"
}

output "TomcatNode01_roles" {
  value = "tomcat"
}

output "stack_id" {
  value = "${random_id.stack_id.hex}"
}
