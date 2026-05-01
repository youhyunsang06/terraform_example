
# 1. 데이터 정의 (학생 명단)
locals {
    students = ["kim", "lee", "park"]
}

# 2. for_each를 사용하여 파일 생성
resource "local_file" "student_notes" {
  # list를 set으로 변환하여 for_each에 넣어주기
  # for _ each 에 대입할 수 있는것은 set, map type만 가능 (list type 안 됨)
  for_each = toset(local.students)

  # set 를 넣어주면 ${each.key}와 ${eacho.value}가 동인하다
  # map 를 넣어주면 ${each.key}와 ${eacho.value}가 다르다
  filename = "${path.module}/student_${each.key}.txt"
  content = "안녕하세요! ${each.value} 학생의 실습 노트 입니다"
}

output "debug" {
    description = "생성된 파일들의 전체 경로 목록"
    # 여기서 item은 local_file.student _notes map에 저장된 아이템 중 하나다.
    # 여기서 item은 local_file.student _notes map에 저장된 아이템 중 하나다.
    value = [for item in local_file.student_notes : item.filename ]

}