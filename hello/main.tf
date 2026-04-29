
# tf 파일은 HCL 형식의 파일 입니다.
# 테라폼, aws 버전에 관련된 정보를 명시하는 것이 좋다.

terraform {
    required_version = "~>1.14.0"  
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"  
        }
    }
}
# aws provider 설정 
provider "aws" {
    region = "ap-northeast-2"
}

# 간단하게 vpc 하나 생성하기
resource "aws_vpc" "test_vpc" {
    cidr_block = "10.0.1.0/24"
    enable_dns_hostnames = true # dns에 이름을 부여하기 위해 활성화
    enable_dns_support = true  
    tags = {
        Name = "terraform_test_vpc"
    }

}

# 인터넷 게이트웨이
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.test_vpc.id # test_vpc 이름의 vpc가 만들어 지면 그 id를 여기에 사용
    # tags 이름 부여 역할
    tags = {
        Name = "test_vpc_igw" # aws console에 로그인하면 보이는 이름
    }
}
