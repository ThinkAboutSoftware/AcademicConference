# 03 타입과 추상화

> 일단 컴퓨터를 조작하는 것이 추상화를 구축하고, 조작하고 추론하는 것에 관한 모든 것이라는 것을 깨닫고 나면 (훌륭한) 컴퓨터 프로그램을 작성하기 위한 중요한 전제 조건은 추상화를 정확하게 다루는 능력이라는 것이 명확해진다. - 키스 데블린(Keith Devilin)

- 해리 벡(Harry Beck)이 창조한 지하철 노선도의 핵심은 지도가 당연히 가져야 한다고 생각되는 '정확성'을 버리고 그 '목적'에 집중한 결과다.

- 연결, 열차를 갈아타는 것이라는 목적에 부합하도록 지하철 노선을 추상화했다.

## 추상화를 통한 복잡성 극복

- 현실에 존재하는 다양한 현상 및 사물과 상호작용하기 위해서 우선 현실을 이해해야한다.

- 인간은 인지 능력과 저장 공간의 한계를 극복하기 위해 본능적으로 이해하기 쉽고 예측 가능한 수준으로 현실을 분해하고 단순화한다.

- 추상화란 현실에서 출발하되 불필요한 부분을 도려내가면서 사물의 본질을 드러나게 하는 과정이다.

- 복잡한 현실을 단순화하기 위해 사용하는 인간의 가장 기본적인 인지 수단이다.

- 추상화의 수준, 이익, 가치는 목적에 의존적이다.

> 현상은 복잡하다. 법칙은 단순하다. 버릴 게 무엇인지 알아내라. - 리차드 파인만

- 추상화(Abstraction)는 어떤 양상, 세부 사항, 구조를 좀 더 명확하게 이해하기 위해 특정 절차나 물체를 의도적으로 생략하거나 감춤으로써 복잡도를 극복하는 방법이다.

- 복잡성을 다루기 위해 추상화는 두 차원에서 이뤄진다.

  - 구체적인 사물들 간의 공통점은 취하고 차이점은 버리는 일반화를 통해 단순하게 만드는 것이다.

  - 중요한 부분을 강조하기 위해 불필요한 세부 사항을 제거함으로써 단순하게 만드는 것이다.

- 모든 경우에서 추상화의 목적은 복잡성을 이해하기 쉬운 수준으로 단순화한다.

- 객체지향 패러다임은 객체라는 추상화를 통해 현실의 복잡성을 극복한다.

- 추상화의 두 차원을 올바르게 이해하고 적용해야 한다.

## 객체지향과 추상화

### 모두 트럼프일 뿐

- 앨리스는 하트 여왕을 '트럼프'라는 유사성을 기반으로 추상화해서 바라보고 있다.

### 그룹으로 나누어 단순화하기

- 명확한 경계를 가지고 서로 구별할 수 있는 구체적인 사람이나 사물을 객체지향 패러다임에서는 객체(Object)라고 한다.

- 객체지향 패러다임의 중심에는 구체적이고 실제적인 객체가 존재한다.

### 개념

- 인간은 공통적인 특성을 기준으로 객체를 여러 그룹으로 묶어 동시에 다뤄야 하는 가짓수를 줄임으로써 상황을 단순화한다.

- 공통점을 기반으로 객체들을 묶기 위한 틀을 개념(concept)이라고 한다.

- 객체를 이용하면 객체를 여러 그룹으로 **분류(classification)** 할 수 있다.

- 개념은 공통점을 기반으로 객체를 분류할 수 있는 일종의 체이다.

- 개념이 객체에 적용됐을 때 객체를 그 개념의 인스턴스(Instance)라고 한다.

> 객체란 특정한 개념을 적용할 수 있는 구체적인 사물을 의미한다. 개념이 객체에 적용됐을 때 객체를 개념의 인스턴스라고 한다.

### 개념의 세 가지 관점

- 어떤 객체에 어떤 개념이 적용됐다고 할 때는 그 개념이 부가하는 의미를 만족시킴으로써 다른 객체와 함께 해당 개념의 일원이 됐다는 것을 의미한다.

- 객체의 분류 장치로서 개념을 이야기할 때, 세 가지 관점를 함께 언급한다.

  - 심볼(symbol): 개념을 가리키는 간략한 이름이나 명칭

  - 내연(intension): 개념의 완전한 정의(의미), 객체가 개념에 속하는지 여부를 확인할 수 있다.

  - 외연(extension): 개념에 속하는 모든 객체(인스턴스)의 집합(set)

- 개념을 이용해 공통점을 가진 객체들을 분류할 수 있다는 아이디어는 객체지향 패러다임이 복잡성을 극복하는 데 사용하는 가장 기본적인 인지 수단이기 때문이다.

### 객체를 분류하기 위한 틀

- 외연의 관점에서 어떤 객체에 어떤 개념을 적용할 수 있다는 것은 동일한 개념으로 구성된 객체 집합에 해당 객체를 포함시킨다는 것을 의미한다.

- 어떤 객체와 마주했을 때 객체에게 적용할 개념을 결정하는 것은 결국 해당 객체를 개념이 적용된 객체 집합의 일원으로 맞아들인다는 것을 의미한다.

- 분류(classification)란 특정한 객체를 특정한 개념의 객체 집합에 포함시키거나 포함시키지 않는 작업을 의미한다.

> 분류란 객체에 특정한 개념을 적용하는 작업이다. 객체에 특정한 개념을 적용하기로 결심했을 때 우리는 그 객체를 특정한 집합의 멤버로 분류하고 있는 것이다.

- 어떤 객체를 어떤 개념으로 분류할지가 객체지향의 품질을 결정한다.

- 적절한 분류 체계는 애플리케이션을 다루는 개발자의 머릿속에 객체를 쉽게 찾고 조작할 수 있는 정신적인 지도를 제공한다.

### 분류는 추상화를 위한 도구다

- 개념은 객체들의 복잡성을 극복하기 위한 추상화 도구다.

- 추상화를 사용함으로써 그나마 제어 가능한 수준으로 단순화할 수 있다.

## 타입

### 타입은 개념이다.

- 타입(Type)은 개념과 마찬가지로 공통점을 기반으로 객체들을 묶기 위한 틀이다.

> 타입은 개념과 동일하다. 따라서 타입이란 우리가 인식하고 있는 다양한 사물이나 객체에 적용할 수 있는 아이디어나 관념을 의미한다. 어떤 객체에 타입을 적용할 수 있을 때 그 객체를 타입의 인스턴스라고 한다. 타입의 인스턴스는 타입을 구성하는 외연인 객체 집합의 일원이 된다.

### 데이터 타입

- 메모리의 세상에는 타입이라는 질서가 존재하지 않는다.

- 타입이 없다(Untyped)는 것은 메모리 안의 데이터를 다룰 수 있는 단 하나의 타입만이 존재한다는 의미이다.

- 타입이 없는 체계 안에서 모든 데이터는 일련의 비트열(bit string: 0, 1)로 구성된다.

- 인간은 본인이 다뤄야하는 데이터의 용도와 행동에 따라 그것들을 분류했다.

- 타입 시스템은 메모리 안의 모든 데이터가 비트열로 보임으로써 야기되는 혼란을 방지한다.

- 메모리 안에 저장된 0과 1에 대해 수행 가능한 작업과 불가능한 작업을 구분함으로써 데이터가 잘못 사용되는 것을 방지한다.

- 타입은 데이터가 어떻게 사용되느냐에 관한 것이다.

  - 어떤 데이터에 어떤 연산자를 적용할 수 있느냐가 해당 데이터의 타입을 결정한다.

- 타입에 속한 데이터를 메모리에 어떻게 표현하는지는 외부로부터 철저하게 감춰진다.

> 데이터 타입은 메모리 안에 저장된 데이터의 종류를 분류하는 데 사용하는 메모리 집합에 관한 메타데이터다. 데이터에 대한 분류는 암시적으로 어떤 종류의 연산이 해당 데이터에 대해 수행될 수 있는지를 결정한다.

### 객체와 타입

- 객체를 타입에 따라 분류하고 그 타입에 이름을 붙이는 것은 프로그램에서 사용할 새로운 데이터 타입을 선언하는 것과 같다.

- 객체는 데이터가 아니다.

- 객체를 창조할 때 가장 중요하게 고려해야 하는 것은 객체가 이웃하는 객체와 협력하기 위해 어떤 행동을 해야 할지를 결정하는 것이다.

- 어떤 객체가 어떤 타입에 속하는지를 결정하는 것은 객체가 수행하는 행동이다.

- 객체의 내부적인 표현은 외부로부터 철저하게 감춰진다.

### 행동이 우선이다

- 동일한 책임을 수행하는 일련의 객체는 동일한 타입에 속한다.

- 객체의 타입을 결정하는 것은 객체의 행동뿐이다.

- 같은 타입에 속한 객체는 행동(책임, 메시지 수신)만 동일하다면 서로 다른 데이터를 가질 수 있다.

- 동일한 타입에 속하더라도 동일한 메시지를 처리하는 방식은 서로 다를 수밖에 없다: 다형성(Polymorphism)

- 다형성이란 동일한 요청에 서로 다른 방식으로 응답할 수 있는 능력이다.

- 다형적인 객체들은 동일한 타입(또는 타입 계층)에 속한다.

- 데이터의 내부 표현 방식과 무관하게 행동만이 고려 대상이라는 사실은 외부에 데이터를 감춰야 한다는 것을 의미한다.

- 훌륭한 객체지향 설계는 외부에 행동만을 제공하고 데이터는 행동 뒤로 감춰야 한다: 캡슐화(Encapsulation)

- 행동에 따라 객체를 분류하기 위해서는 객체가 외부에 제공하는 행동을 먼저 생각해야 한다.

- 책임 주도 설계(Responsibility-Driven Design)는 데이터 주도 설계 방법(Data-Driven Design)의 단점을 개선하기 위해 고안되었다.

- 객체를 결정하는 것은 행동으로 데이터는 단지 행동을 따를 뿐이다.

## 타입의 계층

### 트럼프 계층

- 트럼프 인간은 트럼프보다 좀 더 특화된 행동을 하는 특수한 개념이다.

### 일반화/특수화(generalization/specialization) 관계

- 타입과 타입 사이에는 일반화/특수화 관계가 존재할 수 있다.

- 일반화와 특수화는 동시에 일어난다.

- 객체지향에서 일반화/특수화 관계를 결정하는 것은 객체가 외부에 제공하는 행동이다.

  - 일반적인 타입: 특수한 타입이 가진 모든 행동들 중에서 일부 행동만을 가지는 타입(더 많은 수의 행동을 가진다)

  - 특수한 타입: 일반적인 타입이 가진 모든 행동을 포함하지만 거기에 더해 자신만의 행동을 추가하는 타입(더 적은 수의 행동을 가진다)

- 타입의 내연을 의미하는 행동의 가짓수와 외연을 의미하는 집합의 크기는 서로 반대다.

### 슈퍼타입과 서브타입

- 슈퍼타입(Suertype)이란 특수한 타입이 가진 모든 행동들 중에서 일부 행동만을 가지는 타입(일반적)이다.

- 서브타입(Subtype)은 일반적인 타입이 가진 모든 행동을 포함하지만 거기에 자신만의 행동을 추가하는 타입(특수)이다.

- 두 타입 간의 관계가 행동에 의해 결정된다.

- 서브타입은 슈퍼타입을 대체할 수 있어야 한다.

- 슈퍼타입의 행동은 서브타입에게 자동으로 상속된다.

### 일반화는 추상화를 위한 도구다

- 일반화/특수화 계층은 객체지향 패러다임에서 추상화의 두번째 차원(중요한 부분을 강조하기 위해 불필요한 세부 사항을 제거해 단순하게 만든다)을 적절하게 활용하는 대표적인 예시다.

## 정적 모델

### 타입의 목적

- 인간의 인지 능력으로는 시간에 따라 동적으로 변하는 객체의 복잡성을 극복하기 어려우므로 타입을 사용한다.

- 한 객체의 상태에 복잡성을 부과하는 요소를 제거하고, 정적인 관점에서 객체를 묘사한다.

### 그래서 결국 타입은 추상화다.

- 타입을 이용하면 객체의 동적인 특성을 추상화할 수 있다.

- 즉, 시간에 따른 객체의 상태 변경이라는 복잡성을 단순화할 수 있는 효과적인 방법이다.

### 동적 모델과 정적 모델

- 동적 모델(Dynamic Model)은 객체가 살아 움직이는 동안 상태가 어떻게 변하고 어떻게 행동하는지 포착한다.

- 스냅샷(snapshot)은 객체가 특정 시점에 구체적으로 어떤 상태를 가지는지 표현하는데 UML(Unified Modeling Language)에서는 이를 객체 다이어그램(Object Diagram)이라고 부른다.

- 타입 모델(Type Diagram)은 객체가 가질 수 있는 모든 상태와 모든 행동을 시간에 독립적으로 표현한다.

- 이는 객체가 속한 타입의 정적인 모습을 표현하므로 정적 모델(Static Model)이라고 한다.

- 애플리케이션을 실행해 객체의 상태 변경을 추적하고 디버깅하는 시점은 결국 객체의 동적인 모델을 탐험하는 것이다.

- 객체지향 프로그래밍 언어를 이용해 클래스를 작성하는 시점은 시스템을 정적인 관점에서 접근하는 것이다.

### 클래스

- 객체지향 프로그래밍 언어에서 정적인 모델은 클래스를 이용해 구현된다.

- 타입을 구현하는 가장 보편적인 방법은 클래스를 이용하는 것이다.

- 클래스는 타입을 구현할 수 있는 여러 구현 매커니즘 중 하나로 자바스크립트같은 프로토타입 기반의 언어에는 클래스가 존재하지 않는다.

- 클래스는 타입 구현 외에도 코드를 재사용하는 용도로 사용되므로 타입과 동일한 개념이 아니다.

## 논의 사항

- 무얼 논의해봐야할지 잘 모르겠네요.