# 타입으로 견고하게 다형성으로 유연하게
## 1장 - 타입 검사 흝어보기
---
Java를 주로 사용해오면서 당연하게 느낀 타입 검사에 대해 다시 한번 생각해보는 좋은 기회인 것 같습니다.
때마침 약 3달전 다른 회사의 채용 과정 중 과제로 Javascript(+ Typescript)를 이용한 API 개발을 2주간 진행했던 경험이 있었는데, 이때 제가 느낀점을 어느정도 정리해 볼 수 있었습니다.

저는 최근에 들어서 개발자는 거의 항상 trade-off를 두고 선택의 기로에 서있다는 것을 꽤나 느끼고 있습니다.
비록 현재 주언어가 Java인 것으로 인해 정적 타입 언어에 대한 강한 긍정적인 입장을 가지고 있으나, 이것이 늘 답은 아닐 수 있다는 마음가짐으로 책을 읽어야겠습니다.

책이 엄청 깊게 파기보다 아직은 생각보다 쉽게, 일정한 깊이까지만 가는 느낌이 들었습니다.
그렇다고 그냥 쭉 읽기보다는, 이번 기회에 주로 사용했던 언어가 어떤 철학과 목적을 가지고 만들어졌는지 정리하면서 읽어야겠다는 생각이 들었습니다.

### 타입 검사의 정의와 필요성
타입은 프로그램에 존재하는 값들을 그 능력에 따라 분류한 것이다. 
값은 변수에 저장거나, 함수에서 반환 될 수 있는 1, true, “hello” 등을 말한다.
정수 타입은 사칙 연산이 적용 가능하지만 문자열을 그러지 못하는 것 처럼 서로의 능력이 제각각이라는 것을 알 수 있고 언어마다 각 타입의 능력과 범위가 조금씩 다를 수 있다.
어떤 타입의 값을 그 타입이 갖고 있지 않은 능력이 사용되도록 프로그램을 작성하면 실행에 문제가 생긴다.
이때를 `타입 오류` 라고 말하며, 버그의 흔한 원인 중 하나가 된다.
버그는 프로그램이 개발자의 의도와는 다르게 작동하는 것이고 항상 발생한다.
따라서 타입 오류가 발생하는지 잘 확인하는 것이 중요하다.
이를 도와주는 존재가 바로 타입 검사기(type checker)인데, ***이상적인 타입 검사기***와 ***현실적인 타입 검사기***로 나누어진다.
**이상적인 타입 검사기**는 주어진 프로그램이 타입 오류를 절대 일으키지 않는다면 “통과”를 출력하고, 타입 오류를 일으키는 경우의 수가 단 하나라도 있다면 “거부”를 출력한다.
하지만 1930년대에 Alan Turing에 의해 이런 타입 검사기는 절대로 생길 수 없다는 사실이 증명 되었다 (검색 결과 1936년 논문 *On Computable Numbers, with an Application to the Entscheidungsproblem* 에서 나온 *멈춤 문제 (Halting Problem)* 를 통해 증명 되었을지 않았을까 생각합니다). 
**현실적인 타입 검사기**는 오류를 일으키는 경우의 수가 단 하나라도 있다면 “거부”를 출력하는 것에서 이상적인 타입 검사기와 똑같지만, 실제로는 타입 오류가 없는데도 “거부”라고 출력하는 경우가 있다.
실제로 오류가 없지만 타입 검사기로 인해 코드를 수정해야 하는 상황이 발생할 수 있지만, 타입 검사기가 알려주는 “통과”라는 결과로 실행 중에 타입 오류가 절대 일어나지 않는다는 보장과 같이 가질 수 있는 이점이 너무 크기 때문에 어느 정도의 타협은 불가피하다.

### 정적 타입 언어
타입 검사기는 따로 만들어지는 것이 아닌, 언어와 함께 제작된다. 
따라서 개발자는 이미 잘 만들어진 타입 검사기를 사용하여 자신의 프로그램이 타입 오류를 일으키는지 확인만 하면 된다. 
타입 검사기를 제공하는 언어는 Java, C, C++, C#, Go, Rust, Kotlin 등이 있으며 이러한 언어들을 **정적 타입 언어**라고 한다.
“정적”은 "프로그램을 실행하기 전”을 뜻하며, 정적 타입 언어는 프로그램을 실행하기 전에 타입이 올바르게 사용되었는지 확인하는 언어를 뜻한다.
이와 반대로 타입 검사기가 제공되지 않는 Javascript, Python, Ruby, LISP 등 **동적 타입 언어**가 있다.
동적 타입 언어는 프로그램 실행 중에야 타입이 잘못 사용되었다는 것을 파악할 수 있다.

### 타입 검사의 원리
정적 타입 언어를 잘 사용하기 위해서는 타입 검사기의 작동 원리와 오류 메시지를 잘 이해해야 한다.
타입 검사기는 더 이상 쪼갤 수 없는 기본 부품에서 큰 부품으로 가면서 프로그램을 검사하고 이런 작동 원리를 보다보면 ***분할 정복 알고리즘***과 아주 흡사하다는 생각이 났다.
*타입 검사기는 아무리 간단한 부품이라도 계산 결과를 절대로 알아내려 하지 않고 오직 타입만 신경쓴다.* 계산 시간만큼 타입 검사가 이루어질 수 있기 때문이다.
우리가 당연하게도 변수나 함수 앞에 써주었던 타입은 결국 검사기에게 정보를 제공하기 위해서고, 이를 토대로 검사가 이루어진다.

### 타입 검사 결과의 활용
정적 타입 언어의 장점:
* 타입 오류를 빠트리지 않고 모두 찾을 수 있다
* 오류 메시지로 인해 쉽게 수정이 가능하다
* Code editor의 기능을 보조하여 개발자의 생산성을 높인다
* 프로그램의 실행 시간이 짧다 -> 타입 검사에서 얻은 정보를 바탕으로 실행 중에 할 일을 줄일 수 있기 때문

### 타입 추론
물론 정적 타입 언어에 단점도 존재한다.
그중 하나는 타입 표시 - 개발자는 항상 변수, 함수의 타입의 표시를 제공해야한다.
매번 표시하기 번거롭게 느껴질 수 있으며, 이를 타입 검사기가 ***타입 추론***을 통해 수고를 덜어준다.
OCaml, Pascal은 타입 추론을 특히 극한까지 발전시킨 언어다.
***타입 추론은 생략된 타입 표시를 복구할 뿐, 타입 검사를 생략하는 것이 아니다.***
따라서 타입 추론을 이용한다고 하더라도 검사를 실패한 프로그램이 작동하지 않는다.

> *“정적 타입 언어에서 타입 표시는 양날의 검이다. 타입 표시를 모든 곳에 붙였다가는 코드가 너무 장황해지기 십상이다. 그렇다고 타입 추론이 허용하는 범위 안에서 무작정 다 생략하는게 꼭 좋지만도 않다.*
> *……*
> *그러니 항상 과유불급의 자세로 타입 표시를 적절히 활용하는 지혜가 필요하다.”*

과유불급의 자세는 여기서 뿐만 아니라, 개발자로서 마주한 문제들을 해결 해 나아갈때 항상 가져야하는 자세라고 생각한다.

### 더 세밀한 타입
다른 단점으로는 타입 검사기는 타입 오류로 인한 버그만 찾을 수 있다는 것이다.
즉, 0으로 나누기, Null에 대한 접근 등 오류는 검출 할 수 없는 것이다.
이런 오류들을 실행하기 전까지 자동으로는 찾을 수 없다.
그럼에도 또다시 타입 검사가 해결책이 될 수 있다.
값을 더 세밀하게 분류하면 된다. -> Java에서는 null이 String에 속함, Kotlin은 아님.
그렇다고 모든게 편해지는 것은 아니고 Kotlin은 오히려 null을 사용하기 불편해졌다.
이런 trade-off가 존재하고 개발자의 상황에 맞는 언어를 고르는 것이 중요하다.

### 다형성
타입 검사기가 ‘거부’라고 틀리게 말하는 단점이 있고, 이는 절대로 완벽하게 해결이 불가능하다.
대신 이렇게 잘못 말하는 경우를 줄여 단점을 최대한 줄일 수 있다.

* 타입 검사의 틀 안에서 개발자를 돕는 ‘안전한’ 기능
* 타임 검사를 무력화하는 ‘위험한’ 기능으로, 타입 검사의 원칙을 아예 파괴

‘위험한’ 기능의 경우 개발자의 판단이 잘못되면 참사가 발생할 수 있지만, 안전한 기능으로도 타입 검사기의 ‘거부’를 고치지 못하는 경우 고려해 볼 수는 있다.
다형성은 타입 검사기의 오판을 줄이는 안전한 기능의 대부분을 차지하는 개념이다.
다형성은 다음과 같이 크게 나눌 수 있다.

* 서브타입에 의한 다형성
* 매개변수에 의한 다형성
* 오버로딩에 의한 다형성

## [논의 내용]
* 현실적인 타입 검사기는 타입 오류가 없음에도 오류 및 거부를 출력하는 경우가 있다는데, 실제로 이것 때문에 코드를 수정해야 했던 경험을 겪어보신 분이 계신가요?
* 정적 타입 언어인 Java를 주로 쓰다보니, 이전에 Javascript로 한 회사의 과제를 진행하면서 타입 검사가 없는 것에 큰 불편함을 느꼈던 적이 있습니다. Typescript를 적용하면서 어느 정도 보완 되었지만 그래도 Java보다는 한참 약하다고 생각했습니다. 저는 정적 타입 검사기로 인해 타입 오류에 대한 버그가 온전히 사라진다는 보장을 가짐으로써, 코드 작성 중 로직에 의해 발생하는 버그에 더 신경 쓸 수 있다고 생각합니다. 그럼에도 전세계적으로 동적 타입 언어가 강세인 이유가 무엇일까요? 또한, 많은 스타트업의 초기 언어로 사용 되는데, 생산성 외에 다른 이유도 있는지 궁금합니다.