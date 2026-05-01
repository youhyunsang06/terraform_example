
# 변수에 들어 있는 값을 활용해서 조작된 내부 전용 진역변수 만들어서 값 대입하기
locals {
    #변수에 들어 있는 값을 이용해서 새로운 문자열을 만들어서 대입
    resource_name = "${var.project_name}-${var.env}-file"
}

resource "local_file" "example" {
    filename = "${path.module}/${local.resource_name}"
    content = "현재 환경은 ${var.env} 입니다"
}