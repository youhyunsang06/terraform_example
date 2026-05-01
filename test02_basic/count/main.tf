

# 블럭을 3번 실행 하라
resource "local_file" "student_notes" {            # 반복문 돌 떄는 배열의 형태가 된다
    count = 3
    # 파일명을 동적으로 부여하기 (count.index로 참조)
    filename = "${path.module}/student_${count.index + 1}.txt" 
    # 파일의 내용도 동적으로 부여하기
    content = "안녕하세요! ${count.index + 1}번 학생의 실습 노트 입니다." # 파일의 내용도 동적으로 부여하기

}

output "debug01" {
    value = local_file.student_notes[0].filename
}

output "debug02" {
    value = local_file.student_notes[1].filename
}

output "debug03" {
    value = local_file.student_notes[2].filename
}

output "debug_all" {
    # 모든 파일의 이름을 배열로 가져오기
    value = local_file.student_notes[*].filename
}
