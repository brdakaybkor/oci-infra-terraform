# OCI Infrastructure Terraform Modules
A complete Terraform-based IaC framework for provisioning secure, scalable, and production-grade infrastructure on **Oracle Cloud Infrastructure (OCI)**.

---

## 🚀 Features
- VCN with subnets, NAT/Internet gateways  
- Compute instances with SSH access  
- Load Balancer (Public/Private)  
- IAM policies & compartments  
- Block volumes  
- Object Storage for backups  
- DR-ready architectures  

---

## 📁 Project Structure
oci-infra-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│ ├── vcn/
│ ├── compute/
│ ├── loadbalancer/
│ ├── identity/
│ └── database/
└── examples/


---

## ▶️ Deploy
```bash
terraform init
terraform plan
terraform apply

