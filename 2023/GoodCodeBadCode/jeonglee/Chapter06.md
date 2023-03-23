## 6장 예측 가능한 코드를 작성하라  

> 우리는 다른 개발자가 작성한 코드에 기반하여 코드를 작성하고, 다른 개발자들은 다시 우리가 작성한 코드를 기반해서 코드를 작성한다.

### 논의 사항

테스트 코드에 대한 생각이 궁금합니다..!  

저자가 생각하는 마지막 내용과 비슷한지.. 다른 견해를 가지고 계신지 

### 책의 내용 및 정리

핵심 주제  
* 코드가 어떻게 예측을 벗어나 작동할 수 있는지
* 소프트웨어에서 예측을 벗어나는 코드가 어떻게 버그로 이어질 수 있는지
* 코드가 예측을 벗어나지 않도록 보장하는 방법

#### 매직값을 반환하지 말하야 한다.

매직값은 함수의 정상적인 반환 유형에 적합하지만 특별한 의미를 가지고 있다.  

매직값의 일반적인 예는 값이 없거나 오류가 발생했음을 나타내기 위해 -1을 반환하는 것이다.  

매직값은 정상적인 반환 유형에 들어맞기 때문에 이 값이 갖는 특별한 의미를 인지하지 못하고, 이에 대해 적극적으로 경계하지 않는 이상 정상적인 반환값으로 오인할 수 있다.  

**매직값은 버그를 유발할 수 있다.**  

레거시 코드들의 일부분을 보면 매직값을 반환하는 함수들이 있다.  

과거 오류전달 기법이나 널을 반환하는 것이 가능하지 않거나 실용적이지 못해 매직값을 반환하는 경우가 있다.  

그러나 일반적으로 매직값을 반환하면 예측을 벗어날 위험이 있으므로 사용하지 않는 것이 가장 바람직하다.  

책에서 주어진 예제처럼 작은 문제가 큰 문제를 만들 수 있기 때문에 매직값을 사용하지 않는 것이 좋다.  

다른 사람은 해당 함수를 활용할 때 매직값을 반환할지 모르기 때문에 위험할 수 있다.  

**널, 옵셔널 또는 오류를 반환하라**  

3장에서 다룬 코드계약에는 명백한 항목과 세부 조항이 포함된다는 점을 살펴봤다.  

매직값의 문제점은 호출하는 쪽에서 함수 계약의 세부 조항을 알아야 한다는 점이다.  

따라서 값이 없을 수 있는 경우 이것이 코드 계약의 명백한 부분에서 확인할 수 있도록 하는 것이 좋다.  

가능한 널, 옵셔널을 반환하고 이를 통해 호출하는 쪽에서 값이 없을 수 있다는 점을 인지할 수 있게 헤야한다.  

**때때로 매직값이 우연히 발생할 수 있다.**  

개발자가 자신의 코드에 주어지는 모든 입력과 이러한 입력값들이 어떤 영향을 미칠 수 있을지에 대해 충분히 생각하지 않을 때도 매직값이 반환될 수 있다.  

책에서 등장하는 예제와 같이 함수를 짤 경우 예외에 대한 생각을 하지 않는 경우 매직값이 반환되게 된다.  

따라서 널값을 사용하는 것이 더 낫고, 호출하는 쪽에선 입력에 따른 값이 없을 수 있음을 알아야 한다.  

#### 널 객체 패턴을 적절히 사용하라  

널값이나 옵셔널을 반환하는 대신 널 객체 패턴을 사용할 수 있다.  

*널값대신 널 객체 패턴을 사용하는 이유는 널값을 반환하는 대신 유효한 값이 반환되어 그 이후에 실행되는 로직에서 널값으로 인해 시스템에 피해가 가지 않도록 하기 위함이다.*  

4장에도 잠깐 등장했지만 경고의 의미였다.  

하지만 적절한 사용은 오히려 유리하게 작용함을 알려준다.

**빈 컬렉션을 반환하면 코드가 개선될 수 있다.**  

책에서 소개하는 예제는 간단하게 null검사문과 NEP의 경우를 줄이기 위해 클래스에서 빈 문자열을 반환, 호출하는 쪽에선 합치기를 할 경우 조금 더 좋은 코드로 작동한다는 것이다.  

하지만 복잡한 상황에서는 위험성이 커진다.  

**빈 문자열을 반환하는 것도 때로는 문제가 될 수 있다.**  

간단하게 문자의 역할에 따른 책임이 달라짐을 의미한다.  

문자자체의 역할로 위에서 언급한 클래스의 특정 문자열을 추출 후 합치기 같은 로직에선 유리하게 작용하나 클래스전체를 돌며 의미가 있는 문자열 `ex) ID`같은 문자열에 null이 아닌 빈 문자열을 리턴할 경우이다.  

이런 경우엔 null을 반환하는 쪽이 훨씬 유리하다.  

**더 복잡한 널 객체는 예측을 벗어날 수 있다.**  

앞선 문자 자체의 기능과 ID의 기능을 좀 더 깊게 생각해서 언어 자체의 Null과 비어있는 상태를 완벽하게 이해하는 것이 중요하다.  

책에서 설명하는 비어있는 박스를 판매하는 일이 생길 수 있기 때문이다.  

> 따라서 함수를 호출할 때 널 객체 패턴을 사용하는 것은 본질적으로 빈 상자를 파는 것과 같다.  

**널 객체 구현은 예상을 벗어나는 동작을 유행할 수 있다.**  

구현이 좀 더 심화된다면 추상화 계층에서 인터페이스의 상속을 받은 널 객체는 해당 인터페이스의 기능을 전부 무시해야한다.  

하지만 반환 값이 있어야 하는 함수의 경우 0을 반환해야 하는 경우나 함수 자체의 반환 값을 `?`을 사용하는 방법도 있지만 후자는 전부 고쳐야 하고.. null반환과 다른 점이 없다..  

따라서 리터럴 `default`값을 넣는 경우가 많은데 이는 예상하지 못한 동작을 수행할 수 있다는 점이다.  

여기서 생각나는 문제점은 인터페이스 기능이 추가될 때 마다 해당 널 객체는 점점 비대해지며 해당 오류를 예측하기 더욱 어려워질 것이라는..  

#### 예상하지 못한 부수 효과를 피하라  

부수 효과(Side Effect)란, 어떤 함수의 호출이 함수 외부에 초래한 상태 변화를 의미한다.  

가장 많이 문제되는 싱글톤패턴, 전역변수등의 함수 외부에 크게 영향을 주는 경우 프로그램 전체에 부수적인 효과로 무너지는..  

책에서 소개하는 일반적인 부수 효과 유형은 다음과 같다.  

* 사용자에게 출력 표시
* 파일이나 데이터베이스에 무언가를 저장
* 다른 시스템을 호출하여 네트워크 트래픽 발생
* 캐시 업데이트 혹은 무효화  

부수효과는 소프트웨어 작성 시 불가피 한 부분이다.. 코드의 일부에서는 일부분 부수 효과는 있어야 한다는 것을 의미한다.  

**분명하고 의도적인 부수 효과는 괜찮다**  

예제에서 주어지는 코드처럼 분명하고 의도적인 부수 효과로 함수로 메세지를 전달하고 해당 메세지로 캔버스를 업데이트한다.  

이 처럼 의도적인 부수효과는 괜찮지만 예기치 않은 부수 효과는 문제가 된다.  

**예기치 않은 부수 효과는 문제가 될 수 있다**  

예상하지 못한 부수 효과로 getPixel()함수의 캔버스를 다시 그리는 동작(redraw())을 예로 든다.  

비용이 많이 드는 함수이기 때문에 만약 Update에서 getPixel를 연속으로 호출하게 되면 화면이 매우 깜빡일 것이다.  

예제에서 보여주는 예시처럼 다중 쓰레드 코드의 버그로 종종 일어나는 문제이다.  

접근을 lock으로 막아두는 것이 아니라면 잘못된 데이터 값을 취할 수 있기 때문이다.  

*다중 쓰레드 문제와 관련된 버그는 디버깅과 테스트가 어렵기로 악명높다.*  

**부수 효과를 피하거나 그 사실을 분명하게 하라**  

앞서 다룬 부수효과는 소프트웨어에서 빠질 수 없는 부분이긴 하다.  

따라서 적절성 여부를 깊이 따져보고 정말 필요한 코드인지 파악해야한다.  

그럼에도 가장 좋은 방법은 애초에 부수 효과를 일으키지 않는 것이다.  

따라서 함수명에 부수효과에 대한 예측이 가능하도록 작성하는 것이 중요  

#### 입력 매개변수를 수정하는 것에 주의하라  

함수내에서 입력 매개변수를 수정하는 것은 코드 및 버그의 흔한 원인이 될 수 있다.  

**입력 매개변수를 수정하면 버그를 초래할 수 있다.**  

책에서 소개하는 예제와 같이 객체를 다른 함수의 입력으로 넘기는 것은 책에 무슨 짓을 할지 넘겨주는 쪽에서는 알 수 없다.  

**변경하기 전에 복사하리**  

얇은 복사가 아닌 깊은 복사를 의미한다.  

값을 변경하고 싶다면 얇은 복사를 통해 같은 값을 참조하여 변경하는 것이 아닌 새로운 메모리를 할당하여 예기치 못한 동작이나 버그를 방지하는 것  

*성능에 관련한 문제가 생길 수 있다.*  

코딩을 많이 해봤다고 생각하진 않지만 점점 경험하면서 느끼는 점은 책에서 말한 방어적이어야 한다는 부분이 조금 이해가 되는 것 같다.  

#### 오해를 일으키는 함수는 작성하지 말라  

개발자가 코드를 살펴볼 때 주로 인식하게 되는 `코드 계약의 명백한 부분`이 누락되게 되면 예기치 못한 결과를 초래할 수 있다.  

**중요한 입력이 누락되었을 때 아무것도 하지 않으면 놀랄 수 있다.**

대략적인 이해는 가지만.. 코드나 내용을 다시 읽어도 눈에 들어오지 않는다.. ㅠ

**중요한 입력은 필수 항목으로 만들라**

호출하는 쪽에서 호출하기 전에 널값여부를 확인할 필요가 없다.  

앞선 내용에서 이해가 안된 부분이 함수 내부에서 입력에 대한 범위가 커서 생긴 문제라는 걸 알았다.  

null값도 넣을 수 있기 때문에 해당 함수에선 이중 처리를 통해 아무것도 하지 않았지만 해결책에선 입력을 강제하고 고지사항을 항상 표시하도록 만들었다.  

그렇다면 애초에 null값인 경우 default값을 출력하도록 만들면 되는게 아닌지 궁금해진다..  

중복성이나 가독성, 책임이 많아지는 문제, 코드 계약에 관련된 문제일 수 있을지..  

#### 미래를 대비한 열거형 처리  

지금까지 우리가 작성한 코드를 사용하는 쪽에서 코드가 수행하는 일이나 반환값이 그들의 예상을 벗어나지 않도록 하는 데 초점을 맞추었다.  

*우리의 코드에 의존하는 코드가 올바르고 버그가 없도록 하기 위함이었다.*  

책에선 열거형에 대한 다양한 개발자의 의견을 말해준다.  

열거형을 자주 사용하는 입장으로 별다른 생각을 안해봤지만 저자는 좋고 나쁨을 떠나서 사용할 가능성에 대해 말한다.  

**미래에 추가될 수 있는 열것값을 암묵적으로 처리하는 것은 문제가 될 수 있다.**  

예제에서 주어지는 예시처럼 열거형은 이후에 추가되는 값들에 대한 문제가 발생할 수 있다.  

미래에 값이 추가된다고 해서 해당 값에 의존되는 코드들이 전부 에러나 경고를 주지 않기 때문에 잠재적인 문제가 생길 수 있고 이는 큰 문제로 굴러올 수 있기 때문이다.  

**모든 경우를 처리하는 스위치문을 사용하라**  

맨 처음 예제를 보자마자 스위치문으로 처리하면 크게 문제 없지 않나..? 라고 생각했던 해결책이 바로 나온다.  

if문으로 명시적이 아닌 암시적인 방법으로 처리하기 때문이다.  

이를 위한 해결방법은 모든 경우를 다 처리하는 스위치 문을 사용하는 것이다.  

예제에서는 비검사 예외를 발생하기 때문에 단위테스트에서 오류를 잡을 수 있다.  

**기본 케이스를 주의하라**  

else문과 마찬가지로 스위치문의 default케이스를 주의하라  

암시적인 방법이기 때문에 잠재적으로 예기치 않은 문제와 버그가 발생할 수 있다.  

#### 이 모든 것을 테스트로 해결할 수는 없는가?  

예상에 벗어나는 코드를 방지하기 위한 코드 품질 향상 노력에 반대하는 주장을 하는 사람들이 가끔 있다.  

테스트가 이러한 문제를 잡아낼 것이기 때문에 이런 노력은 시간 낭비라는 것이다.  

이것은 현실에서는 별로 효과가 없는 다소 이상주의적인 주장이다..!  

멘토님이나 다른 분들이 많이 이야기 하시는 테스트의 중요성을 다시한번 생각하게 되는 것 같다..  

사실 아직 테스트의 중요성을 많이 못 느끼는 참인데 장의 마무리에서 저자가 이렇게 까지 확정지어서 이야기하니 테스트 코드를 몇번 만들어보는 경험이 필요할 것 같다.  

### 느낀점

1장 2장에서 언급된 코드의 품질에 관련된 내용을 다 풀어서 설명해주니 이해도 잘되고 5장과 마찬가지로 당장 활용해보기도 좋고 적어놓고 다시 읽어보기도 매우 좋은 것 같다.  

널 객체 패턴을 적절하게 사용하는 것이 좋다고 했는데 단점을 많이 알려줘서 그냥 쓰지말라고 경고하는 것 같은 기분이다..  

예상하지 못하는 동작에 대해 많이 설명해줘서 좋았다.  