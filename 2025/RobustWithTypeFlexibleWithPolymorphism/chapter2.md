### 2장에 대한 총평

2장은 매우 흥미로운 주제와 내용을 다루고 있어서 재미있게 읽었습니다. 

하지만 몇몇 부분에 대한 설명은 아쉬웠습니다. 제 경우 정의가 명확할 때 이해가 쉬운데, 이 책에서는 그런 부분이 부족한 것 같았습니다. 예를 들어 **서브타입(subtype)**에 대한 설명이 그렇습니다. 서브타입에 대한 다형성(subtype polymorphism)을 설명하지만, 어떤 것이 서브타입인지 명쾌하게 정의하지는 않았습니다. 

책에서는 어떤 컨셉에 대해 "이 컨셉은 이러이러해서 유용하다"고 잘 설명해주지만, "어떤 것이 이 컨셉이다"라는 부분은 명확히 알려주지 않습니다. 이 때문에 마치 장님이 코끼리 코만 만지는 것 같은 설명이 느껴져, 책을 읽는 중간중간 다른 자료를 참고해야 하는 수고가 있었습니다. 그럼에도 불구하고 책의 내용과 풀어가는 방식은 매우 좋고 흥미로웠습니다.  

특히 **bottom type**은 가장 흥미로운 컨셉이었습니다. 몇몇 용어는 번역 방향을 달리하면 더 나을 것 같다는 생각도 들었습니다. 예를 들어:
- `top type` → `최대타입` 대신 `최상위타입`으로,
- `bottom type` → `최소타입` 대신 `최하위타입`으로 번역하는 것이 더 적합해 보였습니다.

**Q. 논의내용**

Quiz. Java에는 bottom type이 있을까요?

1. Class뿐만 아니라 Record(e.g. struct)에도 subtyping 이 있습니다. width subtyping, depth subtyping이 있습니다. 이를 활용한 경험이 있으시면 공유해주세요. 아쉽게도 제가 주로 사용하는 언어에서는 활용해볼 수 없었네요.

아래는 지원하는지 여부를 테이블로 나타낸 목록입니다.

| **Language**      | **Supports Record Subtyping** | **Approach**                     | **Width Subtyping** | **Depth Subtyping** |
|--------------------|-------------------------------|-----------------------------------|---------------------|---------------------|
| **TypeScript**     | ✅ Yes                        | Structural typing                | ✅ Yes              | ❌ No              |
| **OCaml**          | ✅ Yes                        | Explicit field extensions        | ✅ Yes              | ✅ Yes             |
| **Haskell**        | ✅ Yes                        | Row types, extensions, libraries | ✅ Yes              | ✅ Yes             |
| **Scala**          | ✅ Yes                        | Structural types, case classes   | ✅ Yes              | ✅ Yes             |
| **F#**             | ✅ Yes                        | Explicit field compatibility     | ✅ Yes              | ❌ No              |
| **Elm**            | ✅ Yes                        | Extensible records               | ✅ Yes              | ❌ No              |
| **Rust**           | ⚠️ Partial                   | Traits or libraries              | ✅ Yes (via traits) | ❌ No              |
| **Python**         | ✅ Yes                        | Duck typing                      | ✅ Yes              | ✅ Yes             |
| **Java**           | ❌ No                        | Requires explicit inheritance    | ❌ No              | ❌ No              |
| **C#**             | ❌ No                        | Requires explicit inheritance    | ❌ No              | ❌ No              |
| **C++**            | ❌ No                        | Requires explicit inheritance    | ❌ No              | ❌ No              |


#### **Example in Python**:
```python
class Person:
    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age

class Employee(Person):
    def __init__(self, name: str, age: int, department: str):
        super().__init__(name, age)
        self.department = department

def greet(person: Person):
    print(f"Hello, {person.name}, age {person.age}")

employee = Employee("Alice", 30, "HR")
greet(employee)  # Works because Employee is a subtype of Person
```

2. "집합론적 타입"은 무슨 의미일까요? 이해는 하지 못했지만, 그냥 넘어가도 핵심을 이해하는데는 문제가 없어서 지나쳤습니다.

### 서브타입에 의한 다양성

#### 객체와 서브타입
- **서브타입(subtype)**  
  서브타입은 다른 데이터 타입(슈퍼타입)과 대체 가능성(substitutability)의 개념으로 연결된 데이터 타입입니다. 즉, 슈퍼타입에서 작동하도록 작성된 프로그램 요소(예: 서브루틴이나 함수)는 서브타입의 요소에서도 작동할 수 있습니다.

#### 서브타입의 종류
1. **이름에 의한 서브타입 (nominal subtyping)**  
   흔히 알고 있는 키워드를 이용한 서브타입 방식으로, 특정 타입이 다른 타입의 서브타입임을 명시적으로 정의합니다.

2. **구조에 의한 서브타입 (structural subtyping)**  
   두 타입의 구조가 서브타입 관계를 결정하는 방식입니다.

---

### 추가 개념 설명

#### 추상 메서드 (Abstract Method)  
추상 메서드는 구현 없이 시그니처만 있는 메서드입니다. 서브클래스가 반드시 이 메서드를 구현하도록 요구하는 데 사용되며, 추상 클래스 내에서 자주 활용됩니다. 일부 프로그래밍 언어에서는 인터페이스를 정의할 때 추상 메서드를 사용합니다.

#### 집합론적 타입

1. **최대타입 (Top Type, 최상위타입)**  
   모든 타입의 슈퍼타입을 나타내는 타입입니다.

2. **최소타입 (Bottom Type, 최하위타입)**  
   모든 타입의 서브타입을 나타내는 타입으로, 보통 정상적으로 값을 반환하지 않는 계산(예: 예외 발생, 무한 루프)을 표현할 때 사용됩니다.

3. **이거나 타입 (Union Type)**  
   여러 타입 중 하나를 표현할 수 있는 타입으로, 여러 타입을 하나로 결합합니다.

4. **이면서 타입 (Any Type)**  
   타입 검사 없이 모든 값을 허용하는 타입으로, `top type`보다 덜 제한적이며 타입 시스템을 우회합니다.

---

### 함수와 서브타입

함수 **P**가 `P: X -> Y`라고 하면, 이는 **X**가 입력이고 **Y**가 출력인 함수임을 나타냅니다.  
이 함수 **P**는 다른 함수 **Q**(`Q: A -> B`)로 대체될 수 있습니다. 단, 다음 조건을 모두 만족해야 합니다:

1. **A는 X의 슈퍼타입이어야 합니다.**  
   Q 구현에서는 X가 지원하는 기능까지만 사용할 수 있기 때문입니다.

2. **B는 Y의 서브타입이어야 합니다.**  
   이후 코드에서 Y가 지원하는 행위를 모두 지원해야 하기 때문입니다.
