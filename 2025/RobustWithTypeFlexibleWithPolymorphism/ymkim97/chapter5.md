# 타입으로 견고하게 다형성으로 유연하게
## 5장 - 오버로딩에 의한 다형성
---
이번 5장을 읽으면서 친숙하게 느꼈던 오버로딩과 오버라이딩을 다시 한번 정리하면서 읽을 수 있어 좋았습니다.
그러나 함수형 프로그래밍에서 나오는 개념인 타입클래스를 처음으로 접하면서 기존에 알던 인터페이스와 생각보다 명확하게 구분하기 어려웠고 아직도 조금씩 헷갈리네요.

전체적으로 책을 읽으면서 정적 타입 자체에 대한 어려움보다는 저에게 익숙하지 못한 Functional Programming의 특징, 철학 등에서 어려움을 느꼈던 것 같습니다. 그만큼 너무 OOP에만 집중했던 제 모습을 돌아보며 FP에 대해 더 생각해보고 새로운 시야와 생각을 가질 수 있게 되었습니다.

### 5.1 오버로딩
함수 오버로딩(function overloading)은 한 함수가 여러 타입의 인자를 받아야 할 때 이거나 타입(2장)보다 훨씬 간단하고 직관적인 해결책을 제공하는 기능이다.
함수 오버로딩이란 같은 이름의 함수를 여러 개 정의하는 것이다.
이때 이름이 같은 함수들의 매개변수 타입은 서로 달라야 한다.

***이거나 타입 사용***
```java
void write(Cell cell, String | Int data) {
	if (data is String) {
		...
	} else {
		...
	}
}
```

***오버로딩 사용***
```java
void write(Cell cell, String data) {
	...
}

void write(Cell cell, Int data) {
	...
}
```

함수가 오버로딩되어 있을 때 호출할 함수를 자동으로 고르는 것은 **함수 선택(function dispatch)**라고 부른다.

함수 오버로딩은 다형성을 만들어 내는 세 번째 방법이다.
`write`라는 이름은 `(Cell, String) => Void` 타입이면서 `(Cell, Int) => Void` 타입인 것으로 이해할 수 있다.
`write`라는 하나의 대상이 여러 타입을 가지는 것으로 이것도 다형성이다.
이렇게 같은 이름을 여러 번 정의함으로써 만들어지는 다형성을 오버로딩에 의한 다형성(ad hoc polymorphism)이라 부른다.

**가장 특화된 함수**
위 `write` 함수 예에서는 어느 함수가 호출될지 항상 명확하다.
그러나 서브타입에 의한 다형성이 추가되면 상황이 복잡해진다.

```java
class Vector {
	List<Int> entries;

	Int length(Vector v) { // 벡터의 길이 구하는 기능 - 원소 각각 제곱, 합산 후 제곱근
		v.entries[i]...
	}
}

class SparseVector extends Vector {
	List<Int> nonzeros; // 희소 벡터 - 0이 아닌 entries의 index를 담음

	Int length(SparseVector v) {
		v.entries[v.nonzeros[i]] ...
	}
}
```

다음과 같이 두 개의 오버로딩된 함수가 나온다.
```java
Int length(Vector v) { ... }
Int length(SparseVector v) { ... }
```

일반적인 벡터의 길이를 계산할 때는 어렵지 않다.
```java
Vector v = Vector(...);
length(v);
```
인자 타입이 Vector이고, 첫 함수의 매개변수 타입도 Vector이며 두 번째 함수의 매개변수 타입은 SparseVector 이므로 첫 번째 함수가 선택된다.

하지만 희소 벡터의 길이를 계산하려고 하면 새로운 고민거리가 생긴다.
```java
SparseVector v = SparseVector(...);
length(v);
```

인자 타입이 SparseVector 인 경우 두 length 함수 모두 호출 가능하다.
SparseVector가 Vector의 **서브타입이기 때문**이다.

이럴때 ‘인자의 타입에 가장 특화된 (most specific) 함수를 고른다’라는 규칙이 적용된다.
두 번째 함수는 희소 벡터의 길이만 구할 수 있는 함수이므로 첫 번째 함수보다 희소 벡터에 더 특화된 함수라고 볼 수 있다.
따라서 두 번째 length 함수가 호출된다.

SparseVector는 Vector의 서브타입이지만, Vector는 SparseVector의 서브타입이 아니다.
즉, 한 함수가 다른 하나보다 더 특화되었다는 말은 한 함수의 매개변수 타입이 다른 함수의 매개변수 타입의 서브타입이라는 뜻이다.

함수 오버로딩은 서로 완전히 다른 타입들의 값ㅇ르 인자로 받는 함수를 정의하는 용도로 사용하는 것이 좋다.
정수와 문자열을 인자로 받는 `write` 함수가 좋은 예다.
그러나 `length` 함수처럼 특정 타입의 서브타입을 위해 더 특화된 동작을 정의하는 게 목표라면 오버로딩은 좋은 선택지가 아니다.
그런것을 하고 싶을때는 다음절에 나오는 메서드 오버라이딩(method overriding)이 그 해답이다.

### 5.2 메서드 오버라이딩
다음 코드는 메서드 오버라이딩을 사용하지 않는다.
```java
class Vector {
	...
	Int length() { ... }
}

class SparseVector extends Vector { ... }

Vector v = Vector(...);
v.length();

SparseVector v = SparseVector(...);
v.length();
```

문제는 length의 동작이 Vector 클래스에서 정의한 그대로라는 것이다.

메서드 오버라이딩은 클래스를 상속해서 자식 클래스에 메서드를 새로 정의할 때 메서드의 이름과 매개변수 타입을 부모 클래스에 정의되어 있는 메서드와 똑같게 정의하는 것을 말한다.

```java
class Vector {
	...
	Int length() {...}
}

class SparseVector extends Vector {
	...
	Int length() {...}
}
```

***정적 타입과 동적 타입이 일치하는 경우***
```java
Vector v = Vector(...);
v.length();

SparseVector sv = SparseVector(...);
sv.length();

// sv는 SparseVector 객체이므로 두 번째 length가 호출된다.
```

***정적 타입과 동적 타입이 다를 경우***
```java
Vector v = SparseVector(...);
v.length();

// v가 SparseVector 객체이므로 바로 직전 예와 마찬가지로 두 번째 length 메서드가 호출된다.
```
v의 정적 타입은 Vector지만, 어떤 length를 호출하느냐에 영향을 주는 요소는 v의 정적 타입이 아닌 동적 타입이다.
즉, v가 실제로 나타내는 값에 따라 가장 특화된 메서드가 저절로 선택되는 것이다.

해당 내용으로 알 수 있는 것은, 메서드 오버라이딩을 사용한 경우에도 메서드 선택이 일어난다는 것이다.

**메서드 오버라이딩과 결과 타입**
지금까지는 매개변수 타입에만 집중해 왔지만 결과 타입에도 원하는 아무 타입이나 사용할 수 있다(함수).
```java
String write(Cell cell, String str) { ... }
void write(Cell cell, Int num) { ... }
```

그러나 메서드를 오버라이딩 할 때는 자식 클래스에 정의한 메서드의 결과 타입이 부모 클래스에 원래 있는 메서드의 결과 타입의 서브타입이어야 한다.

### 5.3 타입클래스
```java
Boolean gt(Int v1, Int v2) { return v1 > v2; }
Boolean gt(String v1, String v2) { ... }
Boolean gt(Person v1, Person v2) { ... }

Void sort<T>(List<T> lst) {
	...
	if (gt(lst[i], lst[j])) { ... }
	...
}
```

위 코드는 타입 검사를 통과하지 못한다.
T는 아무 타입이나 나타낼 수 있으니 T 타입의 값이 gt의 인자로 사용될 수 있다는 보장이 없기 때문이다.
비슷한 문제를 4장에서도 겪었고, 해결 방안으로 Comparable 이라는 추상 클래스를 정의한 뒤 Comparable<T>를 T의 상한으로 지정하는 것이었다.

```java
abstract class Comparable<T> { Boolean gt(T that); }
Void sort<T <: Comparable<T>>(List<T> lst) { ... }
```

이를 통해 T의 상한이 Comparable<T> 라는 것은 T 타입의 값이 T 타입의 값을 인자로 받는 gt 메서드를 가져야 한다는 사실을 표현한다.

이번에도 비슷하게 매개변수 타입이 (T, T)인 gt 함수가 있어야 한다는 조건을 표현하기를 원한다.
이는 지금까지 본 개념만으로는 할 수 없는 일이다.
이럴 때 필요한 게 **타입클래스(Typeclass)**다.

타입클래스는 특정 타입을 위한 어떤 함수가 존재한다는 사실을 표현한다.
용어에 ‘클래스’가 포함되기는 하지만, 타입클래스는 클래스와 관련이 없다.
타입클래스를 정의할 때는 정의하려는 타입클래스의 이름, 타입 매개변수, 함수 목록을 명시해야 한다.

```java
typeclass Comparable<T> {
	Boolean gt(T v1, T v2);
}
```

이 코드의 뜻은 “어떤 타입 T가 Comparable 타입클래스에 속하려면 매개변수 타입이 (T, T)이고 결과 타입이 Boolean인 함수 gt가 있어야 한다” 라는 뜻이다.

특정 타입을 어떤 타입클래스에 속하게 만들고 싶다면 타입클래스 인스턴스를 정의해야 한다.
타입 클래스 인스턴스를 정의할 때는 해당 타입과 타입클래스의 이름을 명시한 뒤 타입클래스가 요구하는 함수를 모두 정의하면 된다.

```java
instance Comparable<Int> {
	Boolean gt(Int v1, Int v2) { return v1 > v2; }
}
```

```java
Void sort<T>(List<T> lst) requires Comparable<T> {
	...
	if (gt(lst[i], lst[j])) { ... }
	...
}
```

`requires Comparable<T>`를 덧붙임으로써 T가 Comparable에 속해야 한다는 조건을 달았다.
그러면 시그니처가 `Boolean gt(T v1, T v2)` 인 함수가 존재한다는 사실을 알고 있는 상태에서 타입 검사기가 sort의 몸통을 검사한다.
따라서 `gt(lst[i], lst[j])`가 검사를 통과하며, gt가 반환한 값을 if에 사용하는 것 역시 검사를 통과한다.

List<T> 타입의 리스트를 sort에 인자로 넘기려면 T가 Comparable에 속해야 한다.
```java
sort<Int>(List<Int>(1, 2, 3, 4));
sort<String>(List<String>("a", "b", "c"));
sort<Person>(List<Person>( ... ));
```

타입클래스의 장점으로는 다음과 같이 있다.
1. 라이브러리에 정의된 타입을 특정 추상 클래스의 서브타입으로 만드는 것은 일반적으로 불가능하지만, 특정 타입클래스에 속하게 만들기는 매우 쉽다.
2. 추상 클래스로는 특정 타입 인자를 받은 제네릭 타입만이 만족하는 성질을 표현하기 어렵지만 타입클래스로는 싑게 가능하다.

### 카인드
카인드는 매개변수에 의한 다형성을 설명한 3장에서 다뤘어야 하나 타입클래스가 있어야 유용성이 잘 드러난다.
카인드는 곧 타입의 타입인 셈이다.
첫 번째 종류의 타입은 `*`라는 카인드에 속한다. “Int의 카인드는 *이다” 와 같이 말할 수 있다.
두 번째 종류의 타입은 `* => *`라는 카인드에 속한다. `*`카인드의 타입을 타입 인자로 받아 `*` 카인드의 타입을 만드는 타입을 나타낸다. ArrayList, LinkedList 등이 여기에 속한다.
카인드의 수는 무수히 많고 끝도 없이 만들 수 있으며 여기서 재귀가 생각났다.


## [논의 내용]
* 가장 특화된 함수의 선택 규칙을 보면서 Java를 비롯하여 다양한 언어에서 사용되는 동적 디스패치(Dynamic dispatch)가 생각났습니다. 프레임워크인 Spring에서도 비슷한 느낌으로 ‘구체적인 타입을 우선 참조하는 패턴’이 보입니다.
1. 빈 (Bean) 주입 시, 더 구체적인 타입이 우선
```java
@Component
class ParentService {}

@Component
class ChildService extends ParentService {}

@Component
class MyComponent {
    private final ParentService service;

    @Autowired
    public MyComponent(ParentService service) {
        this.service = service;
    }
}

// 특정 빈(@Qualifier)을 지정하지 않으면 더 구체적인 타입인 ChildService가 주입
```
2. ExceptionHandler의 우선순위
```java
@ControllerAdvice
class GlobalExceptionHandler {
    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleException(Exception e) {
        return ResponseEntity.status(500).body("General Error");
    }
}

@ControllerAdvice
class SpecificExceptionHandler {
    @ExceptionHandler(NullPointerException.class)
    public ResponseEntity<String> handleNPE(NullPointerException e) {
        return ResponseEntity.status(400).body("Null Pointer Error");
    }
}

// NullPointerException 이 발생하면 SpecificExceptionHandler의 handleNPE가 호출됨 (더 구체적인 타입).
```

저와 같은 생각해보신 분이 있으시거나, 다른 언어나 프레임워크들을 사용해보시면서 위 스프링과 같은 패턴을 겪어 보셨으면 경험을 공유해보고 싶습니다.