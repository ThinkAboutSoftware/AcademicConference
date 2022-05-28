## 5 Bend, or Break

## Discussions

Topic 31에 상속세라는 내용이 있는데요, 저는 실용주의 프로그래머에서 OOP에 대해 언급을 조금 하는 것도 아쉽긴 하지만 그래도 OOP에서 발생하는 문제에 대해서 먼저 얘기해 주는 것도 좋다고 생각합니다. 보통은 상속은 OOP의 특성이라고 먼저 설명하지 잘못됐다고 설명하지는 않으니까요.

어쨌든, 논의할 내용은 책의 내용과 달리 **상속에 대해 평소에 어떻게 생각하는지? 그리고 실제 많이 사용하는지?** 입니다.

저는 물론 많은 경험을 통해 상속을 잘 쓰지 않기도 하고 인터페이스 사용을 더 즐기다 보니 과도한 상속은 안하는 편이긴 합니다. 물론 OOP 관련 책에서도 상속의 문제에 대해 많이 언급을 하고 역시 인터페이스 사용을 권하기도 하죠.

### Topic 28 Decoupling

소프트웨어의 구조는 유연해야 한다. 각각의 부품이 다른 부품에 가능한 한 조금만 연결 되어야 한다.

> Tip 44 Decoupled Code Is Easier to Change

- Train wrecks—chains of method calls
- Globalization—the dangers of static things
- Inheritance—why subclassing is dangerous

#### Train wreck

``` java
public void applyDiscount(customer, order_id, discount) {
    totals = customer .orders .find(order_id) .getTotals();
    totals.grandTotal = totals.grandTotal - discount;
    totals.discount = discount;
}
```

> Tip 45 Tell, Don't Ask, TDA

##### Law of Demeter

LoD는 어떤 클래스 C에 정의된 메서드가 다음 목록에 속하는 것만 사용할수 있다고 제한한다.

- Other instance methods in C
- Its parameters
- Methods in objects that it creates, both on the stack and in the heap
- Global variables

> Tip 46 Don’t Chain Method Calls

무언가에 접근할 때 "."을 딱 하나만 쓰려고 노력해 보라. '무언가에 접근'한다는 건 중간 변수를 사용하는 경우까지 포함해야한다.

##### Chains and Pipelines

파이프라인은 함수에서 함수로 데이 터를 넘겨 가며 데이터를 변환한다. 이런 파이프라인은 메서드 호출로 이루어진 열차 사고와는 다르다. 숨겨진 구현 세부 사항에 의존하지 않기 때문이다.

#### THE EVILS OF GLOBALIZATION

코드를 재사용할 수 있게 하려면 깨끗한 인터페이스를 만들고 나머지 코드와의 결합을 없애야 한다.
전역 데이터를 쓰는 코드에 단위 테스트를 만들다 보면 이런 문제를 발견하게 된다. 그저 테스트를 실행하려는 것뿐인데 전역 환경을 생성하는 코드를 한참이나 써야 한다.

```
의견 및 경험담)
내가 진행했던 unity 기반의 제품 코드에 이런 경우가 꽤 많았다.
책에 설명한 대로 나는 메서드 하나만 테스트 하고 싶었을 뿐인데
그 안에서 참조하는 싱글턴 객체 두 개에 대한 상태를 미리 세팅해 두지 않으면 메서드의 결과를 보장할 수가 없었다.
즉 side effect가 발생하는 부분이 있어서, 문제의 그 부분을 뜯어(?) 고쳤다.
```

> Tip 47 Avoid Global Data

##### Global Data Includes Singletons

외부로 노출된 인스턴스 변수가 잔뜩 있는 싱글턴은 여전히 전역 데이터이다.

##### Global Data Includes External Resources

> Tip 48 If It’s Important Enough to Be Global, Wrap It in an API

#### INHERITANCE ADDS COUPLING

See topic 31 Inheritance Tax.

#### AGAIN, IT’S ALL ABOUT CHANGE

직접적으로 아는 것만 다루는 부끄럼쟁이 코드를 계속 유지하라. 그러면 애플리케이션의 결합도를 낮게 유지할 수 있을 것이고, 결과적으로 코드를 바꾸기 쉬워질 것이다.

### Topic 29 Juggling the Real World

#### EVENTS

다음 네 가지 전략에 의해 이벤트에 잘 반응하는 어플리케이션을 만들 수 있다

#### FINITE STATE MACHINES

##### The Anatomy of a Pragmatic FSM

기본적으로 상태 기계는 이벤트를 어떻게 처리할지 정의한 명세일 뿐이다.
정해진 상태들이 있고 그중 하나가 ‘현재 상태’다. 상태마다 그 상태일 때 의미가 있는 이벤트들을 나열하고, 이벤트별로 시스템의 다음 ‘현재 상태’를 정의한다.

##### Adding Actions

특정한 상태 이행이 일어날 때 수행하는 행동 action 을 추가 하여 FSM을 더 강력하게 만들 수 있다.

##### State Machines Are a Start

#### THE OBSERVER PATTERN

어떤 상호 작용이 일어났다는 것을 애플리케이션에 콜백으로 알려주는 방식을 사용한다.

#### PUBLISH/SUBSCRIBE

감시자 패턴을 일반화한 것이다. 동시에 감시자 모델의 결합도를 높이는 문제와 성능 문제도 해결한다.

#### REACTIVE PROGRAMMING, STREAMS, AND EVENTS

스트림은 이벤트를 일반적인 자료 구조처럼 다룰 수 있게 해 준다

##### Streams of Events Are Asynchronous Collections

이벤트 스트림은 동기적 처리와 비동기적 처리를 하나의 편리한 공통 API로 감싸서 통합한다.

#### EVENTS ARE UBIQUITOUS

이벤트가 어디서 발생하든 이벤트를 중심으로 공들여 만든 코드는 일직선으로 수행되는 코드보다 더 잘반응하고 결합도가 더 낮다.

#### EXERCISES

##### Exercise 19

In the FSM section we mentioned that you could move the generic state machine implementation into its own class. That
class would probably be initialized by passing in a table of transitions and an initial state.

Try implementing the string extractor that way.

##### Exercise 20

Which of these technologies (perhaps in combination) would be a good fit for the following situations:

- If you receive three network interface down events within five minutes, notify the operations staff.
- If it is after sunset, and there is motion detected at the bottom of the stairs followed by motion detected at the top of the stairs, turn on the upstairs lights.
- You want to notify various reporting systems that an order was completed.
- In order to determine whether a customer qualifies for a car loan, the application needs to send requests to three backend services and wait for the responses.

### Topic 30 Transforming Programming

코드에만 집중하면 핵심을 놓칠 수 있다고 본다. 프로그램이란 입력을 출력으로 바꾸는 것이라는 사고방식으로 돌아갈 필요가 있다. 이렇게 생각하면 그동안 고민하던 많은 세부 사항이 모두 사라진다.

...
의견)
처음에 나온 명언이 너무 좋아서 적어본다
...

자신이 하고 있는 걸 하나의 과정으로 서술할 수 없다면, 자기가 뭘 하고 있는지 모르는 것이다.
- W. 에드워즈 데밍(W. Edwards Deming)

> Tip 49 Programming Is About Code, But Programs Are About Data

#### FINDING TRANSFORMATIONS

구 사항에서 입력과 출력이 무엇인지 찾으면 전체 프로그램을 나타내는 함수가 정해진다. 이제 입력을 출력으로 바꿔 가는 단계들을 찾으면 된다.

##### Transformations All the Way Down

##### What’s with the |> Operator?

파이프라인을 사용하면 자동으로 데이터 변환의 관점에서 생각하게 된다.
|> 를 볼 때마다 데이터가 한 변환에서 다음 변환으로 흘러가는 것을 실제로 보는 셈이다.

##### Keep on Transforming...

단계2, 부분 집합을 특성값으로 단순 변환
단계3, 특성값 리스트를 특성값별로 단어 리스트를 얻는다.
단계4, 단어를 길이별로 분류

##### Putting It All Together

```
def anagrams_in(word) do
    word
    |> all_subsets_longer_than_three_characters()
    |> as_unique_signatures()
    |> find_in_dictionary()
    |> group_by_length()
end
```

#### WHY IS THIS SO GREAT?

각각은 앞의 변환에서 입력을 받아 처리한 결과를 다음 변환으로 넘겨준다. 이보다 글처럼 읽기 쉬운 코드는 만들기 어려울 것이다.

> Tip 50 Don’t Hoard State; Pass It Around

데이터를 거대한 강으로, 흐름으로 생각하라. 데이터는 기능과 동등해진다. 파이프라인은 코드 → 데이터 → 코드 → 데이터……의 연속이다.

#### WHAT ABOUT ERROR HANDLING?

코드 작성 방식은 기본적으로 크게 두 가지로 나뉜다. 오류 검사를 변환 안에서 하는 방식과 변환 바깥에서 하는 방식이다.

##### First, Choose a Representation

값과 오류 여부를 담고 있는 자료 구조인 래퍼를 어떻게 표현할지 정해야 한다.

함수에서 {:ok, 값} 또는 {:error, 원인} 튜플 tuple 을 반환한다

##### Then Handle It Inside Each Transformation

파이프라인 어디서든 오류가 발생하면 그 오류가 파이프라인 전체의 값이 된다.

##### Or Handle It in the Pipeline

파이프라인에서 함수를 직접 호출하지 말고 값 형태로 바꾸어서 변환 함수의 구현을 간단하게 만든다.

#### TRANSFORMATIONS TRANSFORM PROGRAMMING

코드를 일련의 (중첩된) 변환으로 생각하는 접근 방식은 프로그래밍을 해방시킨다.
익숙해지는 데는 시간이 좀 걸리지만, 일단 습관을 들이면 코드가 더 명확해지고, 함수는 짧아지며, 설계는 단순해진다.

#### EXERCISES

##### Exercise 21

Can you express the following requirements as a top-level transformation? That is, for each, identify the input and the output.

1. Shipping and sales tax are added to an order
2. Your application loads configuration information from a named file
3. Someone logs in to a web application

##### Exercise 22

You’ve identified the need to validate and convert an input field from a string into an integer between 18 and 150. The overall transformation is described by

```
field contents as string
    -> [validate & convert]
        -> {:ok, value} | {:error, reason}
```

Write the individual transformations that make up validate & convert.

##### Exercise 23

In Language X Doesn’t Have Pipelines we wrote:

```
const content = File.read(file_name);
const lines = find_matching_lines(content, pattern)
const result = truncate_lines(lines)
```

Many people write OO code by chaining together method calls, and might be tempted to write this as something like:

```
const result = content_of(file_name)
.find_matching_lines(pattern)
.truncate_lines()
```

What’s the difference between these two pieces of code? Which do you think we prefer?

```
답변)
첫번째는 메서드의 반환 값이 다른 메서드의 파라미터가 되는 방식이다.
이렇게 하면 중간에 필요가 없다고 생각하는 변수를 선언하고 파라미터로 넘겨야 하는 코드를 작성해야 한다.
두번째는 메서드의 결과를 가지고 바로 메서드를 호출하는 메서드 체이닝 방식이다.
이런 방식은 메서드의 결과로 다른 메서드를 호출하는 것으로 익숙해지면 읽는데는 문제가 없다.
하지만 메서드의 호출 방식을 숙지하지 않으면 쉽게 읽기는 어려울 것이다.
아니면 읽기는 쉬워도 실제 구현이 어려울 수도 있다.

어쨌든 저자는 첫번째 방식을 선호할 것이고
두번째 방식은 train wreck이라고 할 것이라서 답은 첫번째이겠지만
나는 개인적으로 두 번째 방식을 선호하는 편이다.
```

### Topic 31 Inheritance Tax

#### SOME BACKGROUND

Simula67, small talk에서 상속에 대한 개념 사용

타입을 조합하는 시뮬라 방식: C++, 자바 언어가 계승
동작을 다양하게 구성 하는 스몰토크 방식: 루비나 자바스크립트 같은 언어

#### PROBLEMS USING INHERITANCE TO SHARE CODE

부모 클래스가 바뀌면 상속받은 클래스에 결함이 많이 생김

##### Problems Using Inheritance to Build Types

다중 상속의 문제, 이제 다중 상속은 없지만 정확하게 도메인을 모델링 할 수는 없다

> Tip 51 Don’t Pay Inheritance Tax

#### THE ALTERNATIVES ARE BETTER

##### Interfaces and Protocols

인터페이스를 사용하자, 그러면 상속 없이도 다형성을 가져다 준다

> Tip 52 Prefer Interfaces to Express Polymorphism

##### Delegation

Has-a 관계를 사용해서 클래스 내부 변수에 위임해서 처리 

> Tip 53 Delegate to Services: Has-A Trumps Is-A

별도의 비지니스 로직을 담당하는 클래스를 만들면 결함이 줄어든다

##### Mixins, Traits, Categories, Protocol Extensions, ...

필요한 메서드만 사용하는 방식으로 믹스인을 쓰자

> Tip 54 Use Mixins to Share Functionality

#### INHERITANCE IS RARELY THE ANSWER

- Interfaces and protocols
- Delegation
- Mixins and traits

의도를 가장 잘 드러내는 기법을 사용하는 것이어야 한다.

#### CHALLENGES

The next time you find yourself subclassing, take a minute to examine the options. Can you achieve what you want with interfaces, delegation, and/or mixins? Can you reduce coupling by doing so?

```
의견)
다양한 책을 읽고 구현에 대한 경험을 해본 바로는
인터페이스로 충분히 구현 가능하다
결함이 줄었다는 느낌은 크게 없지만 불필요한 기능의 구현이 줄어드는 효과는 확실히 있다
```

### Topic 32 Configuration

> Tip 55 Parameterize Your App Using External Configuration

- Credentials for external services (database, third party APIs, and so on)
- Logging levels and destinations
- Port, IP address, machine, and cluster names the app uses
- Environment-specific validation parameters
- Externally set parameters, such as tax rates
- Site-specific formatting details
- License keys

#### STATIC CONFIGURATION

설정 정보를 (얇은) API 뒤로 숨겨라. 그러면 설정을 표현하는 세부 사항으로부터 코드를 떼어 놓을 수 있다.

#### CONFIGURATION-AS-A-SERVICE

어떤 형태를 사용하든지 애플리케이션을 실행시켰을 때 설정 정보가 애플 리케이션의 동작을 제어해야 한다. 설정 정보를 바꾸기 위해 코드 빌드가 필요해서는 안 된다.

#### DON’T WRITE DODO-CODE

환경에 적응하지 못하는 생물은 멸종한다
외부 설정을 사용하지 않는다면 적응성과 유연성을 포기해야 한다