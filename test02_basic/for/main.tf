
# 배열 형태 결과값 [ ]
variable "user_list" {
    type = list(string) #문자열 배열
    default = ["alice", "bob", "david", "scott", "json"]
                # 0       1       2         3      4         index 붙음            
}
output "debug01_user_list" {
    value = [for item in var.user_list : item] # 배열에 저장된 item을 그대로 출력
}

output "debug02_user_list2" {
    value = [for item in var.user_list : upper(item)] # 배열에 저장된 item을 대문자로 변환 출력
}

output "debug03_user_list3" {
    value = [for item in var.user_list : item if length(item) <=4 ] # 배열에 저장된 item의 길이가 4보다 작은 값만 출력
}

# 결과 데이터를 map 형태로 얻기 { }
output "debug04_user_list4"{
    value = { for name in var.user_list : name => "IAM-ISER-${name}"} # { 키 => 값 } 형태로 결과가 나오며, 중괄호 { }를 사용
}

output "debug05_user_list5"{
    # for 인덱스, 값 두개를 인자로 받음
    value = [ for index, item in var.user_list : "${index+1} 번째 사용자 : ${item}"]
}   #               1개만 선언하면 배열에 저장된 아이템, 2개 선언시 첫번째 값은 index, 두번째 값은 저장된 아이템

# 복합 활용
output "debug06_user_list6" {
    # 인덱스를 key값, item을 value 값으로 가지는 map 만들기
    # 인덱스가 문자열로 변환되어서 key값으로 지정된다.
    value = { for index, item in var.user_list : index => item }
}

# 여러줄의 문자열을 편하게 구성하기
output "debug_multiline" {
    # << - 기호를 쓰면 좌측의 공백이 알아서 제거 됨. 
    # EOF 마음대로 정할 수 있다.
    value = <<-EOF
        #!/bin/bash
        dnf update -y
        dnf install -y nginx
        systemctl enable nginx
        systmectl start nginx
    EOF
}

