

# 파일명이 terraform.tfvars가 아니기 때문에 terrafor을 실행할 때 default 로 읽어들이지 않는다.
# prod는 production 의 의미 -> 실제 배포용
# plan이나 apply 할 때 =var-file="prod.tfvars" 옵션을 주어서 실행해야 한다.

env             = "prod"
project_name    = "ktcloud-v1"
