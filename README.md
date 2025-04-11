# 🌐 AWS VPC & Peering with Terraform

This Terraform project provisions AWS VPCs and sets up VPC peering between them. It's modular, well-structured, and can be integrated with CI/CD tools like Bitbucket Pipelines or GitHub Actions.

---

## 📁 File Overview

| File               | Description |
|--------------------|-------------|
| `1-VPC.tf`         | Creates the first VPC (source). |
| `2-VPC.tf`         | Creates the second VPC (target). |
| `vpc-peering.tf`   | Configures VPC peering between the two VPCs. |
| `provider.tf`      | Sets the required providers and AWS region. |
| `variable.tf`      | Contains all input variables used across configurations. |

---

## 🧱 Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- AWS credentials configured (`~/.aws/credentials` or environment variables)
- Optional: S3 and DynamoDB if using remote backend

---

## ⚙️ Usage

### 1. Clone the Repository

```bash
git clone https://github.com/prayog22/AWS-VPC-Peering-same-region-.git
```
