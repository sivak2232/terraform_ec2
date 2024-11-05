resource "aws_instance" "my_ec2_instance" {
 count = 3
  ami           = "ami-06b21ccaeff8cd686"  # Example AMI (Amazon Linux 2)
  instance_type = "t2.micro"               # Instance type (t2.micro is eligible for free tier)

  # Key pair for SSH access (you need to have a key pair created in AWS)
  key_name = "SivaKey"

  tags = {
    Name = "MyEC2Instance-${count.index}"
  }

  # Security group to allow SSH access
  security_groups = ["default"]  # You can create your own security group as well

  # Optional: Create an EBS volume
  root_block_device {
    volume_size = 8 # Size in GB
    volume_type = "gp2"
  }

  # Optional: Enable monitoring
  monitoring = true
}