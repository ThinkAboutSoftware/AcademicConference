# 타입으로 견고하게 다형성으로 유연하게
## 3장 - 매개변수에 의한 다형성
---
이번 3장에서 나오는 **제네릭**과 예시들을 통해 다형성으로 인한 유연함을 특히 느낄 수 있었습니다.
**무엇이든 타입**은 코드의 중복을 줄여주는 것에서 장점이 보였습니다.
보통 정적 타입 언어가 제공하는 기능들은 더 많은 프로그램이 문제없이 타입 검사 통과를 돕지만, **무엇인가 타입**은 그 반대로 방해하는 것이 흥미로웠습니다. 
이로써 라이브러리를 제작하는 개발자의 의도가 온전히 사용자에게 전달될 수 있는 좋은 기능이라고 생각했습니다.

### 3.1 제네릭 함수
제네릭스라고도 불리는 타입 매개변수를 통해 다형성을 만드는 기능은 전통적으로는 함수형 언어의 기능이었다.
그러나 많은 필요성으로 인해 요즘은 대부분의 언어가 제공한다.
그만큼 Java나 Go와 같이 기존에 포함되지 않았던 매개변수에 의한 다형성을 추가하는 것은 상당히 어려운 일임에도 어떻게든 추가하려고 노력한다.

***기존 함수***
```java
String choose(String v1, String v2) {
	print(v1);
	print(v2);
	print(...);
	int input = readInt();
	return input == 0 ? v1 : v2;
}
```

***정수를 위한 새로운 함수***
```java
int chooseInt(int v1, int v2) {
	print(v1);
	print(v2);
	print(...);
	int input = readInt();
	return input == 0 ? v1 : v2;
}
```

***서브타입에 의한 다형성을 이용한 함수***
```java
Object chooseInt(Object v1, Object v2) {
	print(v1);
	print(v2);
	print(...);
	int input = readInt();
	return input == 0 ? v1 : v2;
}
```

위와 같이 기존 함수는 String으로 받는 함수에서 정수를 받도록 하는 기능을 위해 함수를 새롭게 정의할 수도 있지만, 이는 새로운 타입마다 매번 함수를 만들어줘야 하므로 번거롭다.

이를 해결하기 위해서는 서브타입에 의한 다형성을 이용하는 것이다.
문자열이나 정수나 모두 최대타입 (Java에서는 Object)에 속하여 `choose("Korean", "English");` `choose(1, 2);` 모두 타입 검사를 통과한다.
하지만 이와 같은 방법도 모든 문제를 해결하지 못한다.

예를 들어 `String` 타입 객체가 가지고 있는 `contains();` 메서드는 타입 검사기 입장에서는 Object를 상속 받는 모든 객체에 포함될 수 있다는 것을 알지 못하기에 거부한다.
```java
choose("hi", "hello").contains("h"); // ERROR
```
위와 같은 타입 검사를 통과하기 위해 매개변수에 의한 다형성을 이용할 수 있다.

```java
T choose<T>(T v1, T v2) {
	print(v1);
	print(v2);
	print(...);
	int input = readInt();
	return input == 0 ? v1 : v2;
}
```


**타입 인자 추론**
매개변수에 의한 다형성으로 코드 중복을 크게 줄일 수 있지만 타입 인자를 명시적으로 써줘야하는 불편한 점이 있다.
```java
choose<Integer>(1, 2);
choose<String>("Korean","English");
```

그러나 대부분의 언어에서 타입 인자 추론을 함께 제공하여 제네릭 함수나 제네릭 메서드를 호출할 때 타입 인자를 생략할 수 있도록 해준다.
```java
choose<>(1, 2);
choose<>("Korean","English");
```


**힌들리-밀너 타입 추론**
제네릭 함수를 사용할 때에서 더 나아가 제네릭 함수를 정의할 때조차 타입 추론을 하는 일부 언어가 있다.
이런 방식의 타입 추론을 ‘힌들리-밀너 타입 추론(Hindley-Milner type inference)’이라 부른다.
이는 타입 매개변수를 쓰지 않아도 함수가 자동으로 제네릭 함수가 될 수 있다는 말이다.

```haskell
function choose(v1, v2) {
	print(v1);
	print(v2);
	print(...);
	int input = readInt();
	return input == 0 ? v1 : v2;
}
```

위 코드는 다음과 같이 타입 검사기가 자동으로 변환해준다.
`T choose<T>(T v1, T v2)`

또한 힌들리-밀너 타입 추론은 제네릭 함수로 만들어어야 할 때와 그렇지 않을 때를 정확히 구분한다.
```javascript
function mult(v1, v2, v3) { 				 // from
	return v1 * v2 * v3;
}

Int mult(Int v1, Int v2, Int v3) {...} 		// to
```

이것이 가능한 이유는 타입 검사기가 다음과 같은 사실을 이용하기 때문이다.
> T가 타입 매개변수일 때 함수 안에서 T 타입의 부품은 아무 특별한 능력도 요구되지 않는 곳에만 사용될 수 있다.
따라서 타입 검사기가 함수 안에서 특별한 능력이 요구되지 않는 매개변수를 하나라도 발견하면 그 함수는 제네릭 함수가 된다.

해당 기능은 아주 편한만큼 개발자에게 양날의 검이 되기 쉽다.
생략이 되어있기 때문에 위의 코드에서 인자로 문자열을 하나 실수로 넣게되면 오류 메시지가 전혀 예상치 못한 내용을 담고 있어 이해하기 어려울 수 있다.

### 3.2 제네릭 타입
함수뿐만이 아니라, 타입에 타입 매개변수를 추가하고 이는 제네릭 타입(generic type)이 된다.
```java
List<Integer> lst = List.of(1, 2);
Map<Integer, String> m = Map.of(1, "one", 2, "two");
```

**제네릭 클래스**
제네릭 클래스는 타입 매개변수를 가진 클래스다. 
정의할 때는 제네릭 함수와 비슷하게 타입 매개변수를 명시하고, 사용할 때는 제네릭 타입으로서 리스트나 맵과 비슷한 방식으로 사용된다.

```java
class Chooser<T> {
	T v1;
	T v2;
	T choose() {
		print(v1);
		print(v2);
		print(...);
		int input = readInt();
		return input == 0 ? v1 : v2;
	}
}
```


### 3.3 무엇이든 타입
```java
T randUniform<T>(List<T> lst) { ... }
T randGeometric<T>(List<T> lst) { ... }

void simulate(??? rand) {
	...
	Int number = rand(List<Int>(30, 35, 40, 45));
	...
	String species = rand(List<String>("Gazelle", "Lion", "Zebra"));
	...
}

simulate(randUniform);
simulate(randGeometric);
```

이때 `simulate`의 매개변수 rand가 무슨 타입을 가져야하는지 문제가 생긴다.
`List<Int> => Int` 는 `rand(List<Int>(30, 35, 40, 45));`에서 타입 검사를 통과하겠지만, `rand(List<String>("Gazelle", "Lion", "Zebra"));`에서는 그러지 못하고, 반대도 마찬가지다.
`List<Any> => Any`도 문제가 생긴다.
rand가 아무 값이나 가지는 리스트를 인자로 받을 수 있게 된다는 점에서 나아지기는 하지만, 결과 타입이 Any라는 새로운 문제가 생긴다.
`rand(List<Int>(30, 35, 40, 45));` , `rand(List<String>("Gazelle", "Lion", "Zebra"));` 는 통과하지만, `Int number = rand(List<Int>(30, 35, 40, 45));`과 같은 것은 통과하지 못한다.

**무엇이든 타입**을 사용하면 해결이 가능하다.

```java
void simulate(forall T.(List<T> => T) rand) {
	...
	Int number = rand<Int>(List<Int>(30, 35, 40, 45));
	...
	String species = rand<String>(List<String>("Gazelle", "Lion", "Zebra"));
	...
}

simulate(randUniform);
simulate(randGeometric);
```

T.A -> T는 타입 매개변수, A는 타입이며 이것을 무엇이든 타입이라고 부른다.
rand의 타입이 `List<T> => T` 형태인데 T가 ‘무엇이든’ 될 수 있다는 것이다.

### 3.4 무엇인가 타입
예를 들어 라이브러리를 제작한 사람은 언제나 바꿀 수 있는 타입이다.
그리고 라이브러리 사용자에게 숨겨야하는 것이다.
즉 타입이 되는 ‘무엇인가’가 존재한다고만 알려 주는 것이다.
그러므로 라이브러리 사용자는 타입이 되는 ‘무엇인가’가 있다는 사실은 알지만, 그 타입이 특정한 타입이라는 기대를 가지고 코드를 짤 수는 없다.

```scala
class Timestamper {
	Int init() { return 0;}
	Int next(Int t) { return t + 1; }
	Bool cmp(Int t1, Int t2) { return t1 < t2};
}

exists T.{ T init(); T next(T t); Bool cmp(T t1, T t2); } create() {
	return Timestamper;
}
```

이 타입은 create가 반환하는 타입이 `{ T init(); T next(T t); Bool cmp(T t1, T t2); }` 형태라는 사실을 나타낸다. 
여기서 T가 무엇인지는 알 수 없다.
 그저 create가 반환하는 타입이 저것이라는 사실이 되도록 만드는 T가 ‘무엇인가’ 존재한다는 사실만 알려 줄 뿐이다. 

```scala
exists T.{ T init(); T next(T t); Bool cmp(T t1, T t2); } t = create();

List<t.T> ts = ...;
...
if (ts[d] < ts[e]) { ... }
```

위와 같이 라이브러리 사용자는 타입 검사를 통과하지 못한다.
ts[d]와 ts[e]의 타입은 타임스탬프의 타입으로, 이 타입에 해당하는 ‘무엇인가’가 존재한다는 사실만 알 수 있다.
즉 타입이 Int인지 알 수 없기 때문에 if 문에서 검사를 통과하지 못한다.
그럼으로서 라이브러리 사용자는 `cmp()`를 사용하도록 강제할 수 있다.

## [논의 내용]
* 무엇인가 타입은 타입 검사를 실패하는 쪽으로 유도하면서 해당 코드 사용 방향을 제한하는 것이 예시에서 나온 것처럼 어떤 라이브러리를 작성하는 데에 좋은 타입인 것 같습니다. 
  이것과는 조금 다른 방향이지만 자바의 Collection과 같은 곳에서 제네릭을 적극적으로 사용되고 있는 것은 알고 있습니다.
  저는 아직 회사나 프로젝트에서 코드를 작성할때 생각보다 제네릭을 사용하게 되는 일이 적은데, 다른 분들은 사용하실때 어떤 기준, 상황에서 사용하시는지 궁금합니다!