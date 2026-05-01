
# 지역변수에 리스트 지정
locals {
    students_list = ["kim", "lee", "park"]
}

resource "local_file" "student_notes" {
    # list의 요소 갯수만큼 만들기, length 함수는 list의 size를 알수 있다.
    count = length(local.students_list)     # 대입되는 값은 3

    # count.index를 활용해서 배열의 특정 item 참조해서 활용하기
    filename = "${path.module}/student_${local.students_list[count.index]}.txt"
    content = "안녕하세요 ${local.students_list[count.index]} 학생의 실습노트 입니다."
}

output "debug" {
    value = local_file.student_notes[*].filename
}