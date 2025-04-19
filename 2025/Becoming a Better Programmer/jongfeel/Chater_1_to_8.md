## 책 내용 정리

1장 코드에 신경 쓰기
2장 정돈된 코드 유지하기
3장 코드 적게 쓰기
4장 코드 줄여 개선하기
5장 코드 베이스의 망령
6장 경로 탐색하기
7장 똥통에서 뒹굴기
8장 오류 무시하지 않기

- https://github.com/jongfeel/BookReview/issues/1214
- https://github.com/jongfeel/BookReview/issues/1217
- https://github.com/jongfeel/BookReview/issues/1220
- https://github.com/jongfeel/BookReview/issues/1223
- https://github.com/jongfeel/BookReview/issues/1224
- https://github.com/jongfeel/BookReview/issues/1226
- https://github.com/jongfeel/BookReview/issues/1227
- https://github.com/jongfeel/BookReview/issues/1228

## 소감

정확한 주제에 대한 설명, 그리고 이해하기 쉬운 내용들이었습니다.
이미 잘 알고 있는 유명한 내용들도 많이 소개해 주고 있어서 잘 이해가 된 것 같습니다.
10년 전에 이 책을 읽었다는 걸 기억하기 힘들 정도로 좋은 내용이 많았습니다.

약간 거슬렸던 건 어감이 좀 센 말투가 그대로 번역이 됐다는 건데 똥 덩어리 코드와 같은 표현입니다.
7장 제목 부터가 똥통에서 뒹굴기인데 아마 코드를 똑바로 작성해야 한다는 경각심을 주기 위한 단어 선택이지 않나 합니다.

가장 인상깊었던 건 프로그래머의 태도였던 것 같습니다.
똥 덩어리 코드를 만드는 것도 프로그래머의 태도이고
좋은 코드를 작성하는 능력도 프로그래머의 태도라고 얘기하는 걸 봤을 때
저는 상당히 공감이 됐습니다.

## 논의 주제

7장에서 소개하는 똥 덩어리 코드를 짜지 않기 위해 각자 의도적으로 하는 방법이 있는지 얘기해 보면 좋겠습니다.
저는 먼저 기능이 실행되는 흐름을 파악해 보고 거기서 어디 까지를 이번 pull request의 범위에 포함할지를 생각합니다.
그리고 간단한 인터페이스 1개 혹은 2개를 뽑아보고 메소드를 정의 후 그 기능만 구현하고 단위 테스트 코드를 추가하는 아주 작은 사이클을 실천합니다.