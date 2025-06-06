# 도메인 주도 설계란 무엇인가?
## 4 ~ 6장
---
책을 전체적으로 읽으면서, 마지막 장에서 에릭 에반스가 말한 것 처럼 DDD는 팀 전체가 함께 하는 정말 거대한 작업이라는 것을 느끼게 되었습니다.
결국 DDD는 팀의 몇몇 사람만 이해하는 것이 아니라, 모두가 관심을 기울이고 노력해야 비로소 에릭 에반스가 정의하는 DDD에 다다를 것이라고 생각합니다.
그래서 이러한 설계 방식을 제안한 에릭 에반스가 정말 대단하고 존경스러운 사람이라는 것을 느끼며 놀랍습니다.

5장은 이번 책 중에서도 저에게 가장 추상적으로 다가와 어려웠습니다.
아마 제가 아직 경험해보지 못한 기업의 큰 프로젝트 수준으로 설명되기 때문인 것으로 생각합니다.
하지만 이 책을 통해 DDD에 관심이 더 가게 되었고, 심지어 제가 그동안 오해하고 있던 개념(Service)를 어느정도 바로 잡을 수 있는 좋은 기회를 가지게 되었습니다.

## 4장 - 깊은 통찰을 향한 리팩터링

**지속적인 리팩터링**
설계와 개발 공정 동안에, 우리는 종종 작업을 멈추고, 코드를 살펴보아야 한다.
리팩터링은 애플리케이션의 기능에 변화를 주지 않고 코드를 더 좋게 만들기 위해 재설계하는 절차다.
이때, 자동화 테스트를 하면 수정 작업이 기존 기능의 어떤 것도 망치지 않았음을 확신할 수 있다.
모든 모델은 초기에는 깊이가 얕을 수밖에 없으나 모델이 점점 깊은 통찰을 가지도록 개선(refactor)해야 한다.
설계는 유연해야하며, 그러지 못한 설계는 리팩터링을 막는다.
전통적으로 리팩터링이란 기술적인 동기를 가지고 코드를 변경하는 것으로 정의되어 왔다.
하지만 리팩터링은 도메인에 대한 통찰이나, 모델이나 코드에 드러나는 표현을 이에 상응하게 정련하기 위해 수행할 수도 있다.

> 정교한 도메인 모델이란, 도메인 전문가와 이 도메인에 대해 관심있는 개발자들이 밀접하게 엮인 조직이 반복적으로 리팩터링을 수행하지 않는다면 만들어질 수 없다.

**핵심 개념 드러내기**
소규모의 변경이 큰 차이를 초래하는 경우가 있으며, 이는 바로 도약(	Breakthrough)이다.
때때로 도약은 우리가 모델을 보는 방식이나 생각하는 방식을 바꾸기도 한다.
도약은 아마도 대규모 리팩터링을 유발하기도 할 것이다.
이러한 리팩터링은 위험하기도 하지만, 충분한 리팩터링 작업이란 애플리케이션의 행동에 변화를 초래할 수도 있기 때문이다.
도약에 도달하려면 암시적 개념을 명시적으로 만들 필요가 있다.
초기 단계에서 도메인 전문가와 개발자가 매우 많은 아이디어와 지식을 교환하며 일부 개념이 유비쿼터스 언어로 변환되지만, 나머지 일부는 알려지지 않는 채로 남는다.
이런 개념은 암시적 개념들이고 모델에서 이미 사용되고 있는 다른 개념을 설명하는 데 사용된다.
프로젝트 중간에 일부가 설계의 핵심인 것을 알아차리면, 우리는 이 개념을 클래스 및 관계를 추가함으로써 명시적인 것으로 끌어내야 한다.
이러한 일이 발생할 때, 우리는 도약의 기회를 가진다.

누락된 개념이 없는지 찾기 위해 노력해야하며, 하나를 발견한다면 이를 명시적으로 만들어야 한다.
그리고 설계를 단순하고 유연하게 하기 위해 리팩터링해야한다.

명시적인 것을 만들어 낼 때 유용한 추가 개념은 제약 조건, 처리, 명세다.
제약 조건은 불변식을 표현하는 방식이다.
프로세스들은 대게 절차적으로 코드에 표현된다.
그러나 우리는 객체지향 언어를 사용하기 때문에 객체를 선택하여 그 객체에 해당 행위를 추가할 필요가 있다.
프로세스를 구현하는 최고의 방법은 서비스를 이용하는 것이다. 만약 그 프로세스를 수행할 방법이 여럿이라면 전략 패턴을 사용하여 한 객체에 알고리즘으로 캡슐화하여 표현할 수 있다.
만약 모델의 유비쿼터스 언어가 처리 절차 각각에 대해 상세하게 언급하고 있다면, 그때가 명시적 구현을 시작할 때다.

## 5장 - 모델 무결성 보존
좋은 모델에서 출발하여 불일치가 많은 쪽으로 변질되기는 쉽다.
모델이 갖추어야 할 첫 번째 조건은 변하지 않는 용어와 모순 없는 일관성이다.
모델의 내부적 일관성을 통일성(unification)이라고 한다.
하지만 기업 규모의 통일된 모델이라는 것은 어려운 이상적인 목표다.
결국에는 쪼개질 하나의 큰 모델을 유지하려고 노력하는 대신, 의도적으로 이것을 여러 개의 모델로 분할하는 새로운 접근법이 있다.

**분할된 컨텍스트**
모델의 컨텍스트란 모델 안에서 사용된 용어들이 특정한 의미를 가지는 것을 보장할 수 있도록 적용되는 조건들의 집합이라고 할 수 있다.
모델이 기업 프로젝트 전체 영역에 펼져져 있다면, 모델의 순수성을 유지하기가 매우 어렵게 된다.
그러나 특정 영역에 국한되어 있다면 훨씬 쉽다.
따라서 명시적으로 모델에 적용할 수 있는 컨텍스트를 정의하고, 팀 조직 관점의 용어로 경계를 명시적으로 설정해야 한다.

**지속적인 통합**
한번 분할된 컨텍스트가 정의되고 나면 우리는 이것을 건강한 상태로 유지시켜야 한다.
여러 사람들이 동일한 컨텍스트 안에서 일하고 있을 때, 모델이 단편화될 경향은 매우 높아진다.
모델은 초기부터 충분하게 정의될 수 없다.
모델은 생성되고 나면 개발 프로세스 동안 도메인에 대한 새로운 이해를 바탕으로 끊임없이 피드백을 받는다.
이것은 새로운 개념이 모댈에 추가되거나 새로운 구성 요소가 코드에 추가될 수 있음을 의미한다.
이런 유형의 모든 필요는 단일 모델로 통합되어야 하고 그에 맞게 코드로 구현되어야 한다.

**컨텍스트 맵**
기업 규모 애플리케이션은 다수의 모델을 가지면 각 모델은 고유의 분할된 컨텍스트를 가진다.
컨텍스트 맵은 서로 다른 분할된 컨텍스트들과 그들의 관계에 대한 개요를 표현한 문서다.
모든 사람은 각 컨텍스트의 범위와 코드의 매핑 상태를 알고 있어야 한다.

*컨텍스트 맵을 만드는데 사용할 수 있는 패턴*
* 공유 커널
* 고객-공급자
* 분할 방식
* 오픈 호스트 서비스
* 변질 방지 레이어

## 6장 - 오늘날 DDD는 중요하다
해당 장은 당시에 에릭 에반스와의 짧은 인터뷰 내용이다.
소프트웨어가 점점 더 복잡해지기 때문에 힘 있고 유연한 소프트웨어를 만들기 위해서는 특히 도메인에 혼신의 힘을 다해야만 한다.
DDD는 기술 플랫폼에 특화되지 않았지만, 몇몇이 비즈니스 로직을 생성하는 데 좀 더 인상적인 방식을 제공하고, 어떤 플랫폼은 잡다한 일들로부터 주의를 다른데로 돌릴 수 있게 해준다.
특히 자바, 루비가 DDD에 쓰기에 좋은 언어라고 한다.

에릭 에반스의 조언
1. 단순한 상태를 유지
2. 구체적인 시나리오에 초첨을 맞춰야 한다.
3. DDD를 모든 것에 적용하려고 하지 말아야 한다.
4. 실험을 많이 하고 실수를 많이 할 것이라고 예상하라. 모델링은 창조적인 작업이다.

## [논의 내용]
* 리팩토링을 하는 주기가 어느 정도 되는지, 그리고 시작하게 되는 각자의 기준이 어떤지 궁금합니다.