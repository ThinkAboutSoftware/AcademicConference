# 07 함께 모으기

> 코드와 모델을 밀접하게 연관시키는 것은 코드에 의미를 부여하고 모델을 적절하게 한다. - 에릭 에반스(Eric Evans)

- 개념 관점(Conceptual Perspective)에서 설계는 도메인 안에 존재하는 개념과 개념들 사이의 관계를 표현한다.

- 실제 도메인의 규칙과 제약을 최대한 유사하게 반영하는 것이 핵심이다.

- 명세 관점(Specification Perspective)는 사용자의 영역인 도메인을 벗어나 개발자의 영역인 소프트웨어로 초점이 옮겨진다.

> 구현이 아니라 인터페이스에 대해 프로그래밍하라.

- 구현 관점(Implementation Perspective)은 프로그래머인 우리에게 가장 익숙한 관점으로 실제 작업을 수행하는 코드와 연관돼 있다.

- 객체의 책임을 '어떻게' 수행할 것인가에 초점을 맞추며 인터페이스를 구현하는 데 필요한 속성과 메서드를 클래스에 추가한다.

- 클래스가 은유하는 개념은 도메인 관점을, 클래스의 공용 인터페이스는 명세 관점을 그리고 클래스의 속성과 메서드는 구현 관점을 반영한다.

- 클래스는 세 가지 관점을 모두 수용할 수 있도록 개념, 인터페이스, 구현을 함께 드러내면서 코드 안에서 세 가지 관점을 쉽게 식별할 수 있도록 깔끔하게 분리해야 한다.

- 협력에 참여하기 위해 객체가 수신해야 하는 메시지를 결정하고 메시지들이 모여 객체의 인터페이스를 구성한다.

- 협력 안에서 메시지를 수신할 객체를 선택하는 것은 객체의 인터페이스, 즉 명세 관점에서 객체를 바라보는 것이다.

## 커피 전문점 도메인

### 커피 주문

### 커피 전문점이라는 세상

- 객체지향의 관점에서 커피 전문점이라는 도메인은 손님 객체, 메뉴 항목 객체, 메뉴판 객체, 바리스타 객체, 커피 객체로 구성된 작은 세상이다.

- 우리가 할 수 있는 일은 동적인 객체를 정적인 타입으로 추상화해서 복잡성을 낮추는 것이다.

- 타입은 분류를 위해 사용된다는 것을 기억하라.

- 메뉴 항목이 메뉴판에 포함된다는 사실 관계, 즉 포함(containment) 관계 또는 합성(composition) 관계는 속이 꽉 찬 마름모로 표현한다.

- 한 타입의 인스턴스가 다른 타입의 인스턴스를 포함하지는 않지만 서로 알고 있어야 하는 경우 이를 연관(association) 관계라고 한다.

- 소프트웨어가 대상으로 하는 영역인 도메인을 단순화해서 표현한 모델을 도메인 모델이라고 한다.

- 객체지향의 세계는 협력하는 자율적인 객체들의 공동체라는 점을 기억하라.

- 적절한 객체에게 적절한 책임을 할당하는 것이다.

## 설계하고 구현하기

### 커피를 주문하기 위한 협력 찾기

- 객체지향 설계의 첫 번째 목표는 훌륭한 협력을 설계하는 것이다.

- 훌륭한 객체는 훌륭한 협력을 설계할 때만 얻을 수 있다.

- 소프트웨어 객체는 현실 객체의 은유라는 것을 기억하자.

- 객체지향의 세계에서는 모든 객체가 능동적이고 자율적인 존재다.

- 의사소통이라는 목적에 부합한다면 용도에 맞게 얼마든지 UML을 수정하라. UML은 의사소통을 위한 표기법이지 꼭 지켜야 하는 법칙이 아니다.

### 인터페이스 정리하기

- 객체가 수신한 메시지가 객체의 인터페이스를 결정한다.

- 객체가 어떤 메시지를 수신할 수 있다는 것은 그 객체의 인터페이스 안에 메시지에 해당하는 오퍼레이션이 존재한다는 것을 의미한다.

- 객체들의 협력은 실행 시간에 컴퓨터 안에서 일어나는 상황을 동적으로 묘사한 모델이다.

- 실제로 소프트웨어의 구현은 동적인 객체가 아닌 정적인 타입을 이용해 이뤄진다.

- 따라서 객체들을 포괄하는 타입을 정의한 후 식별된 오퍼레이션을 타입의 인터페이스에 추가해야 한다.

- 객체의 타입을 구현하는 일반적인 방법은 클래스를 이용하는 것이다.

### 구현하기

- 구현하지 않고 머릿속으로만 구상한 설계는 코드로 구현하는 단계에서 대부분 변경된다.

- 협력을 구상하는 단계에 너무 오랜 시간 쏟지 말고 최대한 빨리 코드를 구현해서 설계에 이상이 없는지, 설계가 구현 가능한지를 판단해야 한다.

- 코드를 통한 피드백 없이는 깔끔한 설계를 얻을 수 없다.

- 객체가 어떤 책임을 수행해야 하는지를 결정한 후에야 책임을 수행하는 데 필요한 객체의 속성을 결정하라.

- 설계가 제대로 그려지지 않는다면 고민하지 말고 실제로 코드를 작성해가면서 협력의 전체적인 밑그림을 그려보라.

- 테스트-주도 설계로 코드를 구현하는 사람들이 하는 작업이 바로 이 것, 즉 테스트 코드를 작성해가면서 협력을 설계한다.

## 코드와 세 가지 관점

### 코드는 세 가지 관점을 모두 제공해야 한다

- 개념 관점에서 코드를 바라보면 클래스가 보인다.

- 소프트웨어 클래스와 도메인 클래스 사이의 간격이 좁으면 좁을수록 기능을 변경하기 위해 뒤적거려야 하는 코드의 양도 점점 줄어든다.

- 명세 관점은 클래스의 인터페이스를 바라본다.

- 객체의 인터페이스는 수정하기 어렵다.

- 최대한 변화에 안정적인 인터페이스를 만들기 위해서는 인터페이스를 통해 구현과 관련된 세부 사항이 드러나지 않게 해야 한다.

- 구현 관점은 클래스의 내부 구현을 바라본다.

- 메서드와 속성이 철저하게 클래스 내부로 캡슐화돼야 한다는 것을 의미한다.

- 세 가지 관점이 명확하게 드러날 수 있게 코드를 개선하라.

### 도메인 개념을 참조하는 이유

- 도메인 개념 중에서 가장 적절한 것, 즉 도메인에 대한 지식을 기반으로 코드의 구조와 의미를 쉽게 유추할 수 있는 것을 선택한다.

- 소프트웨어 클래스가 도메인 개념을 따르면 변화에 쉽게 대응할 수 있다.

### 인터페이스와 구현을 분리하라

- 명세 관점은 클래스의 안정적인 측면을, 구현 관점은 클래스의 불안정한 측면을 드러내야 한다.

- 명세 관점이 설계를 주도하게 하면 설계의 품질이 향상될 수 있다.
