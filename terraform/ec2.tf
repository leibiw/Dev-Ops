resource "aws_instance" "eks_management_instance" {
    ami                 = "ami-0c7217cdde317cfec"
    instance_type       = "t2.micro"
    key_name            = "home1"

    subnet_id                   = module.vpc.public_subnets[0]
    associate_public_ip_address = true
    vpc_security_group_ids      = [aws_security_group.eks_management_sg.id]

    tags = {
        Name            = "EKS manager instance"
        Environment     = "dev"
    }
}

resource "aws_security_group" "eks_management_sg" {
    name                = "eks_management_sg"
    description         = "Security group to allow SSH access to EKS management instance"

    vpc_id              = module.vpc.vpc_id

    ingress {
        description = "Allow SSH Access to my Public IP"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["73.70.24.45/32"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "EKS management instance SG"
        Environment = "dev"
    }
}