## CHAPTER 14 이벤트 기반 아키텍처 스타일

```
인상깊은 내용)
꽤 복잡도가 높아 보이고 비동기 이벤트 처리까지 해야 하는데도 불구하고 
도메인 기반이 아니라 기술 기반의 아키텍처라는 점에서 흥미로웠던 것 같습니다.
그런데 왠지 제가 선택해서 쓸 아키텍처는 아닐 것 같다는 느낌이 많이 들었네요.
```

이벤트 기반 아키텍처event-driven architecture는 확장성이 뛰어난 고성능 애플리케이션 개발에 널리 쓰이는 비동기 분산 아키텍처 스타일이다. 이벤트 기반 아키텍처에는 이벤트를 비동기 수신/처리하는 별도의 이벤트 처리 컴포넌트들로 구성된다.

요청 기반 모델request-based model을 기본으로 하는데 어떤 액션을 수행하도록 시스템에 요청하면 요청 오케스트레이터request orchestrator가 접수한다. 이 컴포넌트의 임무는 다양한 요청 프로세서에 확정적으로deterministically, 동기적으로synchronously 요청을 전달하는 일이다.

<img width="471" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/991c0afb-02e8-47b3-b8a2-8c2fd0e55803">

### 14.1 토폴로지

주요 토폴로지로 중재자 토폴로지mediator topology와 브로커 토폴로지broker topology이다.
중재자 토폴로지는 이벤트 처리 워크플로를 제어해야 할 경우에,
브로커 토폴로지는 신속한 응답과 동적인 이벤트 처리 제어가 필요할 때 사용한다.

### 14.2 브로커 토폴로지

메시지는 RabbitMQ, ActiveMQ, HornetQ등의 경량 메시지 브로커를 통해 브로드캐스팅되는 식으로 이벤트 프로세서 컴포넌트에 분산되어 흘러간다. 이벤트 처리 흐름이 단순하고 중앙에서 이벤트를 조정할 필요가 없을 때 유용하다.

네 가지 기본 아키텍처 컴포넌트로 구성된다.

- 시작 이벤트initialing event: 전체 이벤트 흐름을 개시하는 이벤트
- 이벤트 브로커: 단일 이벤트 프로세서를 받아 처리 작업을 한다.
- 이벤트 프로세서: 이벤트를 처리
- 처리 이벤트: 시스템의 나머지 부분에 작업 결과를 이벤트 브로커를 통해 비동기로 알린다.

<img width="474" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/c45691d9-cbd1-4257-8414-b6df6f15dc2b">

이벤트 브로커 컴포넌트는 도메인 기반으로 클러스터링 된 여러 인스턴스로 구성되며,
각 브로커는 도메인의 이벤트 흐름에 사용하는 이벤트 채널이 들어 있다.
브로커 토폴로지는 fire and forget 방식으로 비동기 브로드캐스팅을 하므로 토픽은 발행-구독 메시징 모델을 사용하는 브로커 토폴로지에서 사용한다.

브로커 토폴로지에서는 각 이벤트 프로세서가 자신이 한 일을 모두에게 알리는게 항상 바람직하다. 이렇게 해야 나중에 이벤트를 처리하는 과정에서 기능 추가가 필요하게 되더라도 아키텍처를 쉽게 확장할 수 있다.

<img width="472" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/7bae5ef1-e605-4cef-8acf-ea1cdbbea63c">

Figure 14-3 Notification event is sent but ignored

이 방식은 아키텍처 확장성architectural extensibility의 좋은 사례이다. 무시될 메시지를 보내는 것이 리소스 낭비일 수 있지만 어떤 이벤트의 정보는 토픽 안에 들어 있으므로 따로 인프라 구축이나 이벤트 프로세서를 변경하지 않아도 필요한 이벤트 프로세서를 추가만 하면 된다.

<img width="483" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/3cd12c64-6d54-4e87-9c33-a4699672f4a9">

이 예제는 모든 이벤트 프로세서가 고도로 분리되어 있고 서로 독립적으로 움직인다.
브로커 토폴로지는 릴레이 경주라고 보면 쉽게 이해할 수 있다. 이벤트 프로세서는 이벤트 전달 후 처리에 관여하지 않고 다른 시작 이벤트나 처리 이벤트에 반응할 준비를 한다. 또 각 이벤트 프로세서는 이벤트 처리 도중 가변적인 부하나 백업 조건을 처리하기 위해 서로 독립적으로 확장할 수 있다. 환경 문제로 이벤트 프로세서가 느려지거나 실패하면 그 프로세서가 구독하는 토픽이 배압back pressure 지점이 된다. 

브로커 토폴로지는 성능, 응답성, 확장성 측면에서 장점이 많지만 시작 이벤트와 연관된 전체 워크플로를 제어할 수가 없다. 상황에 따라 어느 파트가 트랜잭션을 완료했는지 추적하기가 어렵고 에러 처리도 어렵다. 비즈니스 트랜잭션을 관찰/통제하는 중재자가 없으므로 처리가 실패해도 다른 이벤트 프로세서는 그 사실을 알지 못한다. 이런 프로세스는 어느 순간 교착 상태에 빠지고 조치를 해 주지 않으면 프로세스가 정체된다.

비즈니스 트랜잭션을 재시작 하는 기능도 브로커 토폴로지에서 지원되지 않는다. 처음 시작 이벤트를 처리할 때 부터 다른 작업이 비동기로 수행되므로 이벤트를 다시 넣는 것은 불가능하다. 어느 컴포넌트도 상태를 서로 알 수 없고 원래 비즈니스 요청 상태를 갖고 있으므로 어디서부터 비즈니스 트랜잭션을 다시 시작해야 하는지 알 수가 없다.

|Advantages|Disadvantages|
|-------------|----------------|
|Highly decoupled event processors|Workflow control|
|High scalability|Error handling|
|High responsiveness|Recoverability|
|High performance|Restart capabilities|
|High fault tolerance|Data inconsistency|

Table 14-1. Trade-offs of the broker topology

### 14.3 중재자 토폴로지

중재자 토폴로지mediator topology는 브로커 토폴로지의 단점들을 일부 보완한다. 여러 이벤트 프로세서 간의 조정이 필요한 시작 이벤트에 대해 워크플로를 관리/제어하는 이벤트 중재자event mediator가 핵심이다.

중재자 토폴로지에서는 시작 이벤트를 큐를 거쳐 이벤트 중재자로 전달되는 차이점이 있다. 이벤트 중재자는 이벤트 처리에 관한 단계 정보만 갖고 있으므로 점대점 메시징으로 각각의 이벤트 채널로 전달되는 처리 이벤트를 생성한다. 각 이벤트 프로세서는 자신의 이벤트 채널에서 이벤트를 받아 처리한 다음 중재자에게 작업을 완료 했다고 응답한다. 브로커 토폴로지와 다르게 이벤트 프로세서가 다른 프로세서에게 자신이 한 일을 알리지 않는다.

<img width="478" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/9fdddea2-3143-4e36-a536-710ab7560fec">

중재자 토폴로지 구현체는 특정 도메인이나 이벤트 그룹과 연관된 중재자가 여럿 존재하므로 토폴로지의 단일 장애점single point of failure(SPF)을 줄이고 전체 처리량과 성능을 높일 수 있다.

간단한 에러 처리와 오케스트레이션이 필요한 이벤트는 아파치 카멜Apache Camel, 뮬Mule ESB, 스프링 인티그레이션Spring Integration등의 중재자로도 충분하다.

이벤트 워크플로에 조건부 처리가 많고 동적 경로가 많아 에러 처리가 복잡하다면 아파치 ODE나 오라클 BPEL 프로세스 관리자 같은 중재자가 낫다. 이런 중재자는 이벤트 처리 단계를 기술하는 BPELBusiness Process Execution Language을 기반으로 하며 에러 처리, 리다이렉션, 멀티 캐스팅 기능을 하는 요소들이 체계적으로 구현되어 있다.

BPEL은 복잡하고 동적인 워크플로에는 잘 맞지만, 이벤트 처리 단계 중 사람이 개입하는, 실행 시간이 긴 트랜잭션이 필요한 이벤트 워크플로에는 적합하지 않다. BPMBusiness Process Management 엔진은 이런 요구사항을 구현할 때 좋다.

이벤트 복잡도를 한 가지 기준으로 평가하는 경우는 거의 없으므로 알기 쉽게 단순함, 어려움, 복잡함 정도로 분류한 뒤 모든 이벤트가 항상 단순한 중재자를 거치도록 하는 것이 좋다. 중재자는 이벤트 등급에 따라 이벤트를 직접 처리하거나 더 복잡한 다른 이벤트 중재자에게 위임한다.

<img width="480" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/7dca4ec3-e2db-450a-8979-13fe1d327ef1">

단순한 중재자로 처리할 수 있는 경우에는 Simple Event Mediator가 처리 이벤트를 생성해서 전달하지만
어려움 또는 복잡함 등급으로 분류될 경우 원시작 이벤트를 BPEL 또는 BPM 같은 중재자로 바로 넘긴다.

<img width="478" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/49ccfceb-4b70-4dd8-8317-ebc76c1ec916">

2, 3, 4 단계의 처리 이벤트는 모두 동시에 발생하면서 단계별로 처리된다. 3단계는 4단계에서 배송 준비가 끝나 고객에게 알림을 보내기 전에 반드시 완료되어 확인응답acknowledgement을 받아야 한다.

시작 이벤트를 접수한 Customer 중재자는 create-order 처리 이벤트를 생성하고 메시지를 order-placement-queue로 보낸다. OrderPlacement 이벤트 프로세서는 이 이벤트를 받아 문제가 없는지 확인한 뒤 주문 ID와 함게 중재자에게 확인 응답한다.

<img width="468" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/50f361fc-8a15-4a9a-a217-da7266667f6d">

1단계가 완료하면 중재자는 2단계에서 email-customer, apply-payment, adjust-inventory를 동시에 만들어 각 지정된 큐로 전달한다. Notification, Payment, Inventory 세 이벤트 프로세서는 메시지를 처리하고 완료되면 중재자에게 알린다. 세 개의 병렬 프로세스로 부터 모두 응답을 받을 때 까지 대기하다가 한 곳에서 에러가 발생하면 중재자는 문제 해결을 위한 조치를 할 수 있다.

<img width="467" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/c1d6b076-507f-4a7c-b49c-36e5dfe3bdc9">

3단계는 fulfill-order, order-stock 두 이벤트를 동시에 발생시키고, OrderFulfillment, Warehouse 이벤트 프로세서는 두 이벤트를 받아 역시 처리 후 확인 응답을 한다.

<img width="468" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/f732b46f-7464-43a8-a25c-0ec58170c0eb">

4단계는 ship-order 이벤트와 더불어 다음에 해야 할 일인 배송 준비가 완료됨을 알리기 위해 email-customer 처리 이벤트도 함께 생성한다.

<img width="471" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/a32800a2-d3a4-4e87-9e3d-a1026782edde">

5단계는 email-customer 이벤트를 하나 더 생성해서 고객에게 주문이 배송됐음을 알린다.  워크플로는 완료되고 중재자는 시작 이벤트 흐름을 완료로 마킹한 뒤 시작 이벤트와 연관된 상태를 모두 삭제한다.

<img width="491" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/4cad4b9c-6828-49ea-8ced-be74859d914a">

중재자 컴포넌트는 워크플로에 잘 알고 있으므로 통제가 가능하다. 중재자는 워크플로를 제어하므로 이벤트 상태를 유지하면서 에러 처리, 복구, 재시작을 할 수 있다.

브로커와 중재자 두 도폴로지는 처리 이벤트의 의미와 사용 방법이 본질적으로 다르다.
브로커 토폴로지에서는 시스템에서 발생한 이벤트로서 처리 이벤트가 발행되고 이벤트 프로세서는 각자 맡은 일을 하면서 나머지 이벤트 프로세서는 그 액션에 반응하는 식으로 동작한다.
중재자 토폴로지에서는 처리 이벤트가 사건incident(이미 일어난 일)이 아니라 커맨드command(일어나야 할 일)이다. 따라서 중재자 토폴로지에서는 처리 이벤트가 반드시 처리되어야 할 이벤트인 커맨드인 반면, 브로커 토폴로지에서는 그냥 무시해도 된다.

브로커 토폴로지에서 불가능한 문제를 중재자 토폴로지가 해결할 수 있지만 부정적인 요소도 있다.

- 복잡한 이벤트 흐름 내에서 발생하는 동적인 처리를 선언적으로 모델링 하기가 어렵다. 그래서 중재자의 내부 워크플로는 일반적인 처리만 하고 복잡한 이벤트 처리는 중재자+브로커 형태의 하이브리드 모델로 처리한다.
- 이벤트 프로세서는 브로커 토폴로지와 동일한 방식으로 쉽게 확장할 수 있지만, 중재자도 함께 확장해야 하므로 전체 이벤트 처리 흐름에 병목 지점이 생긴다.
- 이벤트 처리를 중재자가 제어하므로 이벤트 프로세서가 상대적으로 더 많이 커플링 되어 성능이 좋지 않다.

|Advantages|Disadvantages|
|-------------|----------------|
|Workflow control|More coupling of event processors|
|Error handling|Lower scalability|
|Recoverability|Lower performance|
|Restart capabilities|Lower fault tolerance|
|Better data consistency|Modeling complex workflows|

Table 14-2. Trade-offs of the mediator topology

워크플로 제어와 에러 처리 기능이 우선인가,
아니면 고성능과 확장성이 더 중요한가의 트레이드오프를 잘 따져 선택해야 한다.

### 14.4 비동기 통신

이벤트 기반 아키텍처 스타일은 파이어 앤드 포겟 처리를 포함 기본적인 요청/응답 처리를 모두 비동기 통신을 사용한다.
비동기 통신은 시스템의 응답성을 전반적으로 높이는 강력한 기법으로 활용할 수 있다.

예제 그림처럼 메시지를 비동기 전송하면, 유저 입장에서는 소요 시간이 25ms가 걸린다. 실제 이벤트 컨슈머가 처리를 완료하려면 3000ms가 더 필요하지만 응답 대기를 할 필요가 없다는 관점에서는 이미 처리는 완료한 셈이 된다.

<img width="467" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/b792dd47-0007-4237-9a6f-7a09586edc57">

응답성responsiveness과 성능performance의 차이점을 보여주는 예이다. 유저가 어떤 정보를 받고 확인해야 할 필요가 없으면 기다리게 할 이유가 없기 때문이다. 응답성은 어떤 처리가 빠르게 될 것이라는 사실을 유저에게 알리는 것이고, 성능은 종단간 프로세스가 더 빨리 수행되게끔 만드는 것이다. 예시 그림은 동기나 비동기 처리를 하는데 전체 시간이 짧아지지 않았다는 점에서 시스템 성능이 아닌 전반적인 응답성을 개선한 것이다.

하지만 비동기 통신에서는 에러 처리가 큰 문제이다. 응답성은 개선되지만 에러를 제대로 처리하기가 쉽지 않기 때문에 이벤트 기반 시스템은 복잡도가 가중된다.

### 14.5 에러 처리

리액티브 아키텍처 워크플로 이벤트 패턴은 비동기 워크플로에서 에러 처리 문제를 해결하는 방법 중 하나이다.
시스템을 응답성에 영향을 미치지 않고 탄력적으로 에러를 처리할 수 있게 만드는 패턴이다.

<img width="482" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/a4424447-737c-403d-a4b7-a0c018ae9522">

이벤트 컨슈머가 데이터를 처리하는 도중 에러가 발생하면 워크플로 프로세서에게 위임하고 이벤트 큐에 있는 다음 메시지로 넘어간다. 이렇게 해서 에러가 발생해도 다음 메시지를 처리하는데 있어서 영향을 주지 않으므로 응답성을 살릴 수 있게 된다.

워크플로 프로세서는 사람이 수동으로 처리하는 것이 아니라 프로그래밍 방식으로 원데이터를 변경해서 조치한 후 원래 큐로 돌려보낸다. 사람이 개입하기 전까지 워크플로 프로세서가 메시지의 문제점을 파악할 수 없는 경우도 있다. 이럴 때는 메시지를 다른 큐로 보내서 대시보드dashboard라고 부르는 애플리케이션이 받는다. 여기서 부터 사람이 개입하고 업무 담당자가 직접 메시지를 확인해서 조치하고 원래 큐로 전송하는 일을 한다.

거래 자문가trading advisor가 다른 지역에 있는 대형 트레이딩펌trading firm을 대신해서 거래 주문을 받는 예제
이 자문자는 거래 주문을 바스켓이라는 단위로 묶어 일괄 처리 후 주식을 매수할 수 있도록 트레이딩펌의 브로커로 비동기 전송함.
더 자세한 예제의 워크플로는 책을 참고

예제의 전체적인 워크플로 이벤트 패턴의 에러 처리 그림은 아래 참고

<img width="477" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/622a1dad-0bfd-4145-be34-a41bd4ca4d96">

### 14.6 데이터 소실 방지

데이터 소실data loss이란, 메시지가 도중에 삭제 되거나 최종 목적지에 도달하지 못한 상태를 말한다.
이벤트 기반 아키텍처는 데이터가 소실될 여지가 많기 때문에 이걸 방지하는 기본적인 기술을 익힐 필요가 있다.

예로, 이벤트 프로세서 A가 큐에 메시지를 비동기 전송하고 이벤트 프로세서 B는 이 메시지를 받아 데이터베이스에 삽입한다고 하면 아래와 같은 데이터 소실이 일어날 수 있다. 데이터 소실이 가능한 지점에 대한 그림도 참고한다.

<img width="472" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/1750a533-924d-4fa3-935d-4247f3ceb643">

- 1 이벤트 프로세서 A에서 메시지가 큐로 전달되지 않는다. 전달되어도 이벤트 프로세서가 메시지를 가져오기 전에 브로커가 다운된다.
- 2 이벤트 프로세서 B가 큐에서 다음 메시지를 꺼내 이벤트를 처리하기 전에 장애가 발생한다.
- 3 데이터 에러로 인해 이벤트 프로세서 B가 데이터베이스에 메시지를 저장할 수 없다.

1번 이슈는 동기 전송synchronous send과 퍼시스턴트 메시지 큐를 이용하면 쉽게 해결된다.
퍼시스턴스 메시지 큐는 전달 보장guaranteed delivery도 지원한다. 이 방식은 메시지 브로커가 메시지를 수신하면 신속한 조회를 위해 메모리에 저장하는 동시에 물리적 데이터 저장소에도 메시지를 저장하는 것이다.

2번 이슈 역시 클라이언트 확인응답 모드client acknowledge mode라는 기본적인 메시징 기술을 이용하면 해결 가능하다.
메시지는 메시지큐에서 나오면 삭제되는데, 클라이언트 확인응답 모드는 메시지를 큐에 보관한 채 다른 컨슈머가 메시지를 읽을 수 없게 클라이언트 ID를 메시지에 부착한다. 이벤트 프로ㅔ서B가 잘못돼도 메시지는 큐에 남아 있으므로 데이터 소실을 방지할 수 있다.

3번 이슈는 데이터베이스 본연의 ACID 트랜잭션의 커밋으로 해결 가능하다. 최종 참여자 지원last participant support(LPS)를 활용하면 메시지 처리가 끝나 데이터베이스에 저장됐음을 확인한 이후에 큐에서 메시지가 삭제된다. 그러므로 이벤트 프로세서 A에서 데이터베이스로 가는 도중에 메시지가 소실될 일은 없다.

<img width="482" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/3085e36c-ec10-44da-95ca-db123485100a">

### 14.7 브로드캐스팅

이벤트 기반 아키텍처는 메시지를 누가 받든, 그 메시지로 무슨 일을 하든 상관없이 이벤트를 브로드캐스트broadcast 할 수 있다.

<img width="491" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/b64c348a-eb20-47d1-aafe-6d54e5c3561b">

메시지 프로듀서는 자신이 보낸 메시지를 어느 이벤트 프로세서가 수신할지, 또 메시지를 받아 무슨 일을 할지 모른다. 그래서 브로드캐스팅은 여러 이벤트 프로세서를 가장 높은 수준으로 디커플링하는 수단이며, 최종 일관성, 복잡한 이벤트 처리complex event processing(CEP)등 다양한 쓰임새를 지닌 필수 기능이다.

### 14.8 요청-응답

이벤트 기반 아키텍처는 동기 통신을 요청-응답 메시징request-response messaging(의사 동기 통신pseudosynchronous communication이라고도 하는) 방식으로 수행한다.

<img width="486" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/3e014d33-347a-465c-b84c-1f824859758a">

요청-응답 메시징을 구현하는 주요한 기술은 두 가지이다.
첫째 메시지 헤더에 상관correlation ID를 사용하는 것이다.
둘째 응답 큐에 임시 큐temporary queue를 두고 요청-응답 메시징을 구현하는 방법이다.

아래 그림은 각각 상관 ID를 이용한 방법과 임시 큐를 이용한 방법을 표현한다.

<img width="472" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/945d456c-e1ac-4013-8c38-bb67b2b9b696">

<img width="470" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/0cb6d3bd-e7a4-46c5-8582-846ddda6a2b7">

기술적으로는 임시 큐가 훨씬 단순하지만 메시지 브로커는 매번 요청을 할 때마다 임시 큐를 생성/폐기하는 일을 반복해야 한다. 따라서 대용량 메시지 처리 시 메시지 브로커의 속도가 크게 떨어지고 전체 성능과 응답성 역시 영향을 받는다.
그래서 대체로 상관 ID를 사용하는 방법을 권장한다.

### 14.9 요청 기반이냐, 이벤트 기반이냐

워크플로의 확정성과 제어가 중요하면 체계적인 데이터 기반의 요청에 특화된 요청 기반 모델을 사용한다.
복잡하고 동적인 유저 처리 등 주로 고도의 응답성과 확장성을 요하는 유연한 액션 단위의 이벤트를 처리한다면 이벤트 기반 모델이 좋은 선택이다.

아래 표는 이벤트 기반 모델의 장단점을 정리한 표이다.

|Advantages over request-based | Trade-offs|
|----------------------------------- | ----------- |
|Better response to dynamic user content | Only supports eventual consistency|
|Better scalability and elasticity | Less control over processing flow |
|Better agility and change management | Less certainty over outcome of event flow |
|Better adaptability and extensibility | Difficult to test and debug |
|Better responsiveness and performance| |
|Better real-time decision making| |
|Better reaction to situational awareness| |

### 14.10 하이브리드 이벤트 기반 아키텍처

이벤트 기반 아키텍처를 마이크로서비스, 공간 기반 아키텍처를 통해 다른 아키텍처 스타일의 일부로 활용한다.

어떤 아키텍처 스타일이든 다 이벤트 기반 아키텍처를 추가하면 병목 지점을 제거하고 이벤트 요청을 백업하는 배압 지점back pressure point을 확보하는 데 유용하며, 다른 아키텍처 스타일에서는 찾아볼 수 없는 유저의 응답성이 보장된다. 

### 14.11 아키텍처 특성 등급

<img width="473" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/46e7f969-7a22-4af1-a367-d707a521d203">

이벤트 기반 아키텍처는 특정 도메인이 여러 이벤트 프로세서에 분산되어 있고 중재자, 큐, 토픽을 통해 서로 묶여 있는 기술 반할된 아키텍처이다. 이벤트 기반 아키텍처는 도메인 분할 아키텍처는 아니다.

이벤트 기반 아키텍처는 각 이벤트 프로세서의 데이터베이스 상호작용 및 요청-응답 처리를 기반으로 하므로 퀀텀 수는 1개 이상 가능하다.

이벤트 기반 아키텍처는 성능, 확장성, 내고장성에 별점 5개이다.이 세 특성은 이 아키텍처 스타일의 주요 강점이기도 하다. 이벤트 프로세서는 프로그래밍 방식의 로드 밸런싱이 가능하며 확장성이 매우 뛰어나다.