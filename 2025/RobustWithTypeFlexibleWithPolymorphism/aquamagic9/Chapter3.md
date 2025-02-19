### 3.1 제네릭 함수
매개변수에 의한 다형성은 타입 매개변수를 통해 다형성을 만들며 generics 라고도 부른다.

매개변수에 의한 다형성을 언어에 추가하는 것은 언어에 큰 변화를 가져오기에 어려운 일이지만 그럼에도 추가하려고 노력하며 정적 타입 언어에 있어 중요하다.

```cpp
String choose(String v1, String v2) {
	print(v1); print(v2); print(...);
	Int input = readInt();
	return (input == 0) ? v1 : v2;
}

Int chooseInt(Int v1, Int v2) {
	print(v1); print(v2); print(...);
	Int input = readInt();
	return (input == 0) ? v1 : v2;
}

//위의 두 함수를 아래와 같이 제네릭을 사용하여 매개변수에 의한 다형성 문제를 해결 할 수 있다.
T choose<T>(T v1, T v2) {
	print(v1); print(v2); print(...);
	Int input = readInt();
	return (input == 0) ? v1 : v2;
}

//만약 제네릭이 아닌 타입을 Any로 받았다면 return 도 Any 타입이 되어 실제로 어떤 타입인지 알 수 없게 된다.
```

```cpp
T mult<T>(T v1, T v2, T v3) {
	return v1 * v2 * v3;
}
```
T가 타입 매개 변수일 때 함수 안에서 T 타입의 부품은 아무 특별한 능력도 요구되지 않는 곳에만 사용될 수 있다. 따라서 타입 검사기는 T타입의 부품을 곱셈에 사용한 위의 mult 함수를 거부한다. 결국 인자로 받은 값이 함수 안에서 특정 능력이 필요한 자리에 사용된다면 그 함수가 제네릭 함수가 될 필요가 없다.

**타입 인자 추론**   
매개 변수에 의한 다형성을 제공하는 대부분의 언어는 타입 인자 추론을 함께 제공한다. 타입 인자 추론은 타입 추론의 일종으로, 제네릭 함수나 제네릭 메서드를 호출할 때 개발자가 타입 인자를 생략할 수 있도록 하는 기능이다.
```cpp
choose<Int>(1, 2);
//위와 같은 함수 호출을 아래와 같이 타입인자를 생략하여 호출 가능
choose(1, 2);
```
타입 인자 추론이 언제나 원하는 대로 되지 않을 수 있다는 점을 인지하고 사용해야 한다.

**힌들리-밀너 타입 추론**  
힌들리-밀너 타입 추론은 제네릭 함수를 정의할 때조차 타입 추론을 하는 것으로 일부 언어(오캐멀, 하스캘)에서 사용된다. 이는 타입 매개변수를 쓰지 않아도 함수가 자동으로 제네릭 함수가 될 수 있다는 말이다.
```cpp
//힌들리-밀너 타입 추론은 매개변수 타입과 결과 타입까지도 추론하기에 다음과 같이 함수를 정의할 수 있다.
function choose(v1, v2) {
	print(v1); print(v2); print(...);
	Int input = readInt();
	return (input == 0) ? v1 : v2;
}

// 타입검사기가 알아서 위코드를 아래와 같이 바꾼다.
T choose<T>(T v1, T v2) { ... }
```
힌들리-밀너는 굉장히 똑똑해서 제네릭 함수로 만들어야 할 때와 그렇지 않을 때를 정확하게 구분한다.
```cpp
// 매개변수 타입과 인자 타입을 모두 생략하고 적었을 때
function mult(v1, v2, v3) {
	return v1 * v2 * v3;
}

//타입 검사기는 mult를 제네릭 함수로 만들지 않는다. 타입 매개변수는 하나도 추가하지 않은 채 매개변수들의 타입과 결과 타입을 모두 Int로 만든다.
Int mult(Int v1, Int v2, Int v3) { ... }
```
힌들리-밀너 타입 추론은 간편한 장점이 있으면서도 이런 기능을 모르고 함수를 정의 한다면 의도치않게 제네릭 함수가 만들어질 수도 있기에 주의해야 한다.
### 3.2 제네릭 타입
타입에 타입 매개변수를 추가하면 제네릭 타입이 된다.
```cpp
List integers = List(1, 2, 3, 4, 5);
List countries = List("Korea", "Japan", "China");

Int sum(List lst) {
	Int res = 0;
	for (Int i = 0; i < lst.length; i++) {
		res = res + lst[i];
	}
	return res;
}
//lst 타입이 모든 List를 나타내기 때문에 res + lst[i] 부분에서 문제가 발생 할 수 있어 타입검사기가 거부한다.

List<Int> integers = List<Int>(1, 2, 3, 4, 5);
Int sum(List<Int> lst) {
	Int res = 0;
	for (Int i = 0; i < lst.length; i++){
		res = res + lst[i];	
	}
	return res;
}
sum(integers);
//위와 같이 List<Int>로 변경하여 타입검사기가 lst[i]가 Int임을 알아내어 아무 문제 없는 코드로 간주한다.
```
### 3.3 무엇이든 타입
무엇이든 타입을 어떤 사람들은 '보편 양화 타입'이라 번역한다.
```cpp
T randUniform<T>(List<T> lst) { ... }
T randGemetric<T>(List<T> lst) { ... }

Void simulate(??? rand) {
	...
	Int number = rand(List<Int>(30, 35, 40, 45));
	...
	String species = rand(List<String>("Gazelle", "Lion", "Zebra"));
	...
}
simulate(randUniform);
simulate(randGeometric);
//위와 같을 경우 오류 발생(rand 타입이 정해지면 List<Int> 혹은 List<String> 둘 중 하나를 타입검사기에서 통과하지 못함.)
//???에 들어갈 것이 제네릭 함수여도 마찬가지이다.(List<T> => T rand 여도 위와 같은 이유로 타입검사 통과 못함.)

//아래와 같이 무엇이든 타입인 forall T.(List<T> => T) 로 해결 가능.
//타입이 아직 정해지지 않은 상태의 rand를 넘겨서 타입검사를 통과할 수 있게 된다.
Void simulate(forall T.(List<T> => T) rand) {
	...
	Int number = rand<Int>(List<Int>(30, 35, 40, 45));
	...
	String species = rand<String>(List<String>("Gazelle", "Lion", "Zebra"));
	...
}
simulate(randUniform);
simulate(randGeometric);
```
정리하면 무엇이든 타입을 제네릭 함수의 타입이라고 할 수 있다. 제네릭 함수를 값으로 사용하면 그 타입이 무엇이든 타입이 되고, 무엇이든 타입의 값을 사용할 때는 제네릭 함수를 사용하듯 하면 된다.

무엇이든 타입이 없는 언어여도 제네릭 메서드가 있다면 비슷한 코드를 작성할 수 있다.
```cpp
class RandUniform {
	T rand<T>(List<T> lst) { ... }
}

class RandGeometric {
	T rand<T>(List<T> lst) { ... }
}

Void simulate({ T rand<T>(List<T> lst); } r) {
	...
	Int number = r.rand<Int>(List<Int>(30, 35, 40, 45));
	...
	String species = r.rand<String>(List<String>("Gazelle", "Lion", "Zebra"));
}

simulate(RandUniform());
simulate(RandGeometric());
```
simulate의 매개변수가 { T rand\<T>(List\<T> lst); } 인데 이는 이 타입의 시그니처가 T rand\<T>(List\<T> lst) 인 메서드를 가지는 객체를 나타낸다. (구조를 드러내는 타입을 사용)

무엇이든 타입을 사용하는 이유는 결국 제네릭 메서드를 가진 객체를 인자로 넘길 수 있지만 이 보다는 제네릭 함수를 바로 인자로 넘기는 편이 더 간결하기 때문이다 .
### 3.4 무엇인가 타입
무엇인가 타입은 '존재 양화 타입'이라고 번역할 수 있다. 

```cpp
class Timestamper {
	String init() { return "a"; }
	String next(String t) { return t + "a"; }
	Bool cmp(String t1, String t2) { return t1.length < t2.length; }
}

//무엇인가 타입
exists T.{ T init(); T next(T t); Bool cmp(T t1, T t2); } t = create();

List<t.T> ts = ...;
...
if (ts[d] < ts[e]) { ... }
//ts[d] < ts[e]에서 타입검사기를 통과하지 못함. 이유는 무엇인가 타입이기 때문에 무엇이 들어있는지 알 수 없다. 아래와 같이 변경해야 함.
if (t.cmp(ts[d], ts[e])) { ... }
```

Int라는 타임스탬프의 타입이 라이브러리 사용자에게 노출되는 것은 라이브러리를 만드는 입장에서 바람직하지 않다. 라이브러리 사용자의 코드가 타임스탬프의 Int로 사용했는데 라이브러리 코드를 고치면, 프로그램의 동작이 달라지거나 아예 타입 검사를 통과하지 못하게 될 수도 있기 때문이다.

타임스탬프의 타입을 라이브러리 사용자에게 숨겨서 타임스탬프의 타입이 되는 '무엇인가'가 존재한다고만 알려준다. 결국 라이브러리 사용자는 타임스탬프의 타입이 되는 '무엇인가'가 있다는 사실은 알지만, 그 타입이 특정한 타입이라는 기대를 가지고 코드를 짤 수는 없다.

일반적으로 정적 타입 언어가 제공하는 기능들은 더 많은 프로그램이 문제없이 타입 검사를 통과할 수 있도록 돕는다. 반면에 무엇인가 타입의 역할은 정반대이다. 오히려 타입 검사를 통과할 수 있는 프로그램이 타입 검사를 통과하지 못하도록 방해한다. 이는 보통 필요 없는 능력이지만 라이브러리를 만드는 상황 같은 경우에 사용자의 행동을 제약할 필요가 있어 이럴 경우 필요하다.

무엇인가 타입의 값은 만들기 쉽지만 사용하기 어려운 최대 타입인 Any와 닮았고, 무엇이든 타입의 값은 만들기는 어려워도 사용하기는 쉬운 최소 타입인 Nothing과 닮았다.

### 논의사항
1. 힌들리-밀러 타입 추론은 제네릭 함수를 정의할 때 타입 추론이 일어나 타입 매개변수를 쓰지 않아도 함수가 자동으로 제네릭 함수가 됩니다. 이런 기능이 생겨난 이유는 해당 기능이 있는 언어(하스켈, 오캐멀 등)로 개발을 하는 과정 중 제네릭을 사용하는 경우가 많기 때문일까요? 아니면 기능을 먼저 만들어 놓은 편에 속할까요? 사용하는 경우가 많다면 무엇 때문에 제네릭을 많이 사용하게 되었을까요? 