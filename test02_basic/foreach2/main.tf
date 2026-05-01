# 1. 데이터 정의 (학생 명단)
locals {
    students = {
        lee = "이정호"
        kim = "김정호"
        park = "박정호"
    }
}
# 2. for_each를 사용하여 파일 생성
resource "local_file" "student_notes" {
  # for_each 에 map에 대입
  for_each = local.students

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