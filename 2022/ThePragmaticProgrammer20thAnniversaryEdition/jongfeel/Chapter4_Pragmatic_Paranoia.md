## 4 Pragmatic Paranoia

## Discussions

Topic 26에 리소스 관리 부분은 매우 C나 C++의 메모리 관리 기법을 떠올리게 하는 것 같습니다.
제가 나름 옛날 개발자여서 메모리 관리, 할당, 해제를 해야 하는 프로그래밍 언어를 사용하면서 배우고 익히다 보니 자연스럽게 프로그래머가 해야 할 어떤 의무 같은 것이라고 여기고 배웠었는데요.

현대 언어들은 그런 고민을 하지 않아도 된다고 생각하는데, 이 책이 고전이다 보니 이런 주제가 올라온거라 생각합니다.

**각자 컴퓨터 자원의 관리, 할당, 해제를 프로그래머가 컨트롤 하는게 맞는 방향이라고 생각하시는지 얘기를 해보면 재미있을 것 같습니다.**

저는 다시 말씀드리지만, 옛날 부터 그렇게 배워 와서 그게 당연하다고 생각하고 있습니다.
그러니까 C#, JavaScript로 개발을 하더라도 메모리 할당, 해제를 어느 정도 생각하면서 코딩을 한다는 뜻이기도 합니다.

추가)
DBC에 대한 챕터를 정독해도 잘 와닿지 않는데, 다들 이해가 되셨나 모르겠네요?
저도 나름 개발 경력이 있는데 DBC 부분에서 좀 많이 찾아보고 뭔지 알아봤던 것 같습니다.

---

> Tip 36 You Can’t Write Perfect Software

완벽한 소프트웨어는 존재하지 않는다.
어느 누구도 완벽한 소프트웨어를 만들지 못했다.

**실용주의 프로그래머는 자기 자신 역시 믿지 않는다.**

### Topic 23 Design by Contract

#### DBC

Design By Contract
정확한 프로그램: 자신이 하는 일이라고 주장하는 것보다 많지도 적지도 않게 딱 그만큼만 하는 프로그램.

- precondition (선행 조건)
  - 루틴이 호출되기 위해 참이어야 하는 것. 즉, 루틴의 요구사항
- postcondition (후행 조건)
  - 루친이 자기가 할 것이라고 보장하는 것. 즉, 루틴이 완료되었을 때 세상의 상태
- class invariant (클래스 불변식)
  - 호출자의 입장에서 볼 때 이 조건이 언제나 참인 것을 클래스가 보장한다.

> Tip 37 Design with Contracts

##### Class Invariants and Functional Languages

에펠이 객체 지향 언어여서 '클래스 불변식'이라는 이름을 지었을 뿐, 진짜로 의미하는 것은 상태(state)이다.

#### IMPLEMENTING DBC

유효한 입력 범위
경계 조건
루틴이 뭘 전달하는지에 대한 약속
무엇을 약속하지 않는지
등에 대한 내용

DBC는 결국 **설계** 기법

##### Assertions

DBC의 가정을 문서화하면 좋지만, 컴파일러가 계약을 검사하도록 하면 좋다.
몇몇 언어에서는 조건문을 실행 시점에 확인하는 '단정문'을 사용해서 부분적으로 흉내내기가 가능하다.

#### DBC AND CRASHING EARLY

단정문이나 DBC 방식을 사용하여 선행 조건과 후행 조건, 불변식을 검증하면 더 일찍 멈추고, 문제에 대한 보다 정확한 정보를 알려줄 수 있다.

#### SEMANTIC INVARIANTS (의미론적 불변식)

절대 어겨서는 안 되는 요구사항을 표현할 수 있음
의미론적 불변식은 무언가가 품은 진짜 의미의 중심이 되어야 하며, 훨씬 역동적으로 변하는 비즈니스 규칙처럼 일시적인 정책에 영향을 받으면 안된다.

#### DYNAMIC CONTRACTS AND AGENTS

자율 에이전트의 무대에서는, 에이전트 자신이 따르길 원치 않는 요구를 **거절**할 자유가 있다. 계약을 재협상할 자유도 있다.
수동으로 계약을 만들 수 없다면 자동화는 불가능하다.
소프트웨어를 설계하게 되면 계약 역시 설계하도록 하자.


#### CHALLENGES

Points to ponder: If DBC is so powerful, why isn’t it used more widely? Is it hard to come up with the contract? Does it make you
think about issues you’d rather ignore for now? Does it force you to THINK!? Clearly, this is a dangerous tool!

```
답변)
사실 DBC 자체에 대한 이해도 어려운데 이 챕터에서 설명하고자 하는 바가 무엇인지도 어려운 것 같다.
질문도 think가 무엇인지 고민하게 만드는 질문인데, 쉽게 대답할 수가 없다.
```

#### EXERCISES

##### Exercise 14

Design an interface to a kitchen blender. It will eventually be a web-based, IoT-enabled blender, but for now we just need the
interface to control it. It has ten speed settings (0 means off). You can’t operate it empty, and you can change the speed only
one unit at a time (that is, from 0 to 1, and from 1 to 2, not from 0 to 2).
Here are the methods. Add appropriate pre- and postconditions and an invariant.

int getSpeed()
void setSpeed(int x)
boolean isFull()
void fill()
void empty()

```
답변)
선행조건1

- getSpeed()를 호출해서 속도를 알아야 한다.
- setSpeed()를 호출할 떄 getSpeed()에서 얻은 속도에서 +1 혹은 -1에 해당하는 값을 넣어야 한다.

선행조건2

- isFull()을 호출해서 속도 최대치를 알아낸다.
- 만약 true라면 속도 +1을 할 수가 없다.

후행조건1

- setSpeed()를 호출해서 설정한 속도 값과 getSpeed()를 호출한 값이 동일해야 한다. 

```

##### Exercise 15

How many numbers are in the series 0, 5, 10, 15, ..., 100?

```
답변)
5, 10
15, 20
...

이런 식으로 수를 세고 마지막에 0이 있는 걸 생각해서 21개가 있다는 답변을 쉽게 낼 수 있다.
```

### Topic 24 Dead Programs Tell No Lies

'있을 수 없는 일'이 발생했을 때 우리는 그 사실을 알아야 한다.

데이터가 우리가 생각하는 대로인지, 서비스에서 작동하는 코드가 우리가 생각하는 그 코드인지 확인해야 한다.


#### CATCH AND RELEASE IS FOR FISH

메서드의 예외 처리를 장황하게 하기 보다는 메서드 자체를 간단하게 호출하게 만든다
오류 코드 사이에 묻히지 않게 하고 결합도를 낮추는 코드를 작성한다

> Tip 38 Crash Early

#### CRASH, DON’T TRASH

일반적으로 죽은 프로그램이 끼치는 피해는 이상한 상태의 프로그램이 끼치는 피해보다 훨씬 적은 법이다.

### Topic 25 Assertive Programming

그런 일은 절대 일어날 리 없어
이런 식으로 자신을 기만하지 말자, 특히 코딩할 때는

> Tip 39 Use Assertions to Prevent the Impossible

'하지만 물론 그런 일은 절대 일어나지 않을 거야.' 라는 생각이 든다면 그런 일을 확인하는 코드인 단정문(assertion)을 사용한다

#### ASSERTIONS AND SIDE EFFECTS

부작용이 발생할 수 있는 코드 작성은 금지

#### LEAVE ASSERTIONS TURNED ON

성능 문제가 있다 하더라도 정말 문제가 되는 단정문만 끄도록 하자.

#### EXERCISE

##### Exercise 16

A quick reality check. Which of these “impossible” things can happen?

1. A month with fewer than 28 days
2. Error code from a system call: can’t access the current directory
3. In C++: a = 2; b = 3; but (a + b) does not equal 5
4. A triangle with an interior angle sum ≠ 180°
5. A minute that doesn’t have 60 seconds
6. (a + 1) <= a

```
답변)
2, 3, 6번

문제 의도를 파악해 봤을 때 모두 불가능할 것 같지만 실제로 일어날 것 같은 내용들이다.
하지만 내가 빠르게 훑어 봤을 때 바로 나온 답은 2, 3, 6번이다.

2번
이건 directory 관련 read, write 함수 호출해 본 사람이면 아주 빈번하게 일어나는 일이다

3번
C++이라고 했으니까 a와 b가 int, float 인지 모르고 더 나아가서 포인터 변수인지도 모를 일이라서 a + b는 5가 아닌 일은 충분히 일어날 수 있다

6번
역시 a의 자료형이 정의되지 않았으므로 + 1을 한다 한들 자연스럽게 a 보다 작다는 추측을 할 수 없다.
a가 string 형이면 6번의 수식은 아무 의미가 없다.
```

### Topic 26 How to Balance Resources

개발자 마다 리소스 관리는 일관되지 않다. 그래서 Tip 40이 중요하다.

> Tip 40 Finish What You Start (자신이 시작한 것은 자신이 끝내라)

"자신이 시작한 것은 자신이 끝내라." 팁이 가르쳐 주는 것은 잇아적으로 말해서 리소스를 할당하는 루틴이 해제 역시 책임져야 한다는 것이다.

현대 언어는 리소스의 유효 범위를 블록 으로 감싸서 지정할 수 있다.
이렇게 하면 파일을 닫고 리소스를 해제하는 것을 기억할 필요가 없다.
잘 모르겠을 땐 언제나 스코프를 줄이는 편이 낫다.

> Tip 41 Act Locally

#### NEST ALLOCATIONS

- 리소스를 할당한 순서의 역순으로 해제하라
- 코드의 여러 곳에서 동일한 구성으 ㅣ리소스들을 할당하는 경우에는 언제나 같은 순서로 할당해야 교착(deadlock) 가능성을 줄일 수 있다.

#### OBJECTS AND EXCEPTIONS

객체 지향 클래스의 생성자(constructor)와 소멸자(destructor)를 연상.
이런 방식으로 한다면 리소스를 클래스 안에 캡슐화하는 것이 유용하다.
리소스가 필요할 때 객체를 생성하고, 가비지 컬랙터가 객체를 수거해 할 때 소멸자가 호출하므로 리소스를 해제한다.

#### BALANCING AND EXCEPTIONS

예외 처리시 리소스 해제

1. 변수 스코프 사용
2. try-catch에서 finally 사용

##### An Exception Antipattern

예외가 발생하면 할당된 적이 없는 리소스를 해제려는 코드, 잘못됨
```
begin
    thing = allocate_resource()
    process(thing)
finally
    deallocate(thing)
end
```

올바른 방식
```
thing = allocate_resource()
begin
    process(thing)
finally
    deallocate(thing)
end
```

#### WHEN YOU CAN’T BALANCE RESOURCES

동적인 자료 구조를 사용하는 프로그램에서 발생하는 일.

- 최상위 구조가 자기 안에 들어 있는 하위 구조들을 해제할 책임을 진다.
- 최상위 구조가 그냥 할당 해제된다.
- 최상위 구조가 하나라도 하위 구조를 가지고 있으면 자신의 할당 해제를 거부한다.

어떤 선택을 하던 일관성 있게 구현하는게 중요함.

#### CHECKING THE BALANCE

Wrapper나 특정 도구를 사용해서 리소스 할당, 해제, 누수 등을 점검한다.

#### CHALLENGES

Although there are no guaranteed ways of ensuring that you always free resources, certain design techniques, when applied
consistently, will help. In the text we discussed how establishing a semantic invariant for major data structures could direct memory deallocation decisions. Consider how < Topic 23, Design by Contract >, could help refine this idea.

```
답변)
메모리 생성과 해제에 대한 제약 조건등을 걸어 놓고 
생성과 해제에 대한 일관성 있는 규칙을 정한다면 가능할 것 같다.
```

#### EXERCISES

##### Exercise 17

Some C and C++ developers make a point of setting a pointer to NULL after they deallocate the memory it references. Why is this a good idea?

```
답변)
포인터가 가리키는 메모리를 해제 한 이후에는 정상적인 값이 아닌 쓰레기 값,
즉 불필요한 값이 들어 있으므로 NULL로 할당해서 일관성을 유지한다
C나 C++ 에서 NULL은 0으로 define 되어 있다.
```

##### Exercise 18

Some Java developers make a point of setting an object variable to NULL after they have finished using the object. Why is this a
good idea?

```
답변)
Java는 메모리를 직접 해제할 수 없으므로 메모리를 가리키는 reference 변수에 null을 할당함으로써
언젠가 동작할 GC(Garbage collector)가 메모리를 해제 시키기 위한 방법으로 사용한다.
```

### Topic 27 Don’t Outrun Your Headlights

소프트웨어 개발에서도 우리의 '헤드라이트'는 제한되어 있다.
너무 먼 미래는 내다볼 수 없고, 정면에서 벗어난 곳일수록 더 어둡다.
그래서 Tip 42와 같은 확고한 규칙이 있다.

> Tip 42 Take Small Steps. Always

더 진행하기 전에 피드백을 확인하고 조정하라.
피드백의 빈도를 여러분의 제한 속도라고 생각하라.

불확실한 미래에 대비한 설계를 하느라 진을 빼는 대신 언제나 교체 가능한 코드를 작성하여 대비하자.
코드를 교체할 수 있도록 하면 응집도나 결합도, DRY에도 도움이 되고, 전반적으로 더 나은 설계가 탄생할 것이다.

```
의견)
여기서도 직접적으로 애자일 스크럼 방식의 점진적인 개발 방법에 대해 언급하지 않았지만
그런 의미로 설명하고 있는 부분이 맞다고 여겨진다.
```

#### BLACK SWANS

나심 니콜라스 탈레브의 책 블랙 스완에서
역사상 중대한 사건은 모두 다 세간의 이목을 끌고, 예측하기 어렵고, 드문 사건들로부터 발생하는데,
이 사건들은 일반적 예상의 영역을 넘어서는 것이라고 상정했다.

데스크톱 GUI의 승자는 모티프나 오픈룩이 아닌 웹이었다.

> Tip 43 Avoid Fortune-Telling