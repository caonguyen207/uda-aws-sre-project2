# Infrastructure

## AWS Zones

| Region              | Availability Zone                   |
|---------------------|-------------------------------------|
| US East (us-east-2) | us-east-2a, us-east-2b, us-east-2c  |
| US West (us-west-1) | us-west-1b, us-west-1c              |


## Servers and Clusters

### Table 1.1 Summary
| Asset | Purpose                                        | Size        | Quantity                    | DR                                          |
|-------|------------------------------------------------|-------------|-----------------------------|---------------------------------------------|
| EC2   | Host the web application                       | t3.micro    | 3 instances                 | Required in DR environment                  |
| RDS   | Save the data                                  | db.t2.small | 2 nodes                     | Primary and secondary instances will be DR  |
| EKS   | Host and deploy Grafana                        | t3.meduim   | 2 clusters, 2 nodes/cluster | Required for both regions                   |
| VPC   | Allow to use virtual network in AWS            | Cross AZ    | 1                           | Required for both regions                   |
| ALB   | Route traffic from outside internet to EKS/EC  | N/A         | 1                           | Required for both regions                   |

### Descriptions
More detailed descriptions of each asset identified above.

- EC2: Amazon EC2 - An virtual machine allow deploy the application.
- AMI: Amazon Machine Image - an image contains all required software need for application.
- Key-pair: Allow connect to EC2 instance directly, region's resources.
- VPC: Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined.
- EKS: Kubernetes service based on AWS cloud, allow run the workload with scalable. One EKS will have one or multiple node groups, each node group can contains one or more EC2 instances as node count.
- ALB: Elastic Load Balancing - automatically distributes your incoming traffic across multiple targets: EC2, EKS...

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

1. Use TF code to make sure that DR regions have the same resources and each one have same attributes with primary region.
2. Make sure that resources are successfully provisioned and application is working fine in DR region.

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

1. Create a cloud load balancer and point DNS to the load balancer, then we just need change DNS IP address during failover.
2. Do failover on the database, the traffic will be routed to DR instances.