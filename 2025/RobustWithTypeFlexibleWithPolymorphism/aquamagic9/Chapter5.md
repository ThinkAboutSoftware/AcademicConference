### 5.1 오버로딩
함수 오버로딩이란 같은 이름의 함수를 여러 개 정의하는 것이다. 함수가 오버로딩되어 있을 때 함수를 자동으로 고르는 것을 '함수 선택'이라고 하며 인자의 타입에 맞는 함수를 고른다. 이 역시 다형성으로 같은 이름을 여러 번 정의함으로써 만들어지는 다형성을 오버로딩에 의한 다형성이라고 한다.
```cpp
class Vector {
	List<Int> entries;
}

class SparseVector extends Vector {
	List<Int> nonzeros;
}

Int length(Vector v) {...}
Int length(SparseVector v) {...}

//length 호출시에 인자로 SparseVector를 넣으면 인자 타입이 맞는 경우가 2가지 이지만 인자의 타입에 가장 특화된 SparseVector를 매개변수로 가지는 length함수를 호출한다.
SparseVector v = SparseVector(...);
length(v);

//v의 정적 타입은 Vector이다. v의 동적 타입은 SparseVector이다. 정적 타입과 동적 타입이 다른 경우.
Vector v = SparseVector(...);
//실제로 호출이 되는 length는 Vector를 매개변수로 가지는 length함수이다.
//이유는 대부분의 언어에서는 정적 타입을 바탕으로 선택하는 정적 선택이 일어난다.
length(v);

```
결국 함수 오버로딩을 사용할 때는 정적 선택을 잘 이해해야 한다. 버그를 방지하기 위해서는 서로 완전히 다른 타입들의 값을 인자로 받는 함수를 정의하는 용도로 사용해야 한다.
### 5.2 메서드 오버라이딩
메서드 오버라이딩을 사용하면 서브타입을 위해 더 특화된 동작을 정의하고 정적 타입에 상관없이 언제나 그 특화된 동작이 사용되도록 만들 수 있다.

함수 선택과 메서드 선택의 차이는 함수 선택은 정적 타입만 고려하지만 메서드 선택은 인자의 정적 타입을 고려하면서 수신자(메서드 호출 시 메서드 이름 앞에 오는 객체)의 동적 타입 역시 고려한다. 

**메서드 선택의 한계**
```cpp
class Vector {
	...
	Vector add(Vector that) { ... }
	Vector add(SparseVector that) { ... }
}

class SparseVector extends Vector {
	...
	Vector add(Vector that) { ... }
	Vector add(SparseVector that) { ... }
}

Vector v1 = Vector(...);
Vector v2 = SparseVector(...);
v1.add(v2);

//v2의 정적 타입이 Vector여서 Vector클래스에 정의된 첫번째 add가 호출된다. 이는 덜 효율적인 메서드가 호출되는 것과 같다.

//이를 해결하기 위한 방식은 아래와 같다.
class Vector {
	...
	Vector add(Vector that) { return that._add(this); }
	Vector _add(Vector that) { ... }
	Vector _add(SparseVector that) { ... }
}
class SparseVector extends Vector {
	...
	Vector add(Vector that) { return that._add(this); }
	Vector _add(Vector that) { ... }
	Vector _add(SparseVector that) { ... }
}
```

**메서드 오버라이딩과 결과 타입**
```cpp
class Vector {
	...
	SparseVector add(SparseVector v) { ... }
}
class SparseVector extends Vector {
	...
	Vector add(SparseVector v) { ... }
}

Vector v1 = SparseVector(...);
SparseVector v2 = SparseVector(...);
v1.add(v2).nonzeros ...
//위와 같은 경우 타입 검사기가 참고하는 메서드와 실제 실행 중에 호출되는 메서드가 다르다.
//이런 문제를 해결하기 위해서는 타입 검사기가 참고한 메서드와 다른 메서드가 호출되더라도 참고한 메서드의 결과 타입이 지켜지도록 해야 한다.
```
타입검사기는 정적 타입밖에 모른다. 그래서 수신자의 정적 타입을 바탕으로 참고할 메소드를 정하지만 실행 중에는 수신자의 동적 타입이 호출되는 메서드를 결정한다. 이로 인한 문제를 막으려면, 타입 검사기가 참고한 메서드와 다른 메서드가 호출되더라도 참고한 메서드의 결과 타입이 지켜지도록 해야 한다. 결국 자식 클래스에 있는 메서드의 결과 타입이 부모 클래스에 있는 메서드의 결과 타입의 서브타입이어야 한다.
### 5.3 타입클래스
타입클래스는 특정 타입을 위한 어떤 함수가 존재한다는 사실을 표현한다. 타입클래스는 클래스가 아니며 타입이 만족해야 하는 조건을 표현한다.
```cpp
typeclass Comparable<T> {
	Boolean gt(T v1, T v2);
}
//위 코드는 "어떤 타입 T가 Comparable 타입클래스에 속하려면 매개변수 타입이 (T, T)이고 결과 타입이 Boolean인 함수 gt가 있어야 한다"라는 뜻이다.

instance Comparable<Int> {
	Boolean gt(Int v1, Int v2) { return v1 > v2; }
}
//위 코드는 "타입 Int가 Comparable 타입클래스에 속하며, 타입클래스 Comparable이 요구하는 함수 gt는 v1 > v2를 계산해 반환한다."라는 뜻이다.

instance Comparable<String> {
	Boolean gt(String v1, String v2) { ... }
}

gt(1, 2);
gt("a", "b");
//위와 같이 타입클래스 인스턴스에 정의된 함수는 그냥 오버로딩된 함수처럼 사용 가능.


instance Comparable<List<Int>> {
	Boolean gt(List<Int> v1, List<Int> v2) {
		return v1.length > v2.length;
	}
}
instance Comparable<List<String>> {
	Boolean gt(List<String> v1, List<String> v2) {
		return v1.length > v2.length;
	}
}

//아래는 위의 두 함수를 타입 매개변수를 사용해 한 번에 여러 타입을 특정 타입클래스에 속하게 한 경우이다.
instance <T> Comparable<List<T>> {
	Boolean gt(List<T> v1, List<T> v2) {
		return v1.length > v2.length;
	}
}

//만약 T가 Vector인 경우는 비교가 다른 방식이여야 한다. 그렇기 때문에 T를 제한하는 방식으로 개선하면 다음과 같다.
instance <T> Comparable<List<T>> requires Comparable<T> {
	Boolean gt(List<T> v1, List<T> v2) {
		gt(v1[i], v2[i]) ...	
	}
}
//위 코드는 각각의 타입 T마다 List<T>가 Comparable에 속한다. 단, T가 Comparable에 속할 때만 이라고 이해할 수 있다.
```
타입클래스 대신에 추상클래스에 상한을 지정해 사용할 수도 있다. 하지만 타입클래스만의 장점 두가지가 존재한다. 첫 번째는 라이브러리에 정의된 타입을 특정 추상 클래스의 서브 타입으로 만드는 것은 일반적으로 불가능하지만, 특정 타입클래스에 속하게 만들기는 쉽다. 두 번째로는 제네릭 타입을 타입 인자에 상관없이 항상 만족하는 성질을 표현함과 동시에 특정 타입 인자를 받은 경우에만 만족하는 성질도 표현가능하다.
### 5.4 카인드
\* 카인드는 Int 혹은 String에 속한다.  
\* => \* 카인드는 \* 카인드의 타입을 인자로 받아 \* 카인드의 타입을 만드는 타입으로 ArrayList나 LinkedList가 속한다.  
(\*, \*) => \* 카인드는 Map과 같이 타입 인자 두 개를 받는 타입이 속한다.
```cpp
Int length<T>(ArrayList<T> lst) { ... }
Int length<T>(LinkedList<T> lst) { ... }
Void add<T>(ArrayList<T> lst, T elem) { ... }
Void add<T>(LinkedList<T> lst, T elem) { ... }

Void addUntil<T>(ArrayList<T> lst, T v, Int len) {
	while (length<T>(lst) < len) {
		add<T>(lst, v);
	}
}

Void addUntil<T>(LinkedList<T> lst, T v, Int len) {
	while (length<T>(lst) < len) {
		add<T>(lst, v);
	}
}

//위의 두 함수를 매개변수 다형성을 활용하면 아래와 같이 함축할 수 있다.
Void addUntil<L, T>(L<T> lst, T v, Int len) {
	while (length<T>(lst) < len) {
		add<T>(lst, v);
	}
}
//위 함수의 경우 문제점은 L, T에 들어오는 타입에 대해서 카인드가 정해지지 않아 addUntil<Int, String>과 같이 사용되면 오류가 발생한다.

//아래 함수는 카인드를 사용하여 개선한 경우이다.
Void addUntil<(* => *) L, * T>(L<T> lst, T v, Int len) {
	while (length<T>(lst) < len) {
		add<T>(lst, v);
	}
}

// * => * 카인드에 속하는 모든 타입이 length와 add를 가지고 있지는 않다. 이를 타입클래스를 사용하여 L타입이 length와 add 함수가 반드시 정의되어 있다는 사실을 타입검사기에 알려줄수 있다.
typeclass ListLike<(* => *) L> {
	Int length<T>(L<T> lst);
	Void add<T>(L<T> lst, T elem);
}

instance ListLike<ArrayList> {
	Int length<T>(ArrayList<T> lst) { ... }
	Void add<T>(ArrayList<T> lst, T elem) { ... }
}
instance ListLike<LinkedList> {
	Int length<T>(LinkedList<T> lst) { ... }
	Void add<T>(LinkedList<T> lst, T elem) { ... }
}

//*카인드는 생략 가능하다.
Void addUntil<(* => *) L, T>(L<T> lst, T v, Int len) requires ListLike<L> {
	while (length<T>(lst) < len) {
		add<T>(lst, v);
	}
}
```
### 논의 사항
추상 클래스는 라이브러리에 정의된 타입을 특정 추상 클래스의 서브 타입으로 만드는 것은 일반적으로 불가능하며 클래스에 메서드를 추가할 수 없지만 타입 클래스의 경우에는 특정 타입 클래스에 속하기 만들기 쉽다는 장점이 있습니다.

혹시 라이브러리에 정의된 타입에 메서드를 추가해야했던 경험이 있으실까요? 있을 경우 타입 클래스를 사용한 방법이 아닌 다른 방법도 존재하는지 궁금합니다. 제 생각에는 상속을 통해 메서드를 추가 할 수도 있을 것 같습니다. 다만 이렇게 된다면 조금 상속 구조가 불편해질 것 같다는 생각이 듭니다.