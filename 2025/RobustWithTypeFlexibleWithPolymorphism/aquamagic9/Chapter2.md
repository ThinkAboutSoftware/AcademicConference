### 2.1 객체와 서브 타입
서브 타입에 의한 다형성은 객체를 다룰 때 유용하다. 객체라는 개념이 있는 정적 타입 언어라면 대개 서브 타입에 의한 다형성도 제공한다.
```cpp
class Person {
	String name;
	String email;
	Int id;
}

class Student extends Person {
	Int grade;
	Float gpa;
	Boolean paid;
}

void sendEmail(Person person, String title, String content){
	String email = person.email;
	...
}

for (Int i = 0; i < students.length; i++){
	Student st = students[i];
	if (!st.paid){
		sendEmail(st, ... , ...);	
	}
}
```
만약 서브 타입에 의한 다형성이 없었을 경우에 위 코드는 타입 검사를 통과하지 못한다. st의 타입을 Person으로 간주 할 수 있게 만들어주는 서브 타입에 의한 다형성이 존재하기 때문에 통과되는 것이다.

서브 타입은 "A는 B다"라는 타입 사이의 관계다. 서브 타입에 반대되는 의미로 슈퍼 타입이라는 용어를 사용한다. A가 B의 서브 타입이면 B는 A의 슈퍼 타입이다. A가 B의 서브 타입일 때 A타입의 부품을 B타입의 부품으로도 간주 할 수 있게 하는 기능이 서브 타입에 의한 다형성이다. 즉, B타입의 부품이 요구되는 자리에 A타입의 부품이 오더라도 타입 검사기가 문제 삼지 않는다.

서브 타입에 의한 다형성을 제공해도 타입 검사기가 문제 삼지 않는 이유는 무엇인가? 이에 대한 답은 학생은 사람이다 라는 말을 통해 이해가 가능하다.  Student가 Person의 서브 타입이므로 Person 타입의 부품이 가진 능력을 Student 타입의 부품도 가지고 있다. 그러나 반대 방향으로는 적용되지 않는다. Student의 타입 부품이 가진 능력을 Person의 타입 부품이 갖고 있지 않을 수도 있기 때문이다.

**타입 검사기가 객체 타입의 서브 타입 관계를 판단할 때 사용하는 규칙**
1. 이름에 의한 서브 타입 => 타입이 알려주는 이름을 바탕으로 서브 타입 관계를 판단.
2. 구조에 의한 서브 타입 => 타입이 알려주는 구조를 바탕으로 서브 타입 관계를 판단.

**이름에 의한 서브 타입**
이름에 의한 서브 타입을 사용하는 경우, 타입 검사기는 타입이 보여주는 클래스의 이름과 클래스 사이의 상속 관계만 고려한다. 그 클래스에 어떤 필드와 메소드가 있는지는 고려하지 않는다. 서브 타입 판단 규칙은 클래스 A가 클래스 B를 상속한다면 A가 B의 서브 타입이다. 여기서 상속을 직접 상속과 간접 상속을 포함한다. Person과 Student의 예가 직접 상속이고 간접 상속은 상속하는 클래스를 또 상속하는 경우를 말한다.

**구조에 의한 서브 타입**
이미 정의된 클래스를 수정 할 수 없는 경우에는 이름에 의한 서브 타입만으로는 부족할 수 있다. 이럴 때 구조에 의한 서브타입이 필요하다.
```cpp
/* 라이브러리 1 */
class Person{
	String name;
	String email;
	Int id;
}

/* 라이브러리 2 */
class Student {
	String name;
	String email;
	Int id;
	Int grade;
	Float gpa;
	Boolean paid;
}

Void sendEmail(Person person, String title, String content) {
	String email = person.email;
	...
}
```
두 라이브러리가 별개로 개발되어 위와 같이 Student 클래스가 Person 클래스를 상속하지 못하였지만 이름, 메일, id가 중복되는 경우 구조에 의한 서브 타입으로 해결 가능하다. 구조에 의한 서브 타입을 사용하는 경우 타입 검사기는 클래스 사이의 상속 관계 대신 클래스의 구조, 즉 각 클래스에 어떤 필드와 메서드가 있는지 고려한다. 클래스 A가 클래스 B에 정의된 필드와 메서드를 모두 정의한다면 A는 B의 서브 타입이다.

위의 코드에서 Student의 id만 빠져있다면 Student가 Person의 서브 타입이 아니게 된다. 따라서 Student 타입의 객체를 sendEmail 함수에 인자로 넘길 수 없다. sendEmail 함수에서 email 필드만 사용한다고 하더라도 다른 함수에서는 id필드를 읽으려고 할 수도 있는데 이러면 오류가 발생해 Student를 Person의 서브 타입으로 인정하지 않아야 한다.

위의 문제를 해결하는 방법 중 하나는 아래와 같이 새로운 클래스를 정의 하는 것이다.
```cpp
class HasEmail {
	String email;
}

Void sendEmail(HasEmail he, String title, String content){
	String email = he.email;
	...
}
```
이렇게 해결 할 수도 있으나 sendEmail의 매개 변수 타입을 표시하려고 새 클래스를 정의한다는 것은 조금 번거롭다.

해결 하는 또 다른 방법으로 아래와 같이 구조를 드러내는 타입을 사용하는 방법이 있다.
```cpp
Void sendEmail( { String email; } person, String title, String content){
	String email = person.email;
	...
}
```

추상 메서드는 몸통 없이 이름, 매개변수 타입, 결과 타입만 작성된 메서드다.
```cpp
abstract class EmailDst {
	void sendEmail(String title, String content);
}
```
EmailDst에 sendEmail이라는 추상 메서드를 추가함으로써 EmailDst를 상속하는 모든 클래스에는 sendEamil과 시그니처가 정확히 일치하는 메서드를 정의해야 한다는 요구사항이 생긴다.

언어가 구조에 의한 서브 타입을 제공한다면 추상 메서드의 필요성이 많이 줄어든다.
```cpp
Void sendNewYearEmail( {Void sendEmail(String t, String c);} destination){
	destination.sendEmail(..., ...);
}
```
구조를 드러내는 타입을 사용함으로써 destination이 가진 메서드의 시그니처를 타입 검사기에 알려주어 추상 메서드를 대신 할 수 있다.

### 2.2 집합론적 타입
최대 타입(top type), 최소 타입(bottom type), 이거나 타입(union type), 이면서 타입(intersection type) 은 각각 전체 집합, 공집합, 합집합, 교집합에 대응한다.

**최대 타입**
최대 타입은 모든 타입의 슈퍼 타입이다. 여기서는 최대 타입을 Any라고 한다.
```cpp
any res = ... ? 1 : false;
```
위와 같이 any라는 최대 타입이 없었다면 1과 false는 다른 타입이므로 오류가 난다.

**최소 타입**
최소 타입은 예외를 다루는 데 유용한 타입이다. 최소 타입은 모든 타입의 서브 타입이다. 이 책에서는 최소 타입을 Nothing이라고 부른다. 최소 타입은 모든 타입의 서브 타입이니 error 함수를 Int 타입이 필요한 곳에서 호출해도 되고 String 타입이 필요한 곳에서 호출해도 된다.

최대 타입과 최소 타입의 개념이 정반대인 것 같으면서도 비슷한 면이 있다. 최대 타입이 '아무 값이나 될 수 있다'를 의미한다면 최소 타입은 '아무 곳에나 사용될 수 있다.'를 의미한다. 두 문장 모두 '아무 ... 될 수 있다.' 꼴이여서 얼핏보면 똑같아보이고 혼동되기도 한다.

하지만 둘은 완전 다르고 다른 역할을 한다.

최대 타입은 부품을 만들기 쉽다. 아무 부품이나 최대 타입의 부품으로 간주 할 수 있기 때문이다. 그런 만큼 최대 타입의 부품은 아무 값이나 결과로 낼 수 있기 때문에 결과로 나온 값이 어떤 능력이 있는지 모른다. 그래서 최대 타입의 부품은 조심스럽게, print의 인자처럼 별다른 특별한 능력을 요구하지 않는 곳에만 사용해야 한다.

반대로 최소 타입의 부품은 계산을 끝마치지 못한다. 따라서 결과로 나온 값이 사용되는 순간이 영원히 오지 않는다. 그렇기에 최소 타입은 아무렇게나 어느 곳에든 사용할 수 있다. 대신 최소 타입의 부품은 만들기가 어렵다. 예외를 발생시키거나 무한히 재귀 호출을 하는 등의 특별한 방법으로만 최소 타입의 부품을 만들 수 있다.

**이거나 타입**
프로그래밍을 하다 보면 한 함수가 받는 인자의 타입이 여러 가지가 되어야 하는 경우가 생긴다. 이거나 타입은 이런 경우 유용하다.
```cpp
Void write(Cell cell, String | Int data) {
	if (data is String){
		cell.setDataFormat(DATA_FORMAT_NORMAL);
		cell.setData(data);
	} else {
		cell.setDataFormat(DATA_FORMAT_NUMBER);
		cell.setData(intToString(data));
	}
}
```
String | Int 와 같은 표현으로 두 가지의 타입을 받을 수 있다. 이거나 타입은 사용할 때 주의해야 할 점이 있는데 data is String 가 아닌 Boolean isString(Any data) 와 같은 판별 메소드가 대신했다면 위치에 민감한 타입 검사라는 개념에 의해 타임 검사를 통과하지 못한다.

data is String은 언어가 원래 제공하는 기능인 is를 사용한 것이므로 타입 검사기가 data is String을 특별히 처리가 가능해져 cell.setData(data)에서는 data가 문자열이고 intToString(data)에서는 data가 문자열이 아니라는 정보를 얻을 수 있는 것이다.

**이면서 타입**
이면서 타입은 다중 상속을 다룰 떄 유용하다. 다중 상속은 한 클래스가 여러 클래스를 직접 상속하는 것을 말한다.
```cpp
class Student {
	Grades grades;
}

class Teacher {
	String course;
}

class TA extends Student, Teacher {
	Int pay;
}

Float getGrade(TA ta){
	return ta.grades.get(ta.course);
}

//만약 아래와 같은 클래스가 추가된다면
class Volunteer extends Student, Teacher {
	String group;
}
```
여기서 문제는 grades와 course를 모두 가지고 있는 Volunteer를 getGrade의 인자로 사용할 수 없다는 점이다. 이를 해결하기 위해 Student와 Teacher를 상속하는 중간 단계 클래스를 추가하고 TA와 Volunteer가 이를 상속하도록 하는 방법도 있지만 기존에 있던 코드를 고쳐야 하는 경우도 생긴다. 이거나 타입으로 해결할 수도 있지만 TA | Volunteer | ... | ... 와 같이 점점 늘어나며 추가해야 하는 단점이 있다. 그래서 여기에 이면서 타입을 이용하면 아래와 같이 깔끔하게 해결 가능하다.
```cpp
Float getGrade(Student & Teacher st) {
	return st.grades.get(st.course);
}
```
### 2.3 함수와 서브 타입
여러 언어에서 함수를 값으로 사용할 수 있다. 이렇게 값으로 사용되는 함수를 일급 함수(first-class function) 라고 부른다.
```cpp
Void startMentoring(Student => Person select) {
	for (Int i = 0; i < students.length; i++) {
		Student st = students[i];
		Person mentor = select(st);
		sendEmail(st, ... , ... );
		sendEmail(mentor, ... , ... );
	}
}
```
select가 함수로 Student => Person 타입이다. 멘토링마다 멘토 선정 기준이 달라질 수 있기 때문에 멘토를 정하는 함수를 인자로 받는다.

만약 타입이 Student => Student가 된다면 어떻게 되는가 라고 한다면 대부분의 언어에서는 Student => Student를 Student=>Person의 서브 타입으로 간주하여 타입 검사를 통과한다.

A가 B의 서브 타입이고 C가 D의 서브 타입이면 B= >C 는 A=>D의 서브 타입이다.
### 논의 내용
```cpp
Void write(Cell cell, String | Int data) {
	if (data is String){
		cell.setDataFormat(DATA_FORMAT_NORMAL);
		cell.setData(data);
	} else {
		cell.setDataFormat(DATA_FORMAT_NUMBER);
		cell.setData(intToString(data));
	}
}
```
>이거나 타입은 사용할 때 주의해야 할 점이 있는데 data is String 가 아닌 Boolean isString(Any data) 와 같은 판별 메소드가 대신했다면 위치에 민감한 타입 검사라는 개념에 의해 타임 검사를 통과하지 못한다.

'위치에 민감한 타입 검사'와 같은 오류를 경험을 해보신 적이 있으신가요? 저 같은 경우 '위치에 민감한 타입 검사'라는 개념이 생소하기도 했고 이렇게 배우지 못하고 해당 오류를 마주한다면 'data is String과 Boolean isString(Any data)는 결국 같은 의미 같은데 왜 오류가 나지' 라는 생각으로 당황했을 것 같기도 합니다.
