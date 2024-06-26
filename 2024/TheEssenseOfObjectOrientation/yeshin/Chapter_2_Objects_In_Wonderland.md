# 02 이상한 나라의 객체

> 객체지향 패러다임은 지식을 추상화하고 추상화한 지식을 객체 안에 캡슐화함으로써 실세계 문제에 내재된 복잡성을 관리하려고 한다. 객체를 발견하고 창조하는 것은 지식과 행동을 구조화하는 문제다. - 레베카 워프스브록(Rebecca Wirts-Brock)

- 사람은 태어난 지 얼마 안 된 시기부터 뚜렷한 경계를 가지고 함께 행동하는 물체를 하나의 개념으로 인지한다.

## 객체지향과 인지 능력

- 인간은 본능적으로 세상을 독립적으로 식별 가능한 객체의 집합으로 바라본다.

- 객체지향이 세상을 자율적이고 독립적인 객체들로 분해할 수 있는 인간의 기본적인 인지 능력에 기반을 두고 있기 때문이다.

- 객체란 인간이 분명하게 인지하고 구별할 수 있는 물리적인 또는 개념적인 경계를 지닌 어떤 것이다.

- 객체지향 패러다임의 목적은 현실 세계를 모방하는 것이 아니라 현실 세계를 기반으로 새로운 세계를 창조하는 것이다.

- 현실 세계의 전등은 사람의 손길 없이는 스스로 불을 밝힐 수 없지만 소프트웨어 세계의 전등은 외부의 도움 없이도 스스로 전원을 켜거나 끌 수 있다.

## 객체, 그리고 이상한 나라

### 이상한 나라의 앨리스

### 앨리스 객체

- 앨리스의 키는 시간의 흐름에 따라 계속 변한다.

- 앨리스의 상태를 결정하는 것은 행동이지만 행동의 결과를 결정하는 것은 상태다.

- 앨리스가 한 행동의 결과는 앨리스의 상태에 의존적이다.

- 문을 통과한다는 행동의 결과는 앨리스의 위치라는 상태를 이용해 쉽게 설명할 수 있다.

- 어떤 행동의 성공 여부는 이전에 어떤 행동들이 발생했는지에 영향을 받는다.

- 행동간의 순서가 중요하다.

- 앨리스는 상태 변경과 무관하게 유일한 존재로 식별 가능하다.

  - 앨리스(객체)는 상태를 가지며 상태는 변경 가능하다.

  - 앨리스(객체)의 상태를 변경시키는 것은 앨리스(객체)의 행동이다.

    - 행동의 결과는 상태에 의존적이며 상태를 이용해 서술할 수 있다.

    - 행동의 순서가 결과에 영향을 미친다.

  - 앨리스(객체)는 어떤 상태에 있더라도 유일하게 식별 가능하다.

## 객체, 그리고 소프트웨어 나라

- 하나의 개별적인 실체로 식별 가능한 물리적인 또는 개념적인 사물은 어떤 것이라도 객체가 될 수 있다.

- 객체의 다양한 특성을 효과적으로 설명하기 위해 객체를 상태(state), 행동(behavior), 식별자(identity)를 지닌 실체로 보는 것이 가장 효과적이다.

> 객체는 식별 가능한 개체 또는 사물이다. 객체는 자동차처럼 만질 수 있는 구체적인 사물일 수도 있고, 시간처럼 추상적인 개념일 수도 있다. 객체는 구별 가능한 식별자, 특징적인 행동, 변경 가능한 상태를 가진다. 소프트웨어 안에서 객체는 저장된 상태와 실행 가능한 코드를 통해 구현된다.

### 상태

#### 왜 상태가 필요한가

- 객체가 주변 환경과의 상호작용에 어떻게 반응하는가는 그 시점까지 객체에 어떤 일이 발생했느냐에 좌우된다.

  - 비행기 탑승 여부는 과거에 항공권을 발권하는 행동이 발생했는지 여부에 따라 달라진다.

- 어떤 행동의 결과는 과거에 어떤 행동들이 일어났었냐에 의존한다.

  - 자판기에 충분한 금액을 투입하기 전에는 원하는 음료를 선택할 수 없다.

- 인간은 행동의 과정과 결과를 단순하게 기술하기 위해 상태라는 개념을 고안했다.

  - 자판기는 현재까지 투입된 금액의 상태를 기억한다.

- 상태를 이용하면 과거에 얽매이지 않고 현재를 기반으로 객체의 행동 방식을 이해할 수 있다.

- 상태는 근본적으로 세상의 복잡성을 완화하고 인지 과부화를 줄일 수 있는 중요한 개념이다.

#### 상태와 프로퍼티

- 숫자, 문자열, 양, 속도, 시간, 날짜, 참/거짓 같은 단순한 값은 객체가 아니지만 객체의 상태을 표현한다.

- 객체를 사용해 다른 객체의 상태를 표현해야 할 때가 있다.

  - 앨리스가 현재 음료를 들고 있는 상태를 표현하고 싶다면?

  - 앨리스의 상태 일부를 음료라는 객체를 이용해 표현한다.

  - 객체지향 관점에서 앨리스는 음료에 관해 알고 있는 상태며 앨리스 객체와 음료 객체는 서로 연결되어 있다.

- 모든 객체의 상태는 단순한 값과 객체의 조합으로 표현하는데 이를 구성하는 모든 특징을 통틀어 객체의 프로퍼티(property)라고 한다.

- 일반적으로 프로퍼티는 정적(고정)이지만, 프로퍼티 값(property value)는 동적(시간의 흐름에 따라 변경)이다.

- 이처럼 객체와 객체 사이의 의미 있는 연결을 링크(link)라고 한다.

- 객체와 객체 사이에는 링크가 존재해야만 요청(메시지)을 보내고 받을 수 있다.

- 링크는 객체가 다른 객체를 참조할 수 있다는 것을 의미, 한 객체가 다른 객체의 식별자를 알고 있는 것으로 표현된다.

- 객체의 프로퍼티는 단순한 값인 속성(attribute)과 다른 객체를 가리키는 링크(연관관계의 인스턴스)라는 두 가지 종류의 조합으로 표현할 수 있다.

> 상태는 특정 시점에 객체가 가지고 있는 정보의 집합으로 객체의 구조적 특징을 표현한다. 객체의 상태는 객체에 존재하는 정적인 프로퍼티와 동적인 프로퍼티 값으로 구성된다. 객체의 프로퍼티는 단순한 값과 다른 객체를 참조하는 링크로 구분할 수 있다.

- 행동은 다른 객체로 하여금 간접적으로 객체의 상태를 변경하는 것을 가능하게 한다.

- 객체지향의 기본 사상은 상태와 상태를 조작하기 위한 행동을 하나의 단위로 묶는 것이다.

### 행동

#### 상태와 행동

- 객체의 상태를 변경하는 것은 객체의 자발적인 행동뿐이다.

- 객체가 취하는 행동은 객체 자신의 상태를 변경(side effect)시킨다.

- 객체의 행동은 객체의 상태를 변경시키지만 행동의 결과는 객체의 상태에 의존적이다.

  - 객체의 행동은 상태에 영향을 받고 상태를 변경시킨다.

  - 상호작용이 현재의 상태에서 어떤 방식으로 의존하는가

  - 상호작용이 어떻게 현재의 상태를 변경시키는가

- 상태를 이용하면 복잡한 객체의 행동을 쉽게 이해할 수 있다.

#### 협력과 행동

- 객체의 행동은 객체가 협력에 참여하는 유일한 방법이다.

- 객체는 협력에 참여하는 과정에서 자기 자신의 상태뿐만 아니라 다른 객체의 상태 변경을 유발할 수도 있다.

> 행동이란 외부의 요청 또는 수신된 메시지에 응답하기 위해 동작하고 반응하는 활동이다. 행동의 결과로 객체는 자신의 상태를 변경하거나 다른 객체에게 메시지를 전달할 수 있다. 객체는 행동을 통해 다른 객체와의 협력에 참여하므로 행동은 외부에 가시적이어야 한다.

#### 상태 캡슐화

- 객체지향의 세계에서 모든 객체는 자신의 상태를 스스로 관리하는 자율적인 존재다.

- 객체는 상태를 캡슐 안에 감춰둔 채 외부로 노출하지 않는다.

- 객체가 외부에 노출하는 것은 행동뿐이며, 외부에서 객체에 접근할 수 있는 유일한 방법 역시 행동뿐이다.

- 객체의 행동을 유발하는 것은 외부로부터 전달된 메시지지만 객체의 상태를 변경할지 여부는 객체 스스로 결정한다.

- 상태를 외부에 노출시키지 않고 행동을 경계로 캡슐화(Encapsulation)하는 것은 객체의 자율성을 높이고 협력을 단순하고 유연하게 만든다.

### 식별자

- 객체가 식별 가능하다는 것은 객체를 서로 구별할 수 있는 특정한 프로퍼티(식별자, Identifier)가 객체 안에 존재한다는 것이다.

- 모든 객체는 식별자를 가지며 식별자를 이용해 객체를 구별할 수 있다.

- 객체가 아닌 단순한 값은 식별자를 가지지 않는데, 이는 값과 객체의 가장 큰 차이점이다.

- 값이 같은지 여부는 상태가 같은지를 이용해 판단(동등성, Equality)한다.

- 객체는 가변 상태(Mutable state)를 가지며 값은 불변 상태(Immutable state)를 가진다.

- 식별자를 기반으로 객체가 같은지를 판단할 수 있는 성질을 동일성(Identical)이라고 한다.

- 상태가 가변적인 두 객체의 동일성을 판단하기 위해서는 상태 변경에 독립적인 별도의 식별자를 이용할 수밖에 없다.

> 식별자란 어떤 객체를 다른 객체와 구분하는 데 사용하는 객체의 프로퍼티다. 값은 식별자를 가지지 않기 때문에 상태를 이용한 동등성 검사를 통해 두 인스턴스를 비교해야 한다. 객체는 상태가 변경될 수 있기 때문에 식별자를 이용한 동일성 검사를 통해 두 인스턴스를 비교할 수 있다.

- 객체지향 언어 관점에서 값과 객체 모두 클래스로부터 생성된 객체이기 때문에 문맥에 따라 그 의미가 혼란스러워질 수 있다.

  - 식별자를 가진 전통적인 의미의 객체는 참조 객체(Reference Object), 엔티티(Entity)로 불린다.

  - 식별자를 가지지 않는 값은 값 객체(Value Object)라고 불린다.

- 식별자는 객체지향 패러다임의 표현력을 높이는 데 중요한 역할을 한다.

- 객체지향의 세계는 상태가 변하지 않는 값과 상태가 변하는 객체들이 서로 균형을 맞추며 조화를 이루는 사회여야 한다.

## 기계로서의 객체

- 객체지향의 세계를 창조하는 개발자들의 주된 업무는 객체의 상태를 조회(query)하고 객체의 상태를 변경(command)한다.

- [버트라드 마이어의 Object-Oriented Software Construction](https://en.wikipedia.org/wiki/Object-Oriented_Software_Construction)에서는 객체를 기계에 비유하여 설명한다.

- 명령과 쿼리는 객체가 외부에 제공하는 행동이다.

- 객체를 기계로서 바라보는 관점은 상태, 행동, 식별자에 대한 시각적인 이미지를 제공, 캡슐화와 메시지를 통한 협력 관계를 매우 효과적으로 설명한다.

## 행동이 상태를 결정한다

- 객체지향에 갓 입문한 사람들이 가장 쉽게 빠지는 함정은 상태를 중심으로 객체를 바라보는 것이다.

  - 상태를 먼저 결정할 경우 캡술화가 저해된다.

  - 객체를 협력자가 아닌 고립된 섬으로 만든다.

  - 객체의 재사용성이 저하된다.

- 객체의 적합성을 결정하는 것은 객체의 행동이다.

- 협력 안에서 객체의 행동은 결국 객체가 협력에 참여하면서 완수해야 하는 책임을 의미한다.

- 어떤 책임이 필요한가를 결정하는 과정이 전체 설계를 주도해야 한다(책임-주도 설계, Responsibility-Driven Design)

- 협력이라는 문맥 안에서 객체의 행동을 생각하도록 도움으로써 응집도 높고 재사용 가능한 객체를 만들 수 있게 한다.

## 은유와 객체

### 두 번째 도시전설

- 객체지향이란 현실 세계의 모방이다?

- 소프트웨어 상품은 실제 세계의 상품이 하지 못하는 가격 계산과 같은 행동을 스스로 수행할 수 있다.

- 모방과 추상화라는 개념만으로는 현실 객체와 스프트웨어 객체 사이의 관계를 깔끔하게 설명하지 못한다.

### 의인화

- 현실 속에서의 수동적인 존재가 소프트웨어 객체로 구현될 때는 능동적으로 변한다.

- 레베카 워프스브록은 현실의 객체보다 더 많은 일을 할 수 있는 소프트웨어 객체의 특징을 의인화(Anthropomorphism)이라고 부른다.

> ... 의인화 관점에서 소프트웨어를 생물로 생각하자. 모든 생물처럼 소프트웨어는 태어나고, 삶을 영위하고, 그리고 죽는다. - Wirfs-Brock

- 객체지향 세계의 거리는 현실 속의 객체보다 더 많은 특징과 능력을 보유한 객체들로 넘쳐난다.

### 은유

- 은유(Metaphor)는 실제로는 적용되지 않는 한 가지 개념을 이용해 다른 개념을 서술하는 대화의 한 형태다.

- 은유의 본질은 한 종류의 사물을 다른 종류의 사물 관점에서 이해하고 경험하는 데 있다.

- 은유는 하나의 의미를 다른 것을 이용해 전달한다는 의미를 가지고 있다.

- 현실 속의 객체의 의미 일부가 소프트웨어 객체로 전달되기 때문에 프로그램 내의 객체는 현실 속의 객체에 대한 은유다.

- 표현적 차이(Representational Gap)과 의미적 차이(Semantic Gap)라는 논점과 관련성이 깊다.

- 여기에서 차이란 소프트웨어에 대한 사람들이 생각하는 모습과 실제 소프트웨어의 표현 사이의 차이를 의미한다.

- 소프트웨어 객체에 대한 현실 객체의 은유를 효과적으로 사용할 경우 표현적 차이를 줄일 수 있으며, 이해하기 쉽고 유지보수가 용이한 소프트웨어를 만들 수 있다.

### 이상한 나라를 창조하라

- 객체의 특성을 상기시킬 수만 있다면 현실 속의 객체의 이름을 이용해 객체를 묘사하라.

- 그렇지 않다면 깔끔하게 현실을 무시하고 자유롭게 새로운 세계를 창조하라.

## 논의 사항

- '행동이 상태를 결정한다'라는 문장이 와닿았는데요. 이를 어떻게 연습해볼 수 있을까요?
