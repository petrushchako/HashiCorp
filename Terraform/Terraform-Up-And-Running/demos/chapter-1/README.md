# Chapter 1: Why Terraform

### Overview

|              | **Chef**    | **Puppet**  | **Ansible** | **Pulumi**   | **CloudFormation** | **Heat**     | **Terraform** |
|--------------|-------------|-------------|-------------|--------------|--------------------|--------------|---------------|
| Source       | Open        | Open        | Open        | Open         | Open               | Closed       | Open          |
| Cloud        | All         | All         | All         | All          | AWS                | All          | All           |
| Type         | Config mgmt | Config mgmt | Config mgmt | Provisioning | Provisioning       | Provisioning | Provisioning  |
| Infra        | Mutable     | Mutable     | Mutable     | Immutable    | Immutable          | Immutable    | Immutable     |
| Paradigm     | Procedural  | Declarative | Procedural  | Declerative  | Declerative        | Declerative  | Declerative   |
| Language     | GPL         | DSL         | DSL         | GPL          | DSL                | DSL          | DSL           |
| Master       | Yes         | Yes         | No          | No           | No                 | No           | No            |
| Agent        | Yes         | Yes         | No          | No           | No                 | No           | No            |
| Paid Service | Optional    | Optional    | Optional    | Must-have    | N/A                | N/A          | Optional      |
| Community    | Large       | Large       | Huge        | Small        | Small              | Small        | Huge          |
| Maturity     | High        | High        | Medium      | Low          | Medium             | Low          | Medium        |



### Documentation

| **Tool**       | **Documentation**                                     | **Unit** |
|----------------|-------------------------------------------------------|----------|
| Chef           | [Chef Supermarket](https://bit.ly/2MNXWus)            | Cookbook |
| Pupet          | [Puppet Forge](https://forge.puppet.com)              | Module   |
| Ansible        | [Ansible Galaxy](https://galaxy.ansible.com)          | Role     |
| Pulumi         | [Pulumi Registry](https://pulumi.com/registry)        | Package  |
| CloudFormation | [AWS Quick Starts](https://aws.amazon.com/quickstart) | Template |
| Terraform      | [Terraform Registry](https://registry.terraform.io)   | Module   |