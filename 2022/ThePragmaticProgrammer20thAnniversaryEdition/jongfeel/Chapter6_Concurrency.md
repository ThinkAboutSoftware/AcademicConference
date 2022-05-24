## 5 Bend, or Break

## Discussions

동시성 문제에 대해서는 스레드 처리에 대해 생각을 하게 하고, 또 레스토랑 종업원의 예제로 알기 쉽게 설명해 주고 있는 것 같습니다. 

저는 예전에 C++로 개발 할 때 그런 처리를 하기 위해 진짜 세마포어 같은 비슷한 방식으로 flag 값 같은 걸 두고 처리한 적은 있습니다. 그런데 지금은 시대가 많이 바뀌어서 C#의 경우는 Task라는 비동기 스케줄링 처리 방식도 있고 동시성 처리를 위한 join 이라는 메서드도 제공합니다. 심지어 병렬처리 프로그래밍도 할 수 있다 보니 시대가 많이 좋아진 것 같습니다.

**평소에 스레드 생성 및 처리, 그리고 동시성 처리에 대한 처리를 직접 해본 적이 있을까요? 뮤텍스, 세마포어를 구현한게 있다면 더 좋을 수도 있습니다!**

### Topic 33. Breaking Temporal Coupling

동시성을 확보해야 한다. 시간이나 순서에 의존하는 시간적 결합을 끊는 방법을 생각해 내야 한다. 그렇게 함으로써 유연성도 얻을 수 있고, 작업 흐름 분석과 아키텍처, 설계, 배포와 같은 개발의 여러 측면에서 시간과 관련된 의존성도 함께 줄일 수 있다.

#### LOOKING FOR CONCURRENCY

동시에 일어나도 되는 게 뭐고, 반드시 순서대로 일어나야 하는 건 어떤 것인지 확인이 필요하다. ‘활동 다이어 그램 activity diagram’ 같은 표기법을 사용해서 작업 흐름을 기록하는 것이 한 방법이다.

> Tip 56. Analyze Workflow to Improve Concurrency

활동 다이어그램을 사용하면 동시에 수행할 수 있는데도 아직 동시에 하고 있지 않은 활동들을 찾아내서 병렬성을 극대화할 수 있다.

#### OPPORTUNITIES FOR CONCURRENCY

시간이 걸리지만, 코드가 아닌 곳에서 시간이 걸리는 활동을 찾는다.데이터베이스를 조회할 때나 외부 서비스에 접근할 때, 사용자 입력을 기다릴 때 같이 우리 프로그램이 다른 작업이 끝나기를 기다려야 하는 상황에서 동시 작업을 진행한다.
동시성을 고려한 설계를 할때 찾아야 한다.

#### OPPORTUNITIES FOR PARALLELISM

동시성은 소프트웨어 동작 방식이고, 병렬성은 하드웨어가 하는 것이다.
컴퓨터 한 대에 있든 아니면 연결된 여러 대에 있든 우리에게 여러 개의 프로세서가 있다면, 그리고 작업을 프로세서들에게 나누어 줄 수 있다면 전체 소요 시간을 단축할 수 있다.

#### IDENTIFYING OPPORTUNITIES IS THE EASY PART

동시 작업이나 병렬 작업을 해서 이득을 볼 수 있는 부분을 어떻게 안전하게 구현할 수 있을까?

#### CHALLENGES

- How many tasks do you perform in parallel when you get ready for work in the morning? Could you express this in a UML activity diagram? Can you find some way to get ready more quickly by increasing concurrency?

```
답변)
혼자 출근하는거 말고 딸 유치원 등원 시키는 걸 생각해 보면 동시 작업이 진행된다.
아침 준비하는 것 까지는 동시성이 없는데
딸을 깨우고 밥을 먹이면서 머리 묶어 주는 것과 내 약 챙겨먹는 걸 동시에 한다
또 아침을 다 먹은 후에 양치질과 세수를 하는 때에 나도 양치질을 동시에 한다.
```

### Topic 34 Shared State Is Incorrect State

레스토랑 종업원의 동시성 문제, thread safe에 대한 설명을 일반적으로 묘사

> Tip 57 Shared State Is Incorrect State

#### NONATOMIC UPDATES

파이 조각을 가져오고 갱신하는 동작이 원자적 atomic 이지 않기 때문에 실제 값이 그사이에 바뀔 수 있다.
그렇다면 어떻게 원자적으로 바꿀 수 있을까?

##### Semaphores and Other Forms of Mutual Exclusion

세마포어(semaphore)는 단순히 한 번에 한 사람만이 가질 수 있는 무언가다.
세마포어를 만들어서 다른 리소스의 사용을 제어하는 데 쓸 수 있다.

##### Make the Resource Transactional

세마포어로 보호하고 리소스를 중앙에 집중시킨다

#### MULTIPLE RESOURCE TRANSACTIONS

리소스가 두 개 이상이라도 두 리소스를 다 처리하고 결과를 줄 수 있도록 만들어야 한다

#### NON-TRANSACTIONAL UPDATES

공유 메모리는 동시성 문제의 원인으로 많이 지목받는다.
하지만 사실 수정 가능한 리소스를 공유하는 애플리케이션 코드 어디에서나 동시성 문제가 발생할 수 있다. 코드의 인스턴스 둘 이상이 파일, 데이터베이스, 외부 서비스 등 어떤 리소스에 동시에 접근할 수 있다면 잠재적인 문제를 안고 있는 것이다.

> Tip 58 Random Failures Are Often Concurrency Issues

#### OTHER KINDS OF EXCLUSIVE ACCESS

상호 배제(mutual exclusion)를 의미하는 뮤텍스(mutex)라고 부르기도 하고, 모니터(monitor)나 세마포어라고 부르기도 한다. 모두 라이브러리로 제공 된다.

#### DOCTOR, IT HURTS...

그러면 그렇게 하지 마세요

> Doctor, it hurts when I do this.
Then don’t do that.

### Topic 35 Actors and Processes

- '액터'는 자신만의 비공개 지역 상태 state 를 가진 독립적인 가상 처리 장치(virtual processor)다.
- '프로세스'는 본래 더 일반적인 가상 처리기로, 보통 운영 체제가 동시성을 지원하기 위하여 구현한다.

#### ACTORS CAN ONLY BE CONCURRENT

액터를 관리하는 것이 하나도 없다.
시스템이 저장하는 상태는 오직 메시지 그리고 각 액터의 지역 상태뿐이다.
모든 메시지는 일방향이다. 답장이란 개념은 없다.
액터는 각 메시지를 끝날 때까지 처리하고 중간에 다른 일을 하지 않는다.

> Tip 59. Use Actors For Concurrency Without Shared State

#### A SIMPLE ACTOR

고객(customer), 종업원(waiter), 진열장(pie case)이렇게 세 가지 액터를 두고 동시성 예제에 대한 설명

#### NO EXPLICIT CONCURRENCY

액터 모델에서는 동시성을 다루는 코드를 쓸 필요가 없다. 공유된 상태가 없기 때문이다.

#### ERLANG SETS THE STAGE

얼랭은 액터를 '프로세스'라고 부르는데 일반적인 운영 체제의 프로세스와는 달리 액터에 더 가깝다.
얼랭 런타임은 프로세스의 생애 주기를 관리하는 '슈퍼비전(supervision)'시스템을 구현했다. 슈퍼비전 시스템의 슈퍼바이저는 문제가 발생하면 프로세스 하나 혹은 일련의 프로세스를 재시작 한다.

#### CHALLENGES

- Do you currently have code that uses mutual exclusion to protect shared data. Why not try a prototype of the same code written using actors?

```
답변)
mutual exclusion 을 일부러 구현한 곳은 없지만 
이번 챕터에서 알게된 액터 모델을 써보면 괜찮을 것 같다는 생각은 든다.
흡사 thread pool구현 같은 느낌이 있다
```

- The actor code for the diner only supports ordering slices of pie. Extend it to let customers order pie à la mode, with separate agents managing the pie slices and the scoops of ice cream. Arrange things so that it handles the situation where one or the other runs out.

```
답변)
구현을 해보면 좋겠다는 생각은 있다
```

### Topic 36. Blackboards

칠판은 일종의 '자유방임주의'적 동시성이다. 각 형사는 독립된 프로세스, 에이전트, 액터 등과 같다. 누군가는 칠판에 수집한 사실을 붙이고, 누군가는 떼어 낸다. 사실을 조합하거나 처리할 수도 있고 더 많은 정보를 덧붙일 수도 있다.
칠판은 사람들이 서서히 결론에 도달하도록 돕는다.

#### A BLACKBOARD IN ACTION

데이터의 도착 순서는 이제 상관 없다. 어떤 사실이 칠판에 올라가면 적절한 규칙이 발동되도록 하면 된다.
결과에 대한 피드백도 마찬가지로 쉽게 다룰 수 있다. 어떤 규칙에서 나온 것이든 그 결과를 다시 칠판에 올려서 다른 규칙들이 발동되도록 하면 된다.

> Tip 60. Use Blackboards to Coordinate Workflow

#### MESSAGING SYSTEMS CAN BE LIKE BLACKBOARDS

이벤트 로그의 형태로 영속 성을 제공하고, 패턴 매칭 형태로 메시지를 가져오는 것도 지원한다. 메시징 시스템을 칠판으로도 사용할 수 있고, 여러 액터를 실행하는 플랫폼으 로도 사용할 수 있다.

#### BUT IT’S NOT THAT SIMPLE...

아키텍처에서 액터와 칠판, 마이크로서비스를 활용하면 애플리케이션에서 생길 수 있는 모든 종류의 동시성 문제를 예방할 수 있을 것이다. 하지만 거기에는 비용이 따른다. 이런 접근 방식을 사용하면 많은 동작이 간접적으로 일어나므로 분석이 더 힘들다. 메시지 형식 및 API를 모아두는 중앙 저장소를 운영하면 도움이 될 것이다.

#### EXERCISES

##### Exercise 24

Would a blackboard-style system be appropriate for the following applications? Why, or why not?

Image processing. You’d like to have a number of parallel processes grab chunks of an image, process them, and put the completed chunk back.

```
답변) 이미지를 병렬로 처리해서 먼저 수신된 스트림 데이터가 있다면 먼저 낮은 해상도로 표시해주는 방식으로 하면 칠판 시스템이 유용할 수 있다
```

Group calendaring. You’ve got people scattered across the globe, in different time zones, and speaking different languages,
trying to schedule a meeting.

```
답변)
그룹 일정의 경우 칠판 시스템의 예시와 상당히 유사하다. 그리고 일정 공유가 될 때마다 일정 정보가 늘어나므로 나중에 일정 공유를 위해 칠판을 쓰는 사람은 직원들의 흥미로운 일정에 대해 알게 될 수 있을 것이다
```

Network monitoring tool. The system gathers performance statistics and collects trouble reports, which agents use to look for trouble in the system.

```
답변)
네트워크 모니터링 역시 칠판 시스템의 좋은 예제이다. 불규칙하고 중구난방인 네트워크 이벤트를 순서에 상관없이 한 곳에 수집하고 나중에 분류를 하고 보면 특정 네트워크 이벤트가 집중 발생되는 이상 상태를 빨리 찾아낼 수 있을 것이다
```