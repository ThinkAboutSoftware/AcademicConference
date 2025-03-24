# 타입으로 견고하게 다형성으로 유연하게
## 4장 - 두 다형성의 만남
---
## [논의 내용]
* 실제 개발에 있어서 어떤 상황에서 공변, 반공변, 불변을 선택해야할까요? 이에 대한 고민을 했었던 사례도 있으셨다면 함께 공유해보면 좋을 것 같습니다!

### 4.1 제네릭 클래스와 상속
서브타입에 의한 다형성과 매개변수에 의한 다형성이 만나면 함께 있을 때만 존재할 수 있는 유용한 기능들이 탄생한다.

**제네릭 클래스를 상속과 함께 사용하는 방법**
어떤 클래스를 상속한 새로운 클래스를 정의하면 기존 클래스에 정의된 필드와 메서드가 새로운 클래스로 자동으로 정의된다.
이는 당연히 제네릭 클래스에도 똑같지만, 타입들 사이의 서브타입 관계는 어떻게 될까?

```java
class ArrayList<T> {
	T get(Int idx) { ... };
	...
}

class LinkedList<T> {
	T get(Int idx) { ... };
	...
}
```

위 코드에서 `ArrayList`와 `LinkedList`는 구현 방법만 다르고 기능은 완전히 같다.
이때 리스트를 다루는 함수를 정의할 때 매개변수 타입을 `ArrayList`로 한다면 연결 리스트는 인자로 받을 수 없어 `LinkedList`로 또 정의해야 한다.
이런 문제를 피하기 위해 두 클래스가 모두 상속하는 추상 클래스를 만들 수 있다.

```java
abstract class List<T> {
	T get(Int idx) { ... };
}

class ArrayList<T> extends List<T> {
	T get(Int idx) { ... };
	...
}

class LinkedList<T> extends List<T> {
	T get(Int idx) { ... };
	...
}
```

`extends List`가 아닌 `extends List<T>`라고 쓰는 이유는 타입 인자가 특정 타입일 때만 상속하는 상황이 생길 수 있기 때문이다.

```java
class BitVector extends List<Boolean> {
	Boolean get(Int idx) { ... };
}
```


### 4.2 타입 매개변수 제한
제네릭 함수를 정의할때, 타입 매겨변수에서 인자로 주어질 값이 특별한 능력을 가진다고 가정할 수 없다. 어떤 타입이 들어올지 알 수 없기 때문이다(3장).
여기서 모든 타입이 가지고 있는 특별하지 않은 능력과 하나의 타입만이 가지고 있는 특별한 능력이라는 두 가지 종류의 능력이 있다는 것을 알 수 있다.
그러나 이 가정이 사실 틀렸다.
모든 타입이 가지고 있지는 않지만, 그렇다고 한 타입만 가지고 있지도 않은, 몇몇 타입이 가지고 있는 능력도 있기 때문이다.

```java
class Person {
	Int age,
	...
}

class Student extends Person { ... }
```

```java
Person elder(Person p, Person q) {
	return (p.age >= q.age) ? p : q;
}
```

이때 Person 타입의 변수를 `elder` 함수를 통해 비교할 수 있다. `Person p = elder(p1, p2);`

문제는 `elder`함수로 더 나이가 많은 학생을 찾으려는 경우에 발생한다. `Student s = elder(s1, s2);`
`elder(s1, s2);` 까지는 타입 검사가 통과하지만, `elder`가 반환한 값을 Student 타입의 변수 s 에 대입하는 데에서 발생한다.
Person은 Student의 서브 타입이 아니기 때문이다.

그렇다고 elder를 제네릭 함수로 만들어도 통과하지 못한다.
age 필드의 값을 읽는 능력이 일부 타입들만 가지고 있는 능력이기 때문이다.
이 상황을 해결하려면 언어의 새로운 기능이 필요하고, 그 기능이 **타입 매개변수 제한**이다.
elder를 타입 매개변수 T를 가진 제네릭 함수로 정의하되 T에 제한을 거는 것이다.
즉 T가 모든 타입이 아니라 Person의 서브타입만 나타낸다는 사실을 타입 검사기에 알리는 것이다.
```java
T elder<T <: Person>(T p, T q) {
	return (p.age >= p.age) ? p : q;
}
```

`T <: Person` 은 타입 매개변수 T의 상한(Upper bound)를 Person으로 지정한 것으로 직관적으로 “T가 최대 Person 타입까지 커질 수 있다”라는 의미다. 

**재귀적 타입 매개변수 제한**
타입 매개변수가 자기 자신을 제한하는 데 사용될 수 있다. 이를 재귀적 타입 매개변수 제한(F-bounded quatification)이라 부른다.

```java
Void sort(List<Int> lst) {
	...
	if (lst.get(i) > list.get(j)) { ... }
	...
}
```
sort 함수는 정수 리스트를 인자로 받아 정렬한다.

다음과 같이 Person 클래스에 나이를 비교하는 gt 메서드가 정의되어 있다면, gt를 호출함으로써 사람들의 리스트를 나이에 따라 정렬할 수 있다.
```java
class Person {
	...
	Boolean gt(Person that) {
		return this.age > that.age
	}
}

Void sort<T>(List<T> lst) {
	...
	if (lst.get(i).gt(list.get(j))) { ... }
	...
}
```

하지만 T가 아무 타입이나 될 수 있으므로 각 원소가 gt 메서드를 가지고 있는지 알 수 없기 때문에 타입 검사를 통과하지 못한다.
이때도 타입 매개변수 제한으로 해결할 수 있다.
```java
abstract class Comparable<T> {
	Boolean gt(T that);
}

Void sort<T <: Comparable<T>>(List<T> lst) {
	...
	if (lst.get(i).gt(lst.get(j))) { ... }
}
```
sort의 타입 매개변수 T는 Comparable<T>를 상한으로 갖는다.
T의 상한에 T 자기 자신이 사용되었으니 이 코드는 ***재귀적 타입 매개변수 제한***의 예다.

### 4.3 가변성
가변성은 제네릭 타입 사이의 서브타입 관계를 추가로 정의하는 기능이다.
하나의 제네릭 타입에서 타입 인자만 다르게 하여 얻은 타입들 사이의 서브타입 관계를 만든다.

```java
Int averageAge(List<Person> people) {
	people.length() ...
	people.get(i).age ...
}
```

이 함수에 사람의 리스트를 인자로 넘기는 데는 문제가 없으나, 학생의 리스트를 averageAge의 인자로 사용하면 타입 검사를 통과하지 못한다.
List<Student>와 List<Person>은 다른 타입이며, List<Student>가 List<Person>의 서브타입이 아니기 때문이다.
이것도 타입 매개변수 제한으로 해결 가능하다.

`Int averageAge<T <: Person>(List<T> people) { ... }`

그러나 이 방법은 매개변수 타입을 List<A>로 하는 대신, 상한이 A인 타입 매개변수 T를 정의하고 매개변수 타입을 List<T>로 해야 한다. 
그래야 B가 A의 서브타입일 때 그 함수가 List<B> 타입의 리스트도 인자로 받을 수 있다.

그냥 B가 A의 서브타입일 때 List<B>가 List<A>의 서브타입이면 안될까?
***결론적으로는 그럴 수도, 아닐 수도 있다.***

```java
abstract class List1<T> {
	T get(Int idx);
}
```

List1은 메서드 하나만 가진다.
List1<Student>가 List1<Person>의 서브타입이어도 될까?
아래는 된다고 가정한 코드다.
```java
List1<Student> students = ...;
List1<Person> people = students;

Person p = people.get(...);
p.age ...
```
여기서는 가정에 문제가 없다.

List2는 새 원소를 추가하는것도 가능하다.
```java
abstract class List2<T> {
	T get(Int idx);
	Void add(T t);
}
```

이 코드가 된다는 가정하에 아래의 코드를 적용해보면,
```java
List2<Stduent> students = ...;
List2<Person> people = students;

people.add(Person(...));
```

이렇게 되면 students에 person 객체를 추가하게 된 것이다.
그러므로 List2<Student> 타입의 리스트인 students에 Person도 들어간 것이다.

```java
Stduent s = students.get(...);
s.gpa ...
```

students 타입은 변함 없이 List<Student>이기 때문에, get의 결과는 Student다.
이때 얻은 객체는 Student라고 판단하고, gpa 필드를 읽을 수 있다.
하지만 이때 Student가 아닌 Person일 수도 있다는 것이다. 그러면 오류가 일어난다.

정리하자면, ***B가 A의 서브타입일 때 List1<B>는 List1<A>의 서브타입이지만, List2<B>는 List2<A>의 서브타입이 아니다.***

해당 결과를 통해 제네릭 타입과 타입 인자 사이의 관계를 분류할 수 있다.
이 분류를 **가변성**이라고 부른다.

첫 번째 가변성은 제네릭 타입이 타입 인자의 서브타입 관계를 보존하는 것이다.
List1이 여기에 해당한다.
제네릭 타입이 타입 인자와 ‘함께 변한다’는 뜻을 담아 이런 가변성을 **공변(convariance)**이라고 한다.

두 번째 가변성은 제네릭 타입이 타입 인자의 서브타입 관계를 무시하는 것이다.
즉, B가 A의 서브타입이어도 List2<B>와 List2<A>가 다른 타입인 것이다.
타입 인자가 서브타입으로 변해도 제네릭 타입은 서브타입으로 ‘안 변한다’는 뜻으로, **불변(invariance)**라고 한다.

세 번째 가변성은 제네릭 타입이 타입 인자의 서브타입 관계를 뒤집는 것이다.
결과 타입을 C로 고정할 때 B가 A의 서브타입이면 B -> C는 A -> C의 슈퍼타입이다.
타입 인자가 A에서 서브타입인 B로 변할 때 A -> C는 타입 인자와는 반대 방향으로 움직여 슈퍼타입인 B -> C로 변한다고도 할 수 있다.
그러므로 제네릭 타입이 타입 인자와 ‘반대로 변한다’는 의미를 담아 **반변(contravariance)**라고 한다.

타입 매개변수를 출력에만 사용하는지, 입력에만 사용하는지, 둘 모두에 사용하는지 보면 가변성을 판단할 수 있다.
