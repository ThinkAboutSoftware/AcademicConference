## 2. A Pragmatic Approach

## Discussions

저는 Orthogonality(직교성)에 대한 부분이 중요하다고 생각했고, 또 다른 개념으로 의존성을 줄이자 혹은 응집도를 높이고 결합도를 낮추자 라는 생각을 했습니다.

최근에 작업한 것(지난 1년) 중에 직교성을 고려해서 작업한 내용이 있다면 그 특징이 무엇이 있었는지 간략한 설명을 해보고 논의해 봤으면 좋겠습니다.

```
답변)
저의 경우는 Unity를 사용하고 있고, 여기에는 GameObject - component라는 개념이 있기 때문에 직교성 있는 프로그래밍이 가능할 것으로 여겨지지만 의존 관계는 분명 생기게 마련입니다.

그래서 저는 event 방식의 프로그래밍 전략을 통해 다른 component들 간의 의존성을 줄이고 최대한 직교성을 높이는 방법으로 프로그래밍 하는 작전을 좋아합니다.
```

### Topic 8. The Essence of Good Design

> Tip 14. Good Design Is Easier to Change Than Bad Design

좋은 설계의 핵심은 ETC(Easier to Change) 원칙을 지키는 것이다.

#### ETC IS A VALUE, NOT A RULE

가치를 내면화한 위해 의식적으로 노력해서 항상 스스로에게 물어보자.
ETC의 길인지 체크
직관을 발전시키는 기회로 삼자

#### CHALLENGES

- Think about a design principle you use regularly. Is it intended to make things easy-to-change?
  
  ```
  답변)
  좋은 설계가 변화에 잘 대응하는 길이라 생각하기 때문에 쉽게 변경이 가능한 방법으로 하려고 생각한다.
  ```
- Also think about languages and programming paradigms (OO, FP, Reactive, and so on). Do any have either big positives or big negatives when it comes to helping you write ETC code? Do any have both When coding, what can you do to eliminate the negatives and accentuate the positives?
  ```
  답변)
  함수형에서 어떤 함축적인 문법이 어려움으로 다가올 때가 있다.
  도움을 주는 부분만 살려서 코딩의 가능하겠지만 능숙하게 다룰 때 까진 시간이 걸릴 것이다.
  ```
- Many editors have support (either built-in or via extensions) to run commands when you save a file. Get your editor to popup an ETC? message every time you save and use it as a cue to think about the code you just wrote. Is it easy to change?
  ```
  답변)
  팝업 띄우는 것 까지 하면 번거롭겠지만 적어도 commit 하기 전에 한번 검토해 보는 것으로 생각해 볼 수 있을 것 같다.
  에러가 없는가?는 사실 당연한 것이고 바꾸기 쉬운가의 문제를 조금 더 신경써 보게 될 것 같다.
  ```

### Topic 9. DRY—The Evils of Duplication

요구사항과 명세는 계속 변경된다.
여기서 유지보수를 따르는 고통을 피하기 위해 반복해서 코드를 작성하지 않아야 한다.
모든 지식은 시스템 내에서 단 한번만, 애매하지 않고 권위있게 표현되어야 한다.

> Tip 15. DRY—Don’t Repeat Yourself

#### DRY IS MORE THAN CODE

DRY는 코드 뿐만 아니라 지식의 중복, 의도의 중복을 포함한다.
어딘가 한 군데를 바꿨을 때 다른 곳도 함께 바꿔야 한다면 중복이다.

#### DUPLICATION IN CODE

숫자 표현식과 출력의 예제, 책의 코드 예시를 봐야 함

##### Not All Code Duplication Is Knowledge Duplication

동작하는 코드는 동일해도 지식의 표현이 다르다면 중복은 아니다.

``` python
def validate_age(value):
  validate_type(value, :integer) 
  validate_min_integer(value, 1)
def validate_quantity(value):
  validate_type(value, :integer) 
  validate_min_integer(value, 1)
```

#### DUPLICATION IN DOCUMENTATION

함수 이름이 함수가 하는 역할을 표현하게 하자.
함수에 주석은 수정을 두 번 해약하는 중복이다.

##### DRY Violations in Data

Line class에서 start point, end point 를 표현하는데 있어 length 값을 두는 건 중복이다. length는 계산을 통해 얻을 수 있다

``` java
class Line {
  Point start;
  Point end;
  double length;
}
```

``` java
class Line {
  Point start;
  Point end;
  double length() { return start.distanceTo(end); }
}
```

가능하다면 객체의 속성을 읽고 쓸 때 접근자 함수를 사용.

#### REPRESENTATIONAL DUPLICATION

##### Duplication Across Internal APIs

내부 API를 정의할 수 있는 도구: Swagger, Thrift, Protocol Buffer
이런 도구를 사용하여 여러 팀이 공유할 수 있게 하면 좋다.

##### Duplication Across External APIs

OpenAPI 명세를 우리의 API 도구로 불러와서 사용
혹은 이런 API를 하나 만들어서 공개하면 유지보수 하면서 도움을 받을 수도 있음

##### Duplication with Data Sources

데이터 스키마 분석 기능을 통해 데이터 저장소와 코드 간의 중복을 제거.
이런 일을 줄여주는 persistence framework가 있다: Hibernate, MyBatis 등

구조체나 클래스로 표현하는 대신 key-value 데이터 구조에 밀어 넣는 방식도 있다.

#### INTERDEVELOPER DUPLICATION

같은 프로젝트에서 각자 다른 모듈을 개발하는 팀끼리의 중복
이에 대처하려면 의사소통을 잘 하는 유대가 돈독한 팀을 만들어야 한다.

소통을 위해 일일 스탠드업 미팅, 슬랙 채널을 이용.
혹은 프로젝트 사서를 임명, 유틸리티나 스크립트 저장소를 한곳에 모아둔다.

> Tip 16. Make It Easy to Reuse

결국 기존의 것을 재사용하고 쉽게 사용할 수 있는 환경을 조성해야 한다.

### Topic 10. Orthogonality(직교성)

#### WHAT IS ORTHOGONALITY?

컴퓨터 과학에서는 독립성이나 결함도 줄이기를 의미한다
하나가 바뀌어도 나머지에 어떤 영향도 주지 않으면 직교한다고 볼 수 있다

##### A Nonorthogonal System

헬리콥터 조종 같은 경우는 직교적이지 않다

#### BENEFITS OF ORTHOGONALITY

> Tip 17. Eliminate Effects Between Unrelated Things

직교적인 시스템을 작성하면 생산성 향상과 리스크 감소를 얻을 수 있다

##### Gain Productivity

개발 시간과 테스트 시간 감소
재사용 촉진
직교적인 컴포넌트의 결합으로 단위 노력당 더 많은 기능을 얻을 수 있다

##### Reduce Risk

감염된 코드가 격리되어 있다
시스템이 잘 깨지지 않는다
테스트를 더 많이 하게 된다
특정 업체나 제품, 플랫폼에 덜 종속된다

#### DESIGN

계층구조는 직교적인 시스템을 설계하는 강력한 방법이다

"특정 기능에 대한 요구사항을 대폭 변경하는 경우 몇 개의 모듈이 영향을 받는가?"
직교적인 시스템에서는 답이 '하나'여야 한다

현실 세계의 변화와 설계 사이의 결합도를 얼마나 줄였는지도 확인
자신의 힘으로 제어할 수 없는 속성에 의존하지 말라

#### TOOLKITS AND LIBRARIES

외부에서 만든 툴킷이나 라이브러리를 도입할 때 직교성을 해치지 않는지 확인
기술을 현명하게 선택하라
EJB 시스템은 직교성에 대한 흥미로운 예제 => EJB는 내부를 바꾸지 않으면서 기능을 추가하는 장식자 패턴(decorator pattern)의 예

#### CODING

- _Keep your code decoupled_
  - '부끄럼쟁이(shy)' 코드를 작성하라. 즉, 불필요한 것은 다른 모듈에 보여주지 않으며, 다른 모듈의 구현에 의존하지 않는 코드를 작성하라.
- _Avoid global data_
  - 싱글턴 패턴(singleton pattern)의 문제점. 많은 개발자들은 싱글턴 객체를 일종의 전역 데이터로 남용한다. 싱글턴은 불필요한 결합을 만들 수 있다. 
- _Avoid similar functions_
  - 유사한 함수의 경우 전략 패턴(strategy pattern)을 사용하여 더 낫게 구현할 수는 없는지 고민

#### TESTING

테스트를 정규 빌드 과정의 일부로 수행
단위 테스트를 작성하는 행위 자체가 직교성을 테스트해 볼 수 있는 기회
버그 수정은 시스템의 직교성을 총체적으로 점검해 볼 수 있는 값진 시간, 자동화에 힘을 쏟아야 함

#### DOCUMENTATION

직교성 이용 가능. 내용을 쓸 때는 내용에만 집중하고, 예쁘게 꾸미는 것은 다른 변환 도구에 맡길 수 있다.

#### LIVING WITH ORTHOGONALITY

DRY 원칙과도 밀접한 관계가 있다.
직교적이지 않은 프로젝트에 투입이 되었다면, 리팩터링이 필요하다.

#### Challenges

- Consider the difference between tools which have a graphical user interface and small but combinable command-line utilities used at shell prompts. Which set is more orthogonal, and why? Which is easier to use for exactly the purpose for which it was intended? Which set is easier to combine with other tools to meet new challenges? Which set is easier to learn?
  ```
  답변)
  github cli인 gh와 github desktop의 예로 차이점을 생각해 볼 수 있다.
  
  무엇이 더 직교적인지는 어려운 질문이라고 생각하는데 커맨드 라인이 더 직교적이라 할 수 있다.
  그렇게 생각한 이유는 명령어와 옵션 옵션에 해당하는 내용의 조합으로 필요한 옵션에 대해
  추가적으로 커맨드 라인을 동작시킬 수 있기 때문이다.
  반면 github desktop의 경우는 정해진 UI에 따라 버튼을 클릭해서 조작하는 형태로
  옵션에 해당하는 내용을 진행할 떄 마다 마우스의 이동과 클릭이 더 빈번해 지게 된다.
  
  무엇이 해당 툴이 의도한 목적을 정확히 사용하기 쉬운가? 에 대해서도 역시 gh가 더 낫다는 생각이다.
  커맨드 라인 입력 툴이지만 어떤 명령어인지와 옵션을 줄 지에 대해 목적을 잘 정한다면
  정확하게 사용하는데는 더쉽다고 생각하기 때문이다.
  
  무엇이 새로운 도전과제에 대해 조합하기 쉬운가? 에 대한 건 확실히 gh라고 생각한다.
  안 써본 명령이라고 해도 명령의 help를 통해서 더 많은 옵션에 대해 학습이 진행된다면 조합해서 사용하기 더 쉽기 때문이다.

  배우기 쉬운가?에 대해서는 2022년 기준으로는 github desktop이다.
  많은 명령어와 옵션을 배우지 않고도 버튼 클릭만으로도 git의 주요 기능을 사용할 수 있기 때문이다.
  전반적으로 GUI가 있는 툴이 배우기는 쉬운 건 맞다.
  ```
- C++ supports multiple inheritance, and Java allows a class to implement multiple interfaces. Ruby has mixins. What impact does using these facilities have on orthogonality? Is there a difference in impact between using multiple inheritance and multiple interfaces? Is there a difference between using delegation and using inheritance?
  ```
  답변)
  - 클래스의 객체를 인터페이스 구현의 기능 단위로 바라본다면 한 클래스에 많은 인터페이스를 구현할 수록 직교성에 해를 끼친다고 본다.
  - 다중 상속과 다중 인터페이스 사용이 크게 다르다고 보지는 않는다.
  - 위임과 상속은 당연히 차이가 있는데, 위임 방식이 더 캡슐화를 쉽게 할 수 있는 방식이고 직교성을 덜 해치는 방향으로 만들 수 있다.
  ```

#### Exercises

##### Exercise 1

You’re asked to read a file a line at a time. For each line, you have to split it into fields. Which of the following sets of pseudo
class definitions is likely to be more orthogonal?

```
class Split1 {
  constructor(fileName) # opens the file for reading
  def readNextLine() # moves to the next line
  def getField(n) # returns nth field in current line
}
```
or

```
class Split2 {
  constructor(line) # splits a line
  def getField(n) # returns nth field in current line
}
```

```
답변)
직교성의 관점에서만 보자면 Split2 클래스가 더 낫다고 본다.
라인 단위로 읽어서 n번째 필드 반환이라는 단순한 기능을 가진 작은 클래스라면 직교적이라고 본다.
Split1 클래스는 직교적이라고 하기에는 문제가 있는데,
파일 이름에 해당하는 파일을 읽으면 어떤 방식으로 읽어내는지에 따라
readNextLine() 메서드의 동작 방식에서 차이가 생길 수 있기 때문이다.
```

##### Exercise 2 

What are the differences in orthogonality between object-oriented and functional languages? Are these differences inherent in the languages themselves, or just in the way people use them?

```
답변)
함수형 언어로 구현한 코드가 직교성이 더 높다고 볼 수 있다.
객체지향 언어는 클래스에 구현하기 나름이겠지만 데이터와 함수의 조합이고 side effect의 가능성을 내포하지만,
함수형 언어는 함수 자체의 순수성이 입력에 대한 결과로 보장하므로 더 직교적으로 코드를 작성할 수 있다고 본다.

그래서 언어 자체의 특성이 크고, 사람들이 사용하는 방법에 따라서도 달라진다고 볼 수 있을 것이다. 
```

### Topic 11 Reversibility(가역성)

무언가를 구현하는 데는 여러 가지 방법이 있고 중요한 결정을 내려서 진행한다고 하더라도
이러한 결정 하나하나가 프로젝트팀을 점점 더 달성하기 힘든 목표로 몰아넣는다.

중요한 결정은 쉽게 되돌릴 수 없다.
특정 업체의 데이터베이스, 아키텍처 패턴, 어떤 배포 모델을 사용하기로 결정했다면
큰 비용을 치르지 않고는 되돌릴 수 없는 행동을 하기로 묶여버린 셈이다.

#### REVERSIBILITY

되돌릴 수 없는 결정을 줄여야 하는 까닭은 우리가 프로젝트 초기에 늘 최선의 결정을 내리지는 못하기 때문이다.
결정이 바뀌지 않을 것이라 가정해도 발생할지도 모를 우연한 사건에 대비하지 않는 데에서 이런 실수가 나온다.

> Tip 18. There Are No Final Decisions

#### FLEXIBLE ARCHITECTURE

아키텍처, 배포, 외부 제품과의 통합 영역을 유연하게 유지하는 데에도 관심을 기울일 필요가 있다.
바꾸기 쉽게 만들어야 한다.
외부 API를 추상화 계층 뒤로 숨겨라.
여러 컴포넌트로 쪼개라.

> Tip 19. Forgo Following Fads (유행을 좇지 말라)

#### CHALLENGES

Time for a little quantum mechanics with Schrödinger’s cat.

Suppose you have a cat in a closed box, along with a radioactive particle. The particle has exactly a 50% chance of fissioning into two. If it does, the cat will be killed. If it doesn’t, the cat will be okay. So, is the cat dead or alive? According to Schrödinger,  the correct answer is both (at least while the box remains closed). Every time a subnuclear reaction takes place that has two  possible outcomes, the universe is cloned. In one, the event occurred, in the other it didn’t. The cat’s alive in one universe, dead in another. Only when you open the box do you know which universe you are in.

No wonder coding for the future is difficult. But think of code evolution along the same lines as a box full of Schrödinger’s cats: every decision results in a different version of the future. How many possible futures can your code support? Which ones are more likely? How hard will it be to support them when the time comes?

Dare you open the box?

```
답변)
양자역학과 양자컴퓨팅 쪽에 지식이 있어서 이게 무슨 내용 인지에 대해서는 알고 있다는 게 다행이다.
정답이 있다기 보다는 내 상황에 빗대서 대답을 한번 해보면 좋을 것 같다.

내 코드가 몇 가지 미래를 지원할 수 있는가? 에 대해서는 사실 한 가지 미래 뿐이다.
만약 다른 미래가 필요하다면 그 미래에 필요한 또 다른 코드를 작성하되
기존에 작성한 코드의 도움을 잔뜩 받아서 만들어 낼 것 같다.

어떤 미래가 일어날 가능성이 큰가?
변화에 대처할 수 있는 코드를 만들었느냐에 따라 다를 것 같다.
생각해 보니 동시에 두 가지가 공존하는 것 같다. 
미래를 대비하는 유연한 그리고 잘 설계된 코드와 당장 동작하는 코드이고
해당 기능이 필요가 없다면 코드를 당장 버릴 수도 있는 일회성 코드들로 설명이 가능할 것 같다.

그 미래가 왔을 때 지원하는 것이 얼마나 어려울까?에 대한 답변은 어렵다에 한 표를 더 던지고 싶다.
왜냐하면 미래 자체가 예측 불가능하므로 어느 정도 미래에 대비했다면 코드의 재사용이 가능할 것 같으나
결국 동작하는 코드를 작성해야 하는 시점은 재사용성 보다는 새로 작성해야 하는 코드가 많으므로
이런 미래를 지원하는 코드에 대해서 다시 잘 생각해 보면 상당히 많이 어렵다고 볼 수 있다.

상자를 열 용기가 있는가?
이건 당연히 그리고 바로 열 수 있다. 빠르게 미래를 본 자만이 미래를 대비할 수 있다고 믿고 싶다.
```

### Topic 12. Tracer Bullets(예광탄)

전에 만들어진 적이 없는 전혀 새로운 것을 만들고 있다면 즉각적인 피드백을 받아야 한다. => '예광탄 개발'

#### CODE THAT GLOWS IN THE DARK

시스템을 정의하는 중요한 요구 사항을 찾아라.
의문이 드는 부분이나 가장 위험이 커 보이는 곳을 찾아라.
이런 부분의 코드를 가장 먼저 작성하도록 개발 우선순위를 정하라.

> Tip 20. Use Tracer Bullets to Find the Target

하나의 작은 기능을
사용자 인터페이스 - 권한 부여 - 비즈니스 로직 - 데이터 모델 - 데이터베이스
에 이르기 까지 모두 구현한다.

예광탄 코드는 한 번 쓰고 비리는게 아니라 앞으로도 계속 사용할 코드다.
다른 제품 코드와 마찬가지로 오류 검사, 올바른 구조, 문서화, 자체 검사를 갖추어야 한다.
예광탄 개발 방법은 '프로젝트는 결코 끝나지 않는다'는 견해와도 일맥상통한다.

- _Users get to see something working early_
  - 사용자가 직접 기여하고 관심도 커짐
  - 반복 주기마다 얼마나 목표에 가까이 가는지 알려줌
- _Developers build a structure to work in_
  - 예광탄 구조를 만들어 뒀다면, 백지 상태에서 시작하는 것 보다 생산성이 좋아지고 일관성도 촉진된다
- _You have an integration platform_
  - 매일 여러번 지속적으로 통합하여 새로 도입된 변화가 어떤 영향을 주는지 명확하게 보이며, 상호작용의 변경 범위는 더 적을 것이다.
  - 더 빠르고 정확하게 디버깅하고 테스트할 수 있다.
- _You have something to demonstrate_
  - 경영진들은 껄끄러운 시간에 데모를 보고 싶어함 => 언제나 동작하는 소프트웨어를 보여줄 수 있음
- _You have a better feel for progress_
  - 작은 단위로 개발하기 때문에 95% 완성과 같은 거대한 코드 덩어리를 안 만들게 된다.

```
의견)
애자일의 스크럼 개발 방식과 비슷하다는 느낌을 많이 받는다.
불확실성이 크므로 스프린트 를 진행하면서 동작하는 소프트웨어에 중점을 두고
작고 핵심적인 기능을 구현하고 이후 지속적으로 동작하는 큰 소프트웨어를
개발하고 배포 하는 방식이므로 예광탄 개발 방법과 크게 다른 게 없다고 느껴진다.

오히려 애자일 스크럼이라는 용어를 쓰지 않고 설명하고 있다는 느낌이 더 강하다.
```

#### TRACER BULLETS DON’T ALWAYS HIT THEIR TARGET

예광탄이 꼭 목표물이라는 보장이 없으므로, 목표물에 맞을 때 까지 조준을 옮겨야 하는 것이 핵심이다.

#### TRACER CODE VERSUS PROTOTYPING

프로토타이핑은 개념의 증명을 위해 구현한 것이므로 완료한 이후의 코드는 버려진다. 여기서 얻은 아이디어로 실제 구현은 새로 한다.
프로토타이핑은 예광탄을 발사하기 전에 먼저 수행하는 정찰이나 정보 수집과 같은 것이다.

### Topic 13. Prototypes and Post-it Notes

소프트웨어 프로토타입도 위험 요소를 분석하고 노출시킨 후, 이를 매우 저렴한 비용으로 바로잡을 기회를 얻는 것이다.
프로토타입은 꼭 코드로 작성하지 않고, 포스트잇이나 화이트보드, 그림판 프로그램 등을 이용해 기능은 구현하지 않고 만들어 볼 수도 있다.
세부 사항을 포기할 수 없는 환경이라면 진짜로 포로토타입을 만들고 있는게 맞는지 자문할 필요가 있음, 이럴 경우에는 예광탄 방식의 개발이 더 적절.

#### THINGS TO PROTOTYPE

이전에 해 본 적이 없는 것,
최종 시스템에 매우 중요한 것,
증명되지 않았거나,
실험적이거나,
의심이 가는 것,
마음이 편하지 않은 것
모두가 프로토타이핑의 대상이 될 수 있다.

프로토타이핑의 가치는 생산한 코드에 있는 것이 아니라 이를 통해 배우는 교훈에 있다.

> Tip 21. Prototype to Learn

#### HOW TO USE PROTOTYPES

- _Correctness_ : 적절히 가짜(dummy) 데이터를 사용
- _Completeness_ : 제한된 방식으로만 작동
- _Robustness_ : 오류 검사를 빼먹거나 아예 무시할 수도 있다.
- _Style_ : 주석이나 문서가 많지 않아야 한다.

파이썬이나 루비 같은 추상화 수준이 높은 언어를 쓰는 것이 수월할 때도 있다. => 어차피 프로토타입은 버려야 하니 언어를 바꿔도 상관 없다.

#### PROTOTYPING ARCHITECTURE

전체적으로 시스템이 어떻게 동작할지에 대해 감을 잡는다.
세부 사항은 무시한다.

- 각 모듈이 실행 중에 필요한 데이터에 접근할 수 있는 경로를 갖고 있는가? 모듈에 데이터가 **필요한 시점**에 데이터 접근이 가능한가?

위의 마지막 항목이 값진 결과를 내놓기 쉽다.

#### HOW NOT TO USE PROTOTYPES

모든 사람에게 폐기 처분할 코드를 작성하고 있다는 사실을 이해시켜야 한다.
프로토타입 코드의 목적이 잘못 해석될 가능성이 크다고 느낀다면 예광탄 접근 방식을 취하는 편이 낫다.

#### EXERCISES

##### Exercise 3

Marketing would like to sit down and brainstorm a few web page designs with you. They are thinking of clickable image
maps to take you to other pages, and so on. But they can’t decide on a model for the image—maybe it’s a car, or a phone,
or a house. You have a list of target pages and content; they’d like to see a few prototypes. Oh, by the way, you have 15  minutes. What tools might you use?

```
답변)
아주 매력적인 연습문제라고 생각한다.
나라면 우선 10분 동안 Image list view라는 검색어로 빠르게 패키지를 설치해서 튜토리얼을 돌려볼 수 있는
웹 페이지를 빌드할 것 같다. 특정 front-end framework을 넣으면 더 빠르게 찾는 것도 가능하다.

그 튜토리얼은 이미 이미지도 준비가 되어 있고, 예쁘게 m x n 배치로 스크롤링 까지 되는 예제일 것이다.
그러면 정말 그럴싸한 프로토타이핑을 할 수 있다고 생각한다.
서버 구축을 할 필요도 없고 빠르게 패키지만 설치해서 localhost에서 화면을 보는 거라면 15분이면 충분히다.
```

### Topic 14. Domain Languages

실용주의 프로그래머라면 어떤 경우에는 한 차원 더 나아가서 그 도메인의 실제 어휘와 문법, 의미론을-즉, 그 도메인 언어를-사용해서 프로그래밍할 수도 있다.

> Tip 22. Program Close to the Problem Domain

#### SOME REAL-WORLD DOMAIN LANGUAGES

##### RSpec

루비용 테스트 라이브러리

##### Cucumber

프로그래밍 언어에 종속되지 않은 테스트를 정의할 수 있다.
고객은 왜 자연어로 되어 있는 테스트 스크립트를 읽지 않는가? 에 대한 내용
=> 달성하려는 목표에 대해서 두루뭉술한 생각만 갖고 있을 뿐, 세부 사항에 대해서는 알지도 못하고 신경도 안쓰기 때문.
=> 동작하는 코드를 보여주고, 직접 사용할 수 있게 하라. 그러면 그들(사업부 사람들)에게 진짜로 필요한 것이 드러날 것이다.

##### Phoenix router

http 요청을 코드의 햄들러 함수로 전달하는 라우팅 도구

##### Ansible

소프트웨어를 설정하는 도구. 주로 다수의 원격 서버를 관리할 때 사용.

#### CHARACTERISTICS OF DOMAIN LANGUAGES

RSpec, Phoenix router: 내부 도메인 언어, 즉 실행하는 코드 안으로 들어갈 수 있게 해줌
Cucumber, Ansible: 외부 언어, 즉 별도의 코드가 이 언어를 읽어 들여서 사용할 수 있는 형태로 바꾼다.

#### TRADE-OFFS BETWEEN INTERNAL AND EXTERNAL LANGUAGES

내부 도메인 언어의 단점: 호스트 언어의 문법과 의미론을 따라야 함. 원하는 언어와 구현할 수 있는 언어 사이에서 어느 정도 타협해야만 한다.

가능하다면 yaml, json, csv 처럼 널리 통용되는 외부 언어를 사용, 그게 아니라면 내부 언어를 고려.

#### AN INTERNAL DOMAIN LANGUAGE ON THE CHEAP

호스트 언어의 문법이 노출되어도 상관 없다면, 메타프로그래밍을 남발하는 대신 그냥 함수를 써서 구현.
RSpec도 그런 방식을 쓴다.

#### CHALLENGES

- Could some of the requirements of your current project be expressed in a domain-specific language? Would it be possible to
write a compiler or translator that could generate most of the code required?

```
답변)
슬프게도 DSL로 표현할 부분이... 없다.
역시 컴파일러나 변환기를 작성할 수가 없다.
외부 도메인, 내부 도메인 할 것 없이 unity라는 정해진 게임 엔진 위에 C# 이라는 정해진 내부 언어를 사용하므로 고려할 여지는 없는 것 같다.
```

- If you decide to adopt mini-languages as a way of programming closer to the problem domain, you’re accepting that some effort will be required to implement them. Can you see ways in which the framework you develop for one project can be reused in others?

```
답변)
알려진 DSL을 사용해서 변환기나 컴파일러가 지원되는 형태로 사용할 수 있게 해야 할 것이다.
하지만 그 정도의 노력을 들일 정도라면, 그냥 내부 언어를 쓰는 게 낫다는 판단이 든다.
```

#### EXERCISES

##### Exercise 4

We want to implement a mini-language to control a simple turtle-graphics system. The language consists of single-letter
commands, some followed by a single number. For example, the following input would draw a rectangle:

```
P 2 # select pen 2
D # pen down
W 2 # draw west 2cm
N 1 # then north 1
E 2 # then east 2
S 1 # then back south
U # pen up
```

Implement the code that parses this language. It should be designed so that it is simple to add new commands.

```
답변)
C# 언어 기준으로 생각하고 설명한다.
단순히 파싱만 하고 저장하는 거라면
`List<(char, int)>`
정도로 담아 둘 수 있다.

여기서 int에 해당하는 값이 없는 명령어 D나 U 같은 경우는 -1과 같은 값으로 정의하면
일괄로 (char, int) 로 정의가 가능할 것이다.

연습문제 5번과 연결시켜서 생각해 보면 명령어 마다 함수를 만들어야 하고
그게 내부 언어로 다시 구현이 되어야 하는 걸 생각해 보면
`List<(char, int, Action<char, int>)>`
이런 형태의 정의가 가능하긴 하다.
하지만 C#좀 하는 사람이 봐도 괴상한 정의처럼 보이므로 tuple을 class로 정의를 하면 될 것 같다.

class Turtle
{
    public char command;
    public int value;
    public Action<char, int> commandAction;
}

그러면 파싱해서 저장해야 하는 건 다시 아래 처럼 정의가 가능해질 것이다.
`List<Turtle>`
```

##### Exercise 5

In the previous exercise we implemented a parser for the drawing language—it was an external domain language. Now
implement it again as an internal language. Don’t do anything clever: just write a function for each of the commands. You may
have to change the names of the commands to lower case, and maybe to wrap them inside something to provide some context.

```
답변)
사실 연습문제 5번까지를 포함해서 명령어 마다 함수를 만든다는 개념을 C#의 Action delegate로 생각해 볼 수 있었다.
대소문자를 가리는 건 Action delegate 내부에서 ToLower() 변환해서 소문자 처리를 하면 되는데
명령어를 wrap 한다는 건 무슨 뜻인지 잘 이해가 가지 않는다.
연습문제 4번에서 이미 명령어만 있는 경우는 두번째 value를 -1로 처리하는 것으로 하면 되므로 큰 문제는 없을 것으로 본다.
```

##### Exercise 6

Design a BNF grammar to parse a time specification. All of the following examples should be accepted:

4pm, 7:38pm, 23:42, 3:16, 3:16am

```
답변)
배커스-나우르 표기법에 대해서 봤는데 공부를 좀 진하게 해야 할 것 같은 느낌이다.
https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form

Academic conference와 상관 없이 따로 공부해 보고 업데이트를 해보겠다.
```

##### Exercise 7

Implement a parser for the BNF grammar in the previous exercise using a PEG parser generator in the language of your choice. The output should be an integer containing the number of minutes past midnight.

```
답변)
PEG 파서 생성기 역시 공부를 진하게 해야 만들 수 있을 것 같다.
이것 역시 나중에 연습문제 6번을 풀고 공부해서 해봐야 할 것 같다.
```

##### Exercise 8

Implement the time parser using a scripting language and regular expressions.

```
답변)
스크립트 언어는 정해서 코딩하면 될 것 같고
정규식은... 역시 공부해서 풀어야 할 것 같다.
```

### Topic 15. Estimating

추정하는 법을 배우고 추정 능력을 계발하여 무언가의 규모를 직관적으로 짚을 정도가 되면, 추정 대상의 가능성을 가늠하는 마법과 같은 능력을 발휘할 수 있게 됨.

> Tip 23. Estimate to Avoid Surprises

#### HOW ACCURATE IS ACCURATE ENOUGH?

추정의 단위가 결과의 해석에 차이를 준다.
130일이 걸리는 것과 6달이 걸리는 것의 차이는 정확도의 차이로 인식할 수 있다.

- 1 ~ 15일: 일 추정 단위
- 3 ~ 6주: 주 추정 단위
- 8 ~ 20주: 달 추정 단위
- 20주 이상: 추정치를 말하기 전에 다시 한번 생각

#### WHERE DO ESTIMATES COME FROM?

이미 그 일을 해본 사람에게 물어본다.
비슷한 경험을 한 주변 사람들에게 문의하고, 어떻게 해결했는지 알아봄

##### Understand What’s Being Asked

상대방이 무엇을 붇고 있는지 이해하는 것.
추정하기 전에 어떤 조건이 있을지 생각하는 습관을 길러보자.

##### Build a Model of the System

모델을 만드는 것은 창의적이면서도 장기적으로 유용한 작업으로, 이전에 표현에 명확히 느러나지 않았던 숨겨진 패턴과 프로세스를 발견하는 경우도 많다.
모델을 만들어 추정을 하면 그 결과는 부정확해질 수 밖에 없다. 간결함과 정확성을 맞교환 하고 있다.

##### Break the Model into Components

모델은 컴포넌트로 분해하고, 이런 컴포넌트들이 어떻게 상호 작용하는지를 수식으로 기술
각 컴포넌트가 어떻게 전체 모델에 기여하는지를 나타내는 매개 변수를 찾자.

##### Give Each Parameter a Value

매개 변수에 대해 계산할 때는 근거가 필요.

##### Calculate the Answers

주요 매개 변수들의 값을 변경시켜 가면서 여러 번 계산해 보고, 이 가운데 어떤 것이 모델에 잘 들어맞는지 찾아내라.

##### Keep Track of Your Estimating Prowess

추정치를 기록해 놓고, 나중에 이 값이 실제 결과에 얼마나 가까웠는지를 평가해 보면 좋다.
추정치가 틀려도 도망가지 말고 왜 틀렸는지 찾자. => 원인을 규명하면 다음 추정치는 나아진다.

#### ESTIMATING PROJECT SCHEDULES

##### Painting the Missile

PERT(Program Evaluation Review Technique): 낙관적 추정치, 가장 가능성이 높은 추정치, 비관적 추정치를 가지고 통계 기법으로 계산
PERT는 좋은 방법은 아닌데, 실제 프로젝트를 수행해 본 적이 없기 때문에 추정치는 정확하지 않다.

##### Eating the Elephant

초기 기능의 구현과 테스트를 마친 후, 이를 첫 번째 반복 주기의 끝으로 삼자.
각 반복 주기가 끝날 때 마다 추측을 더 다듬다 보면, 일정에 대한 확신도 커진다.

> Tip 24. Iterate the Schedule with the Code

#### WHAT TO SAY WHEN ASKED FOR AN ESTIMATE

"나중에 연락드릴께요"
커피 머신 앞에서 허투루 말한 추정치는 커피와 마찬가지로 해를 끼침

#### CHALLENGES

Start keeping a log of your estimates. For each, track how accurate you turned out to be. If your error was greater than 50%, try to find out where your estimate went wrong.

```
답변)
최근에 하나 있는데 진행 중인 프로젝트에 대한 sonarqube 정적 분석을 진행하는 것이었다.
그런데 sonarqube는 프로젝트의 error를 허용하지 않는데
하필 sonarqube가 원하는 빌드 툴은 .NET이었고
Unity는 .NET으로 빌드하면 원하지 않는 에러가 발생한다.

이 에러를 수정을 다 해야 sonarqube에 빌드와 테스트 결과를 전송할 수 있는데
이 과정에 대한 추정 시간을 판단하지 못했고 예상보다 많은 작업시간을 들여서 완료가 되었다.

기록에 남기긴 했는데 예상했던 시간 보다 무려 4시간이나 더 진행했다.
오차 범위 50%를 충분히 넘은 66%였다. 
```

#### EXERCISES

##### Exercise 9

You are asked “Which has a higher bandwidth: a 1Gbps net connection or a person walking between two computers with a
full 1TB of storage device in their pocket?’’ What constraints will you put on your answer to ensure that the scope of your
response is correct? (For example, you might say that the time taken to access the storage device is ignored.)

```
답변)
1Gbps는 초당 1Gbit의 용량을 전송하므로
1000초는 되어야 1Tbit의 용량이고
8000초여야지 1TByte의 용량이 된다.

8000초는 
133.333분이고
2.222 시이므로

1TB의 용량을 전송하는데 걸리는 시간은 2.22시간이다.

사람이 어떤 운송 수단을 이용하지 않고 쉬지 않고 뛰고 1시간에 10km를 이동한다고 가정하면
대략 2시간 13분 이내에 뛰어서 이동할 수 있는 거리인 22km 이내의 거리일 때
질문의 대역폭을 맞춰볼 수 있다.

또 저장장치에 접근하기 위해 필요한 시간 무시
그리고 저장장치에서 또 다른 저장장치로 데이터를 복사하는데 필요한 시간 무시라는 제약 조건을 추가한다면

약 20km 거리 이내에 각 컴퓨터가 위치해 있을 때
네트워크 전송 보다는 사람이 쉬지 않고 뛰는 게
더 빠른 데이터 전송 속도를 가질 수 있다고 얘기할 수 있다.
```

##### Exercise 10

So, which has the higher bandwidth?

```
답변)
20km 이내에 컴퓨터가 있고 사람이 쉬지 않고 뛸 수 있다면 사람
그 이상의 거리라면 네트워크
```