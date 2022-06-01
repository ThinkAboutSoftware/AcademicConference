## Chapter 7 While You Are Coding

## Overview

코딩하면서 일어나는 일들, 그러니까 피부로 느낄 수 있는 것들에 대해 많은 것들을 얘기했던 챕터가 아닌가 싶습니다.

직감, 잘 모르고 코딩하지 않기, 알고리즘에 대한 이야기, 리팩토링, 테스트 코드, TDD, 보안, 이름 짓기 등

연관성이 없어 보이면서도 topic 별로 중요한 얘기들을 한게 아닌가 싶습니다.

## Discussions

저는 여기서 인상 깊었던 것은 우연에 맡기는 프로그래밍 부분이었습니다. 테스트 코드, 리팩토링, 이름 짓기는 다른 책이나 블로그 등에도 언급되는 뭐 중요한 내용이기는 하지만 저는 코드에 의도를 읽을 수 있어야 한다고 믿는 주의이기 때문에 우연에 맡기는 프로그램이이 조금은 흥미로웠습니다.

**혹시 시간이 없다는 핑계로 혹은 그냥 잘 돌아가니까 코드에 대한 이해 그 코드가 하려는 의도 사용한 라이브러리 패키지 혹은 디자인 패턴 등에 대해 그냥 모르고 지나쳤다가 나중에 설명하려고 했을떄 당황하셨던 경험이 있으면 얘기해 봤으면 합니다.**

저는 학부 때도 그렇고 막 실무에서 일할 때도 그랬지만, 제가 모르는 코드 줏어다 놓고 그냥 두지는 않았던 것 같습니다. 왜 이런 코드를 쓰고 싶어 했는지 naming은 왜 이런지, 내가 익숙하지 않은 코드 로직은 왜 이렇게 만들었는지 끊임 없이 찾아보고 이해하려고 했었던 것 같습니다.

### Topic 37 Listen to Your Lizard Brain

프로그래머로서 경험이 늘어 갈수록 뇌에는 암묵적인 지식이 켜켜이 쌓인다. 잘 되는 방법, 잘 안되는 방법, 오류 형태별로 가능한 원인 등 일하는 동안 보고 듣고 느끼는 모든 것이 쌓인다.

어디에서 왔는지에 상관없이 모든 본능에는 공통점이 있다. 바로 말로 표현할 수 없다는 것, 생각이 아니라 느낌이라는 점이다.

#### FEAR OF THE BLANK PAGE

안해본 것을 시도할 때 느끼는 것

- 여러 경험을 해 보면서 안되는 걸 본능적으로 알기 때문, 시간이 주어지면 구체화하면서 문제를 해결할 수 있음
- 실수에 대한 두려움, 코드의 오류가 능력 부족으로 인한 것이라고 믿기 때문

#### FIGHTING YOURSELF

코딩이 진창에서 오르막길을 걷는 것처럼 느껴지는 날도 있다.
어쩌면 구조나 설계가 틀렸을 수도 있고, 엉뚱한 문제를 붙들고 있을 수도 있다. 아니면 버그가 우글거리는 개미굴을 만들고 있는지도 모른다. 이유가 무엇이든 코드가 보내는 피드백을 파충류의 뇌가 느끼고 있다.

#### HOW TO TALK LIZARD

> Tip 61. Listen to Your Inner Lizard

- 일단 하고 있는 일을 멈추고 주의를 환기시킨다, 언젠가 다시 의식의 영역으로 올라올 때 '아하' 하는 순간이 온다
- 문제를 누군가 에게 설명하는 과정에서 '아 맞다' 라는 순간이 온다

#### IT’S PLAYTIME!

프로토타이핑을 하면서 생각을 구체화 한다. 그리고 하고 싶은 것을 문장으로 표현하고 그것을 코팅한다. 어느 순간 코딩을 즐기고 있다는 순간이 오면 프로토타입을 그만두고 원래 해야 하는 일을 한다.

#### NOT JUST YOUR CODE

사람들은 저마다 다른 본능을 가지고 있으므로 다른 결정들을 내렸을 것이다. 꼭 더 나쁜 것은 아니고 그저 다를 뿐이다.

처리 방식이 이상해 보이는 부분이 눈에 띄면 적어 놓아라. 계속 작업하면서 패턴을 찾아보라. 만약 그런 식으로 코드를 작성해야만 했던 원인을 찾아낼 수 있다면 코드를 이해하는 일이 훨씬더 쉬워질지도 모른다.

```
의견)
다른 사람의 코드가 잘못됐다고 판단하는건 객관적이지 않으므로 조심스럽게 접근해야 한다.
하지만 명백히 틀린 것이고 심지어 버그가 있다면 고쳐주는게 맞다고 생각한다
```

#### NOT JUST CODE

가끔은 설계가 왠지 이상하게 느껴질 수도 있고, 어떤 요구 사항이 마음을 불편하게 할 수도 있다. 하던 일을 멈추고 그 느낌을 분석하라.

#### CHALLENGES

Is there something you know you should do, but have put off because it feels a little scary, or difficult? Apply the techniques in
this section. Time box it to an hour, maybe two, and promise yourself that when the bell rings you’ll delete what you did. What
did you learn?

```
답변)
우연히도 지금 하고 있는 일이 도전적인 일이다.
평소에 클라우드 서비스에 대해서 대략 알고만 있는 정도고 실제 해 본 적은 없는데
아주 간단한거 예를 들면 document형 DB를 연결하고 쿼리 만든는 것 조차
조심스럽고 하다가 이상하다 싶어서 보면 기존에 내가 알고 있는 방법과 다른 방법으로 하는 경우가 많다
하지만 즐거운 점은 잘 모르는 분야에 대한 프로그래밍 기술에 대해 알아가고 있다는 잠이고
그것을 또 배운다면 다른 사람과 얘기하거나 공유해 줄 때 많은 도움이 될 것이다
```

### Topic 38 Programming by Coincidence

우리는 우연에 맡기는 프로그래밍, 곧 행운과 우연한 성공에 의존하는 프로그래밍을 하지 않아야 한다. 대신 ‘의도적으로 프로그래밍’해야 한다.

#### HOW TO PROGRAM BY COINCIDENCE

왜 코드가 망가졌는지 모르는 까닭은 애초에 코드가 왜 잘 돌아 가는지도 몰랐기 때문이다. 제한적으로 '테스트'를 했을 때는 코드가 잘 돌아가는 것처럼 보였지만, 그것은 단지 그때 운이 좋았을 뿐이다.

##### Accidents of Implementation

우연에 기대다 보면 결국 문서화되지 않은 에러나 예외적인 경우의 동작에 의존하게 되고 만다.

다른 사람이 호출할 코드를 작성하고 있다면 모듈화를 잘하는 것, 그리고 잘 문서화한 적은 수의 인터페이스 아래에 구현을 숨기는 것 같은 기본 원칙들이 모두 도움이 된다.

##### Close Enough Isn’t

프로젝트에서 UTC를 사용하지 않고 현지 시간에 맞춰서 시간 계산을 하는 코드
우연히 잘 돌지만 결국 +1 -1과 같이 계산하는 코드가 많다면 문제가 된다

##### Phantom Patterns

테스트는 통과했던 것 같은데 서버에서는 통과하지 못하는 이유는 두 환경의 차이 때문일 수도 있지만 어쩌면 그저 우연일 수도 있다.
가정하지 말라. 증명하라.

##### Accidents of Context

잘 되는 듯한 답을 찾는 것과 올바른 답을 찾는 것은 다르다.

> Tip 62. Don’t Program by Coincidence

##### Implicit Assumptions

확고한 사실에 근거하지 않은 가정은 어떤 프로젝트에서든 재앙의 근원이 된다.

#### HOW TO PROGRAM DELIBERATELY

- 언제나 지금 무엇을 하고 있는지 알아야 한다.
- 더 경험이 적은 프로그래머에게 코드를 상세히 설명할 수 있는가?
- 자신도 잘 모르는 코드를 만들지 말라.
- 계획을 세우고 그것을 바탕으로 진행하라.
  - 의견) 내가 좋아하는 말이기도 하고 내 삶의 근본 자세이기도 하다
- 신뢰할 수 있는 것에만 기대라. 가정에 의존하지 말라.
- 가정을 기록으로 남겨라.
- 코드뿐 아니라 가정도 테스트해 보아야 한다. 어떤 일이든 추측만 하지 말고 실제로 시험해 보라.
- 노력을 기울일 대상의 우선순위를 정하라. 중요한 것에 먼저 시간을 투자 하라.
- 과거의 노예가 되지 말라. 기존 코드가 앞으로 짤 코드를 지배하도록 놓아 두지 말라.

#### EXERCISES

##### Exercise 25

A data feed from a vendor gives you an array of tuples representing key-value pairs. The key of DepositAccount will hold a
string of the account number in the corresponding value:

```
[
...
{:DepositAccount, "564-904-143-00"}
...
]
```

It worked perfectly in test on the 4-core developer laptops and on the 12-core build machine, but on the production servers
running in containers, you keep getting the wrong account numbers. What’s going on?

,,,
답변) 실제 컨테이너에서는 string을 인코딩 하는 방식이 달라서 생기는 문제일 수 있다 그러면 숫자 사이의 마이너스(-)가 다르게 표시된다
,,,

##### Exercise 26

You’re coding an autodialer for voice alerts, and have to manage a database of contact information. The ITU specifies that phone numbers should be no longer than 15 digits, so you store the contact’s phone number in a numeric field guaranteed to hold at least 15 digits. You’ve tested in thoroughly throughout North America and everything seems fine, but suddenly you’re getting a rash of complaints from other parts of the world. Why?

,,,
답변)
문제에 답이 있다. 북아메리카는 15자리 번호를 쓰지만 나머지 다른 지역도 15자리를 쓰지 않기 때문이다.
,,,

##### Exercise 27

You have written an app that scales up common recipes for a cruise ship dining room that seats 5,000. But you’re getting
complaints that the conversions aren’t precise. You check, and the code uses the conversion formula of 16 cups to a gallon.

,,,
답변)
크루즈선에서 쓰는 단위가 갤럽이 아닐 가능성이 높다. 5000명이나 되는 크루즈선이면 국제선일 것이고 갤런 단위가 아닌 국제 표준 단위인 리터법을 쓸 가능성이 높다.
,,,

That’s right, isn’t it?

### Topic 39 Algorithm Speed

프로그램이 레코드 천 개를 처리하는 데 시간이 얼마나 걸리는지 알고 있다고 해 보자. 그렇다면 백만 개라면 어떨까? 코드의 어떤 부분을 최적화해야 할까?
보통 이런 질문에 답을 할 때는 상식과 약간의 분석, 그리고 '대문자 O 표기법 Big-O notation'이라고 부르는 근삿값을 기록하는 방식을 이용하면 된다.

#### WHAT DO WE MEAN BY ESTIMATING ALGORITHMS?

반복문이나 재귀 호출을 담고 있는 코드를 작성할 때면 언제나 무의식적으로 수행 시간과 필요한 메모리 양을 계산한다. 종종 상세한 분석을 필요로 한다면 big-o 표기법을 사용한다.

#### BIG-O NOTATION

- O(1) 상수. (배열의 원소 접근, 단순 명령문)
- O(lg n) 로그. (이진 검색) 로그의 밑은 중요치 않다. 따라서 O(log n)과 동일하다.
- O(n) 선형. (순차 검색)
- O(n lg n) 선형보다는 좋지 않지만, 그래도 그렇게 많이 나쁘지는 않음. (퀵 정렬 quicksort 와 힙 정렬 heapsort 의 평균 수행 시간)
- O(n 2 ) 제곱. (선택 정렬과 삽입 정렬)
- O(n 3 ) 세제곱. (두 n × n행렬의 곱)
- O(C n ) 지수. (여행하는 외판원 문제, 집합 분할 문제)

#### COMMON SENSE ESTIMATION

- 단순 반복문
  - 만약 단순 반복문 하나가 1부터 n까지 돌아간다면 이 알고리즘은 O(n)일 가능성이 크다.
- 중첩 반복문
  - 반복문 안에 또 반복문이 들어 있다면, 알고리즘은 O(m × n)이 되며, 여기서 m과 n은 두 반복문의 반복 횟수다. 이런 정렬 알고리즘은 O(n 2 )이 되기 쉽다.
- 반씩 자르기
  - 반복문을 돌 때마다 작업 대상의 수를 반으로 줄여 나가는 알고리즘이라면 로그적 알고리즘, 즉 O(lg n)이 될 가능성이 크다.
- 분할 정복 divide and conquer
  - 입력 데이터를 둘로 나눠서 각각 독립적으로 작업한 다음, 결과를 합치는 알고리즘은 O(n lg n)일 수 있다.
- 조합적 combinatoric
  - 알고리즘이 항목의 순열(permutation) 을 다루기 시작하면 대부분의 경우 수행 시간은 걷잡을 수 없이 늘어난다.

#### ALGORITHM SPEED IN PRACTICE

만약 들어올 수 있는 최댓값이 정해져 있다면 그 코드를 실행하는 데 시간이 얼마나 걸릴지 알 수 있다. 숫자가 외부 요인에 따라 달라진다면(어젯밤 일괄 작업에서 처리된 레코드의 수나, 명단에 있는 이름 개수 등) 잠시 작업을 멈추고 커다란 수가 들어왔을 경우 수행 시간이나 메모리 소모에 어떤 영향을 미칠지 생각해 보는 것이 좋다.

> Tip 63. Estimate the Order of Your Algorithms

O(n2) 알고리즘이 있다면 분할 정복을 사용하여 O(n lg n)으로 줄일 수 없는지 시도해 보라.
이론적 요인과 실무적 요인을 모두 고려하려고 노력하라. 추정을 이미 했다고 하더라도 실제 서비스에서 실제 데이터로 돌아가는 코드의 수행 시간만이 정말로 의미 있는 수치다. 이 사실에서 우리의 다음 팁이 나온다.

> Tip 64. Test Your Estimates

정확하게 시간을 재는 일이 어렵다면 '코드 프로파일러 code profiler'를 사용하여 알고리즘이 돌아갈 때 각 단계의 실행 횟수를 센 다음 입력값 크기별 실행 횟수를 그래프로 그려 보라.

##### Best Isn’t Always Best

적당한 알고리즘을 선택할 때도 실용적이어야 할 필요가 있다. 가장 빠른 알고리즘이 언제나 가장 좋은 알고리즘은 아니다.
그리고 '성급한 최적화 premature optimization'를 조심하라. 언제나 어떤 알고리즘을 개선하느라 귀중한 시간을 투자하기 전에 그 알고리즘이 정말로 병목인지 먼저 확인하는 것이 좋다.

#### CHALLENGES

- Every developer should have a feel for how algorithms are designed and analyzed. Robert Sedgewick has written a series of accessible books on the subject (Algorithms [SW11], An Introduction to the Analysis of Algorithms [SF13] and others). We recommend adding one of his books to your collection, and making a point of reading it.

```
답변)
<Algorithms>은 장바구니에 넣어 뒀다. 길벗에서 ebook 으로도 출간했다
http://aladin.kr/p/N4LEF
<An Introduction to the Analysis of Algorithms>는 원서로만 있다 아마 안볼 듯
```

- For those who like more detail than Sedgewick provides, read Donald Knuth’s definitive Art of Computer Programming books,
which analyze a wide range of algorithms. 
  - The Art of Computer Programming, Volume 1: Fundamental Algorithms [Knu98]
  - The Art of Computer Programming, Volume 2: Seminumerical Algorithms [Knu98a]
  - The Art of Computer Programming, Volume 3: Sorting and Searching [Knu98b]
  - The Art of Computer Programming, Volume 4A: Combinatorial Algorithms, Part 1 [Knu11].

```
Volume 2, 4A만 구할 수 있고 1, 3은 절판 됐다.
그런데 읽을 수 있을지는 모르겠다.
```

- In the first exercise that follows we look at sorting arrays of long integers. What is the impact if the keys are more complex, and the overhead of key comparison is high? Does the key structure affect the efficiency of the sort algorithms, or is the fastest sort always fastest?

```
답변)
아마 해시 테이블 충돌 정도를 체크하는 것일것 같은데, 그 이상은 잘 모르겠다.
```

#### EXERCISES

##### Exercise 28

We coded a set of simple sort routines in Rust. Run them on various machines available to you. Do your figures follow the
expected curves? What can you deduce about the relative speeds of your machines? What are the effects of various compiler
optimization settings?

```
답변)
rust로 구현한 sort 프로그램 링크, 책에 있는 주소이다.
https://media.pragprog.com/titles/tpp20/code/algorithm_speed/sort/src/main.rs

rust로 설치하고 실행해 봤으나 실행이 되지 않는다.
extern create rand;
라인에서 부터 막히는데, 아마 rust도 package 관리를 해야 하는 것 같아 보인다.
더 귀찮아서 진행은 안해봤다.
```

##### Exercise 29

In Common Sense Estimation, we claimed that a binary chop is. Can you prove this?

```
답변)
증명은 못하고, 흔히 하는 게임의 예시가 하나 있다.
1~100 사이의 숫자 중에 하나를 고르고 up/down을 해 보면 7번 안에 고른 숫자를 100% 맞출 수 있는데 
밑이 2인 log 100이 대략 6.643의 수가 나오기 때문이다.
```

##### Exercise 30

In Figure 3, Runtimes of various algorithms, we claimed that is the same as (or indeed logarithms to any base). Can you explain why?

```
답변)
사실 n이 무한하다고 가정하고 big-O를 추정하는 것이므로 밑의 숫자가 어떻든 log 형태로 커지는 건 변함이 없기 때문이다
```

### Topic 40 Refactoring

프로그램이 발전함에 따라 점점 초기에 내린 결정을 다시 고려하고 코드의 일부분을 다시 작성할 일이 생긴다. 이것은 지극히 자연스러운 과정이다. 코드는 정적인 존재가 아니다. 코드는 발전해야 한다.

소프트웨어 개발은 건축보다 정원 가꾸기에 더 가깝다. 딱딱하기보다는 유기적인 활동이다.

코드 고쳐쓰기, 다시 작업하기, 다시 아키텍처 만들기는 모두 아울러서 '재구성(restructuring)'이라고 부른다. 그런데 그런 활동 중 일부를 따로 떼어 '리팩터링(refactoring)'이라는 이름으로 실천하기도 한다.

마틴 파울러의 리팩터링 에서는 다음과 같이 정의한다

> 밖으로 드러나는 동작은 그대로 유지한 채 내부 구조를 변경함으로써 이미 존재하는 코드를 재구성하는 체계적 기법.

이 정의에서 핵심적인 부분은 다음 두 가지다.

1. 이 활동은 체계적이다. 아무렇게나 하는 것이 아니다.
2. 밖으로 드러나는 동작은 바뀌지 않는다. 기능을 추가하는 작업이 아니다.

밖으로 드러나는 동작이 바뀌지 않는다는 것을 보장하려면 코드의 동작을 검증하는 좋은 자동화된 단위 테스트가 필요하다.

#### WHEN SHOULD YOU REFACTOR?

리팩터링은 무언가를 알게 되었을 때 한다. 작년이나 어제, 심지어 10분 전과 비교해서 더 많이 알게 되었다면, 리팩터링을 한다.

무엇이든 ‘잘못’되었다는 생각이 들 때 **주저하지 말고 변경하라.** 언제나 바로 지금이 최적기다. 코드를 리팩터링할 이유는 아주 많다.

- 중복
  - DRY 원칙 위반을 발견했다.
- 직교적이지 않은 설계
  - 더 직교적으로 바꿀 수 있는 무언가를 발견했다.
- 더 이상 유효하지 않은 지식
  - 사물은 변하고, 요구 사항은 변경되며, 지금 처리하고 있는 문제에 대한 지식은 점점 늘어난다. 코드는 지금 상황에 뒤떨어지지 않아야 한다.
- 사용 사례
  - 진짜 사람들이 실제 상황에서 시스템을 사용하게 되면,어떤 기능은 예전에 생각했던 것보다 더 중요하고, 꼭 "필요하다"고 생각했던 기능은 그렇지 않은 경우도 있다는 것을 깨닫게 될 것이다.
- 성능
  - 성능을 개선하려면 시스템의 한 영역에서 다른 영역으로 기능을 옮겨야 한다.
- 테스트 통과
  - 리팩터링은 작은 규모의 활동이고, 좋은 테스트가 뒷받침되어야 한다. 코드를 조금 추가한 후 추가한 테스트가 통과했을 때가, 방금 추가한 코드로 다시 뛰어들어 깔끔하게 정리하기에 최고의 타이밍이다.

기능을 이리저리 옮기고 이전에 내린 결정을 바꾸는 것은 사실 ‘고통 관리 pain management ’를 실천하는 것이다. 현실을 피하지 말자.

##### Real-World Complications

일정의 압박은 리팩터링을 하지 않는 단골 핑계다. 하지만 이는 설득력이 떨어진다. 지금 리팩터링을 하지 않으면 일이 더 진척되었을 때, 즉 신경 써야 할 의존성이 더 많아졌을 때 문제를 고쳐야 하고, 따라서 훨씬 더 많은 시간을 투자해야 한다. 그때가 되면 일정에 더 여유가 생길리가 없다

> Tip 65. Refactor Early, Refactor Often

코드 한 부분 때문에 ‘리팩터링만 하는 일주일’이 필요해서는 안 된다. 그건 완전 재작성이다.

일정에 리팩터링할 시간을 확실히 포함시켜 두도록 하라. 그 코드를 사용하는 사람들이 코드가 조만간 재작성될 것이라는 사실과 재작성이 그들의 코드에 미칠 영향을 인지하도록 해야 한다.

#### HOW DO YOU REFACTOR?

- 리팩터링과 기능 추가를 동시에 하지 말라.
- 리팩터링을 시작하기 전 든든한 테스트가 있는지 먼저 확인하라.
- 단계를 작게 나누어서 신중하게 작업하라.

마틴 파울러가 한 조언의 핵심은 탄탄한 회귀 테스트를 유지하는 것이야말로 안전한 리팩터링의 비결이다.
기대하는 수준에 못 미치는 코드를 발견하면, 고쳐라. 고통을 관리하라. 지금은 고통스러 울지라도 앞으로 더욱 고통스러워질 것 같으면 지금 고치는 편이 낫다.

### Topic 41 Test to Code

우리가 생각하는 테스트의 중요한 가치는 무엇일까? 왜 테스트를 해야 한다고 생각하는가? 아래 팁 66이 중요한 대답을 수 있다

> Tip 66. Testing Is Not About Finding Bugs

테스트의 주요한 이득이 테스트를 실행할 때가 아니라 테스트에 대해 생각하고, 테스트를 작성할 때 생긴다고 믿는다.

#### THINKING ABOUT TESTS

한 주에 동영상을 10개 넘게 보는 사람 목록에 대한 테스트

``` python
def return_avid_viewers do
# ... 흠... 열광적인(avid) 시청자(viewer)...
end
```

``` python
def return_avid_users(db, qualifying_field_name) do
```

테스트에 대해 생각하는 것으로 시작했는데 코드 한 줄 쓰지 않고도 두 가지 발견을 할 수 있다.
테스트 데이터를 작성하려면 어떤 필드를 쓸지 알아야 한다. 필드 이름을 매개 변수로 넘기는 꼼수를 쓰면 일단 현재 코드의 테스트가 가능하다.

#### TESTS DRIVE CODING

테스트 작성에 대해 생각함으로써 코드의 작성자가 아니라 사용자인 것처럼 메서드를 외부의 시선으로 볼 수 있다

> Tip 67. A Test Is the First User of Your Code

무언가를 테스트하기 좋게 만들면 결합도도 낮아진다.
무언가를 테스트하려면 그것을 이해해야만 한다.

##### Test-Driven Development

1. 추가하고 싶은 작은 기능 하나를 결정한다.
2. 그 기능이 구현되었을 때 통과하게 될 테스트를 하나 작성한다.
3. 테스트를 실행한다. 다른 테스트는 통과하고 방금 추가한 테스트 딱 하나만 실패해야 한다.
4. 실패하는 테스트를 통과시킬 수 있는 최소한의 코드만 작성한다. 그리고 이제는 모든 테스트가 통과하는지 확인한다.
5. 코드를 리팩터링한다. 방금 작성한 테스트나 함수를 개선할 수 있는 부분이 없는지 살펴본다. 개선한 후에도 테스트가 계속 통과하는지 확인한다.

상향식과 하향식 방법이 있는데, 둘다 좋은 방법은 아니다.
소프트웨어를 만드는 유일한 방법은 점직전인 방법이다. 한쪽 끝과 다른 쪽 끝을 잇는 조그만 기능을 만들과 그 과정에서 문제에 대해 배우는 방식이다.

```
의견) 박스 안의 상향식, 하향식 내용의 결론은 아무리 봐도 애자일을 언급하지 않았을 뿐 애자일 스크럼 방식을 요약해 놓은 것 같다.
```

> Tip 68. Build End-to-End, Not Top-Down or Bottom Up

#### TDD: YOU NEED TO KNOW WHERE YOU’RE GOING

- 론 제프리스의 스도쿠 풀이 프로그램: TDD와 리팩터링을 여러번 진행 후 프로젝트 접음, 테스트 통과 메시지에 홀려서 샛길로 빠진 케이스
- 피터 노빅이 보여주는 접근 방법은 어떻게 해결하는지에 대한 이해로 시작해서 알고리즘을 개선하는데 집중.
  - 구종만 님의 번역본 링크는 아래와 같다
  - https://github.com/jongman/articles/wiki/solving-every-sudoku-puzzle

명백히 테스트는 개발을 이끌어 나가는데 도움이 된다. 하지만 나아갈 때마다 목적지를 떠올리지 않으면 계속 같은 자리만 빙빙 돌게 될 수도 있다.

#### BACK TO THE CODE

소프트웨어도 처음부터 테스트가 가능하도록 만들고, 코드들을 서로 연결하기 전에 코드를 하나하나 철저하게 테스트해야 한다.

#### UNIT TESTING

소프트웨어 단위 테스트란 어떤 모듈에게 이것저것을 시켜보는 코드를 가리킨다. 인위적인 환경을 구축한 다음, 테스트할 모듈의 루틴들을 호출한다. 그런 다음 반환된 결과들을 이미 알고 있는 값과 비교해 보거나 똑같은 테스트를 이전에 돌렸을 때 나온 값과 비교하여 올바른지 검사한다.

#### TESTING AGAINST CONTRACT

단위 테스트를 계약을 잘 지키는지 보는 테스트라고 본다.

어떤 모듈이 있을 때 그 모듈의 하위 컴포넌트들을 먼저 테스트하는 방식이라면,
하위 컴포넌트들을 모두 검증한 후에야 해당 모듈을 테스트할 수 있다.
만약 하위 컴포넌트 테스트는 통과 하는데 해당 모듈 테스트는 통과하지 않는다면
모듈에 문제가 있다고 판단하고 문제의 원인인 모듈 내부에 집중할 수 있다.

> Tip 69. Design to Test

#### AD HOC TESTING

임시로 만든 테스트라도 버리지 말고 정식 테스트의 형태로 만들어 두어야 한다.

#### BUILD A TEST WINDOW

단축키가 특정 URL에 접속하면 상태 정보와 그 외의 진단 제어 창을 둔다.
최종 사용자에게는 알리지 않는 기능이지만, 고객 지원실의 사람들에게는 매우 유용한 도구가 된다.
기능 스위치(feature switch)를 활용해서 특정 사용자나 사용자 집단에 대해 진단 메시지를 더 많이 남기게 해 놓는다.

#### A CULTURE OF TESTING

"테스트가 먼저"가 대부분의 상황에서 최상의 선택이다. 테스트를 할 수 밖에 없기 때문이다.

때에 따라서 테스트를 먼저 쓰기가 어렵거나 의미가 없을 수도 있다. 그럴 때는
"코드와 테스트를 함께"가 대안이 될 수 있다.
코드를 조금 작성하고, 이리저리 만지작거리다가 테스트를 작성하라. 그리고 다시 코드로 넘어간다.

```
의견)
TDD는 정확한 요구사항이 반영된 설계가 되어 있는 정도는 되어야 할 수 있는 기법이라서
나도 코드와 테스트 함께 작성하는 걸 선호하는 편이다.
즉, 테스트 코드를 먼저 작성할 수도 있고 코드를 먼저 작성할 수도 있는 상황을 번갈아 가면서 한다.
```

"나중에 테스트"는 최악의 선택으로 완전 헛소리다.
이것은 사실 "테스트하지 않음"이란 뜻이다.

> Tip 70. Test Your Software, or Your Users Will

테스트는 프로그래밍의 일부다. 다른 사람이나 다른 부서에 떠넘길 수 있는 것이 아니다.
테스트, 설계, 코딩, 이 모든 것이 프로그래밍이다.

```
의견)
Testing, design, coding—it’s all programming.
너무 감동적인 말이다! 왜냐하면 테스트 관련 토픽에 설계를 언급했기 떄문이다.
```

```
의견)
고백 박스에 대한 내용은
책의 저자인 데이브가 종종 테스트 코드를 작성하지 않는다는 것인데
마지막에 테스트가 어떤 면에서 도움이 되는지 확인하기 위해 테스트 코드를 작성하지 않아도 될 정도라면,
테스트 작성 경험이 30년은 쌓여야 한다는 말에 
결국 테스트 코드는 써야 하는 거니까 변명 거리 만들지 말자로 들린다.
```

### Topic 42 Property-Based Testing

함수의 코드와 함수를 테스트하는 코드를 둘 다 작성하면 잘못된 가정이 둘 다 들어갈 수 있다.
따라서 이 둘을 다른 사람이 작성하는게 해결 방법이지만,
테스트에 대해 생각하면 코드를 어떻게 작성할지 알 수 있다는 것이 테스트의 매우 큰 장점이기에
컴퓨터에 테스트를 맡기는 방법으로 하면 좋다.

#### CONTRACTS, INVARIANTS, AND PROPERTIES

선행 조건에 맞게 입력을 하면 출력이 주어진 후행 조건에 맞음을 보장해 주는 계약
리스트의 길이와 같이 함수 실행 전후로 변하지 않는 불변식
이 둘을 '속성(property)''이라고 부르고 속성을 기반으로 해서 테스트 자동화를 사용하면 '속성 기반 테스트(property-based testing'이라고 한다.

> Tip 71. Use Property-Based Tests to Validate Your Assumptions

예시) 리스트 길이에 대해 소트 전/후로 길이가 같고, 소트 이후에 모든 원소는 다음 워소보다 클 수 없다는 테스트를 작성할 수 있다.

#### TEST DATA GENERATION

python 기반의 테스트 데이터 생성 예시

``` python
@given(some.integers())

@given(some.integers(min_value=5, max_value=10).map(lambda x: x * 2))

@given(some.lists(some.integers(min_value=1), max_size=100))
```

#### FINDING BAD ASSUMPTIONS

간단한 주문 처리 및 재고 관리 시스템 예시.

속성 파악을 위한 질문, 
거래가 이루어지는 동안 상품이 생겨나거나 사라질 수는 없다
즉, 창고에서 어떤 상품을 꺼내 오면 꺼낸 상품 수와 남은 재고 숫자를 더했을 때 원래 창고에 이던 재고 숫자가 되어야 한다.

이런 식으로 테스트 코드를 작성해 보면 속성 기반 테스트가 잘못된 가정을 찾아낼 수 있다. 

#### PROPERTY-BASED TESTS OFTEN SURPRISE YOU

속성 기반 테스트가 강력한 까닭은 그저 입력을 생성하는 규칙과 출력을 검증하는 단정문만 설정한 채 제멋대로 작동하도록 놔누기 때문이다. 정확히 어떤 일이 일어날지 절대 알 수 없다.
좌절감은 정확히 무엇이 실패했는지 찾아내기 까다로울 수도 있다는 것이다.

속성 기반 테스트는 임의의 값을 생성하여 사용하기 때문에 다음번 실행에 똑같은 값을 테스트 함수에 넘긴다는 보장이 없다.
문제를 일으켰던 값을 사용하는 단위 테스트를 만들어 두면 버그가 해결되었음을 보장할 수 있다.

#### PROPERTY-BASED TESTS ALSO HELP YOUR DESIGN

속성기반 테스트는 불변식과 계약이라는 관점으로 바라보게 하므로,
무엇이 변하지 않아야 하고, 어떤 조건을 만족해야 하는지 생각하게 된다.
경계 조건은 줄어들고, 데이터의 일관성을 해치는 함수는 더 도드라진다.

#### EXERCISES

##### Exercise 31

Look back at the warehouse example. Are there any other properties that you can test?

```
답변)
연습문제 답에는 뭔가 있을 것 같지만
현재 내가 보이게는 추가해 볼 만한 속성의 테스트는 없어 보인다.
```

##### Exercise 32

Your company ships machinery. Each machine comes in a crate, and each crate is rectangular. The crates vary in size. Your job is
to write some code to pack as many crates as possible in a single layer that fits in the delivery truck. The output of your code is a list of all the crates. For each crate, the list gives the location in the truck, along with the width and height. What properties of
the output could be tested?

```
답변)
배송 트럭의 가로와 세로의 길이가 추가 되어야 할 것 같고
그렇다면 배송 트럭의 가로, 세로의 길이 보다 상자를 더 많이 실었는지에 대한 속성을 테스트 해볼 수 있다.
```

#### CHALLENGES

Think about the code you’re currently working on. What are the properties: the contracts and invariants? Can you use property-
based testing framework to verify these automatically?

```
답변)
Spring boot 기반이라면 있을 것 같아서 찾아보니까 있다.
만약 프로젝트를 더 진행하고 속성 기반 테스트를 진행할 수 있다면 한번 쯤 경험삼아 해볼만 하다고 생각한다.
```

### Topic 43 Stay Safe Out There

코드 간의 결합도에 대해서는 지나칠 정도로 매일 의심해야 한다.

#### THE OTHER 90%

코드가 잘 돌아가도록 작성하는데 90%를 사용했다면, 나머지 90%인 코드가 잘못될 수 있는 경우를 찾아보고 각 경우에 대한 단위 테스트를 추가해야 한다. 잘못된 매개 변수나, 리소스(메모리) 관리의 경우도 생각해야 한다.

내부에서 발생하는 오류 뿐 아니라 외부에서 시스템을 망가트리려 하는 시도까지 고려해야 한다.

#### SECURITY BASIC PRINCIPLES

##### Minimize Attack Surface Area

시스템의 '공격 표면(attack surface)' 영역은 공격자가 데이터를 입력하거나, 데이터를 추출하거나 서비스를 실행시킬 수 있는 모든 접근 지점을 합한 것이다.

- Code complexity leads to attack vectors(공격 매개체)
- Input data is an attack vector.
- Unauthenticated services are an attack vector.
- Authenticated services are an attack vector.
- Output data is an attack vector
- Debugging info is an attack vector

> Tip 72. Keep It Simple and Minimize Attack Surfaces

##### Principle of Least Privilege

최소한의 권한만을 꼭 필요한 시간만큼만 제일 짧게 부여하라는 게 또 다른 핵심 원칙이다.

##### Secure Defaults

비밀번호 입력시에 기본값은 글자를 별표로 바꾸어서 비밀번호를 숨기는 것이어야 한다.

##### Encrypt Sensitive Data

개인 식별 정보, 금융 데이터, 비밀번호, 다른 인증 정보를 일반 텍스트로 남기지 말자.
데이터가 유출 되더라도 암호화가 안전장치 역할을 할 수 있어야 한다.
암호, API키, SSH키, 암호화 비밀번호, 그 밖의 다른 인증 정보를 소스 코드용 버전 관리 시스템에 넣지 말자.

##### Maintain Security Updates

> Tip 73. Apply Security Patches Quickly

인터넷에 연결된 모든 장비는 업데이트를 해야 한다.
지금까지 발생한 데이터 유출 사고 중 가장 큰 사고는 업데이트를 하지 않은 시스템 때문에 발생했다.

#### COMMON SENSE VS. CRYPTO

암호화에 있어서 첫 번째 규칙이자 가장 중요한 규칙은 절대 직접 만들지 말라는 것이다.
많이 검토하고, 철저하게 검사하고, 잘 유지 보수되며 자주 업데이트되는 라이브러리와 프레임워크를 사용, 가급적 오픈 소스가 좋다.
외부의 인증 서비스를 이용하는 것도 방법이다.

### Topic 44 Naming Things

> 올바른 이름으로 부르는 것이 지혜의 시작이다. 공자.

프로그래밍에서는 이름이 "모든 것!"이다.

스트루프 효과: 과제에 대한 반응 시간이 주의에 따라 달라지는 효과 또는 이러한 현상을 이용하는 검사
글자를 읽을 때 글자를 읽는 것 보다 글자의 색을 읽는 것이 더 어려움

또 코드의 예에서도 우리가 꼭 지켜야 하는 명확성이 필요한데 그러려면 이름을 잘 지어야 한다.

예1) 주문 할인을 적용하는 인스턴스 메서드

``` java
public void deductPercent(double amount)
```

'이 함수가 하는 일'로 인식되지, '왜 이일을 하는지'로 인식되지 않는다.
amount는 할인 금액인가 할인율인가 모호하다.

``` java
public void applyDiscount(Percentage discount)
```

메서드 이름에 의도가 명확하다.
매개 변수의 타입도 백분율을 표현하므로, 만약 double로 표현했을 때 0 ~ 100인지 0.0 ~ 1.0 사이인지 고민하지 않아도 된다.

이름을 지을 때는 표현하고 싶은 것을 더 명확하게 다듬기 위해 끊임없이 노력해야 한다.
코드를 작성할 때 코드를 더 잘 이해할 수 있도록 도움이 된다.

#### HONOR THE CULTURE

C 프로그래밍 언어에서는 i, j, k는 전통적으로 반복문에서 증가하는 변수로 쓰여 왔고
s도 문자열을 의미하는 변수로 쓰여 왔다.

어떤 언어는 camelCase, 어떤 언어는 snake_case를 선호한다.

이런 관습을 어긴다면 문제가 될 수 있다.

```
study)
책에 알 수 없는 언어와 `할인적용()` 이라는 예시를 들어서 이런 거 쓰지 말라고 했는데
원서에는 아래와 같은 단어들로 표현되어 있었다.

ɹǝsn
εξέρχεται.

첫번째는 아이슬란드어로 번역은 `쉿`이라는 뜻이다
두번째는 그리스어로 `출구`라는 뜻이다.

```

#### CONSISTENCY

"Order"라는 단어는
온라인 상점을 만드는 팀에게는 `주문`이라는 뜻이지만
종교 단체의 역사를 보여주는 앱을 만드는 팀에게는 `교단`을 의미한다.

팀이 많은 의사소통을 하고 짝 프로그래밍을 여러 사람과 한다면 용어의 의미는 자연스럽게 퍼져 가게 된다.
프로젝트 용어 사전을 만드는 것도 방법이다.

#### RENAMING IS EVEN HARDER

아무리 좋은 이름을 짓기 위해 노력하더라도 모든 것은 변한다. 코드는 리팩터링 되고, 사용 방식은 바뀌고, 의미는 미묘하게 달라진다. 부지런히 이름을 계속 바꾸지 않으면 악몽 같은 상황에 빠지게 된다. 무의미한 이름 보다 더 고약한 잘못된 이름을 사용하는 코드가 되는 것이다.

문제를 발견하면 당장 고쳐야 한다.

> Tip 74. Name Well; Rename When Needed

잘못된 이름을 바꿀 수 없는 상황이라면 더 큰 문제가 있다. 바로 ETC(Earlier To Change) 위반이다. 그 문제를 고치고 나서 잘못된 이름을 바꾸자. 이름을 바꾸기 쉽게 만들고, 자주 이름을 바꾸자.

#### CHALLENGES

- When you find a function or method with an overly generic name, try and rename it to express all the things it really does. Now it’s an easier target for refactoring.

```
답변)
네 알겠습니다.
```

- In our examples, we suggested using more specific names such as buyer instead of the more traditional and generic user. What other names do you habitually use that could be better?

```
답변)
있다고 생각한다.
data, manager 등의 일반적인 이름은 앞에 contentData, userManager와 같은 추가적인 이름을 요구하므로 더 프로젝트에 맞는 이름으로 바꾸는 것도 좋을 수 있다.
```
 
- Are the names in your system congruent with user terms from the domain? If not, why? Does this cause a Stroop-effect style cognitive dissonance for the team?

```
답변)
보통은 일치하지 않지만 미팅과 수시로 질문/답변을 통해 일치시키는 경우가 많이 있다.
그리고 나중에 합류한 팀원이 보통 이런 일을 많이 겪는다.
예를 들어 SCADA(Supervisory Control And Data Acquisition)라는 단어는 산업 현장에서 사용하는 일반적인 용어인데,
일반 사람들은 잘 모르므로 도메인 용어로 받아 들어야 한다.
```

- Are names in your system hard to change? What can you do to fix that particular broken window?

```
답변)
github 로그에 이름을 지은 개발자가 누군지 알 수 있으므로 가서 이름을 바꿔야 한다고 얘기한 후에 빠르게 바꾼다.
사실 이게 깨진 창문을 고치기 위한 가장 빠른 방법이라고 본다.
```