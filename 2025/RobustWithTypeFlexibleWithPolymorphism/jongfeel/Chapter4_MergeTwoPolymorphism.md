## 책 내용 정리

- https://github.com/jongfeel/BookReview/issues/1087

위 링크 참고

## 논의 내용

1. 가변성에서 정의할 때와 생성할 때의 서브타입 관계에 대해서 잘 몰랐는데 저도 의식하지 않고 제네릭 타입에 대한 캐스팅을 쓰면서도 이게 공변인지 불변인지 잘 모르고 무지성으로 썼던 것 같습니다.
일반적인 타입 캐스팅에 대해서는 모르는 분은 거의 없을 것 같은데 제네릭 타입에 대한 캐스팅을 시도해 보고 공변이나 반공변이 되게 만들어 본 적이 있는지 얘기해 보면 좋을 것 같습니다. (불변은 어차피 서브타입 캐스팅이 안될테니까 당연히 안되겠죠)

저의 경우는 비교하는 인터페이스인 IComparer< T > 타입에 대해 반공변을 썼던 적이 있습니다.
대략 코드는 이렇습니다.

```
class A { }
class B : A { }
class Comparer : IComparer< A >
{
    int IComparer< A >.Compare(A left, A right) { }
}

Set< B > bSets = new Set< B >();
bSets.Add(...);...
bSets.Sort(new Comparer());
```

Set 제네릭 클래스는 생성할 때 불변이고 타입은 B 이지만 Sort 하는 과정에서 읽기만 하므로 부모 타입인 A로 비교하게 하면 컴파일이 가능한 반공변(contravariance)을 구현했었습니다.
하지만 구현해놓고 "이게 반공변성을 구현한 비교 객체야!" 라고 하지는 않았던 것 같습니다.

