2장 서브타입에 의한 다형성

# 논의 내용

- 참여했던 프로젝트에서 서브타입 다형성(상속, 추상클래스와 추상메소드, 구조에 의한 서브타입)을 적극 활용해 설계한 경험에 대해서 얘기해보면 좋을 것 같습니다
    - 설계가
        - 성공적이였다면,
            - 어떤 장점이 있었는지
        - 문제가 있었다면,
            - 어떤 문제점이 있었고, 어떻게 개선 했는지 혹은 어떻게 개선했으면 좋을지
- Union 타입과 Intersection 타입(다중 상속)을 활용하여 다형성을 극대화하는 전략에 대해 어떻게 생각하시나요?
    - 개인적으로 Union 타입은 필요에 따라서, 사용할 때도 있었지만, 책의 코드는 함수 오버로딩으로 구현하는게 훨씬 낫지 않을까 생각되고, 다중 상속의 경우, 다중 상속이 가능한 파이썬에서도 가능하면 피하고, 꼭 필요하다면, Mixin 클래스로 다중상속을 사용했습니다 책의 예제를 봤을 때도, 전혀 사용해서 도움이 될만한 예제는 아닌걸로 보여서 다른 분들의견도 궁금합니다

```python
# 책의 예제를 함수 오버로딩 하도록 변경 - @singledispatch 사용

from functools import singledispatch

DATA_FORMAT_NORMAL = "normal"
DATA_FORMAT_NUMBER = "number"


class Cell:
    def set_data_format(self, data_format: str):
        ...

    def set_data(self, data: str):
        ...


@singledispatch
def write(cell: Cell, data):
    raise NotImplementedError(f"지원하지 않는 타입입니다: {type(data)}")


@write.register(str)
def _(cell: Cell, data: str):
    cell.set_data_format(DATA_FORMAT_NORMAL)
    cell.set_data(data)


@write.register(int)
def _(cell: Cell, data: int):
    cell.set_data_format(DATA_FORMAT_NUMBER)
    cell.set_data(data)

# 사용 예시:
# cell = Cell()
# write(cell, "Hello")  # 문자열 처리
# write(cell, 42)       # 숫자 처리
```

# 키워드

1. 서브 타입에 의한 다형성
    1. 이름에 의한 서브타입
        1. 상속
            1. 직접 상속
            2. 간접 상속
    2. 구조에 의한 서브타입
        1. 클래스 A가 클래스 B에 정의된 필드와 메서드를 모두 정의한다면, A는 B의 서브 타입이다
    3. 추상 클래스, 추상 메소드
2. 집합론적 타입 -> 이것 역시 서브 타입에 의한 다형성을 바탕으로 만들어졌다
    1. 최대 타입
    2. 최소 타입
    3. 민감한 타입검사
    4. union type
    5. intersection type
3. 함수와 서브타입
    1. contravariance 와 covariance

# 내 생각

1. 책에 클래스 정의에 필드가 나열되어있는 것이 동적 타이핑 언어만 사용한 개발자는 생소할 수 있다고 나오는데 충분히 그럴 수 있다고 생각한다. 다만, python3.7 이후 부터 dataclass 가 나오면서, 이런 정적 타이핑 언어의 특징을 Python에서도 볼 수 있게 되었다 그래서 파이썬3.7이상 기준으로 본다면, 생소한 코드로 볼 수 없을 수도 있다
```python
from dataclasses import dataclass

@dataclass
class Person:
    name: str
    age: int

@dataclass
class Student(Person):
    school: str
```
2. 서브 타입에 의한 다형성을 쉽게 설명하면, 부모 클래스를 자식 클래스로 대체해서 사용할 수 있느냐에 대한 것(책에선 간주한다 라는 표현을 사용)으로 볼 수 있다 책 예제를 기준으론 사람과 학생이 나오는데, Student는 Person을 상속하고 있고, 타입을 기준으로 Person의 대체재로 Student는 사용될 수 있다 Student는 Person의 서브 타입이고, Person은 Student의 슈퍼 타입니다
3. 역시나 파이썬에서 3.8 부터 Protocol 이라고 하는 구조적 서브 타이핑을 할 수 있게 되었다
4. 파이썬은 런타임에서 duck typing 기반으로 동작한다. 위에서 말한 typing.Protocol을 사용하게 되면 Duck Typing 과 더불어 정적 타입 검사에 반영하여서 사용할 수 있게 되는데, mypy와 같은 타입체커를 통해서 컴파일 타임에 인터페이스 충족 여부를 미리 검사 할 수 있다
5. 파이썬에서의 최대타입은 object, 최소 타입은 typing.NoReturn 이다