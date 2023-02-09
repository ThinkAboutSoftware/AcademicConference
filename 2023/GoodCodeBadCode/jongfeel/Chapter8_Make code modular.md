## 8장 코드를 모듈화하라

```
논의내용)
이번 장은 객체지향적 관점에서 모듈화 하는 방향에 대해 언급하고 있는데 상당히 좋은 영향을 다시 받았습니다.
특히 객체지향에서 중요한 포인트인 인터페이스 사용이라던지 상속의 문제점을 다시 한번 리마인드 할 수 있는 좋은 시간이었습니다.

자신이 해봤던 모듈화 기법 중 책에 제시된 기법을 사용한 적이 있는지 한번 쯤 얘기해 보면 좋겠습니다.

저는 인터페이스 의존 기법을 상당히 즐겨쓰는 편이고, 상속도 왠만하면 인터페이스로 구현하는 쪽으로 하는 편입니다.
처음부터 그랬던 건 아니고, 여러 객체지향에 대한 좋은 책과 기법을 익히면서 의도적으로 노력해서 얻은 결과이기도 합니다.
```

모듈화의 주된 목적 중 하나는 코드가 향후에 어떻게 변경되거나 재구성될지 정확히 알지 못한 상태 에서 변경과 재구성이 용이한 코드를 작성하는 것이다.

### 8.1 의존성 주입의 사용을 고려하라

하위 문제에 대해 해결책이 항상 하나만 존재하는 것은 아니므로 하위 문제를 재구성할 수 있는 방식으로 코드를 작성하는 것이 유용할 수 있다. 의존성 주입dependency injection 은 이를 달성하는 데 도움이 될 수 있다.

#### 8.1.1 하드 코드화된 의존성은 문제가 될 수 있다

RoutePlanner 클래스는 생성자에서 NorthAmericaRoadMap 을 생성하는데, 이는 RoadMap의 특정 구현에 대한 의존성이 하드 코드로 되어 있다. 따라서 RoutePlanner 클래스는 북미 여행 계획에만 사용될 수 있고 그 외의 다른 지역을 여행하는 데는 전혀 쓸모가 없다.

``` Java
class RoutePlanner { 
  private final RoadMap roadMap;

  RoutePlanner() {
    this.roadMap = new NorthAmericaRoadMap();
  }
}

interface RoadMap { 
  List<Road> getRoads();
  List<Junction> getJunctions();
}
```

NorthAmericaRoadMap 클래스가 수정되어 일부 생성자 매개변수가 필요한 상황이 되면 RoutePlanner 클래스는 이 두 개의 인수를 제공하지 않고는 NorthAmericaRoadMap 인스 턴스를 생성할 수 없다.

RoutePlanner 클래스는 한 가지 장점이 있다. 인스턴스 생성을 쉽게 할 수 있다. 생성자는 매개변수를 사용하지 않기 때문에 생성자를 호출할 때 설정값을 제공하는 것에 대해 걱정할 필요가 없다. 그러나 RoutePlanner 클래스는 모듈화되어 있지 않고 다용도로 사용할 수 없는 단점이 있다.

#### 8.1.2 해결책: 의존성 주입을 사용하라

생성자의 매개변수를 통해 로드맵을 제공함으로써 RoadMap을 주입inject 하면 클래스는 훨씬 더 모듈화 되고 다용도로 쓰일 수 있다. RoutePlanner 클래스는 특정 로드맵에 대해 하드 코드화된 종속성을 가질 필요가 없으며 원하는 어떤 로드맵으로도 설정할 수 있다.

종속성 주입
``` Java
class RoutePlanner {
  private final RoadMap roadMap;
  RoutePlanner(RoadMap roadMap) {
    this.roadMap = roadMap;
  }
}
```

이런 식으로 생성자를 통해 주입하면 RoadMap 형식으로 생성하는 구체 타입의 생성 코드가 복잡해지는 단점이 있다.
몇 가지 팩토리 함수를 제공하면 이 과정이 훨씬 더 쉽게 될 수 있다.

이를 통해 개발자는 필요한 작업을 신속하게 수행할 수 있고 다른 목적을 가진 개발자가 다른 로드맵으로 RoutePlanner를 사용하는 것을 막지도 않는다.

팩토리 함수

``` Java
class RoutePlannerFactory {
  static RoutePlanner createEuropeRoutePlanner() {
    return new RoutePlanner(new EuropeRoadMap());
  }
  static RoutePlanner createDefaultNorthAmericaRoutePlanner() {
    return new RoutePlanner( new NorthAmericaRoadMap(true, false));
  }
}
```

팩토리 함수를 직접 작성하는 것의 대안으로 의존성 주입 프레임워크dependency injection framework 를사용할 수도 있다.

##### 의존성 주입 프레임워크

팩토리 함수를 많은 클래스에 대해 만들어야 한다면 그것 또한 힘든 작업이고 반복적으로 작성하는 코드가 많아질 수 있다.
의존성 주입 프레임워크를 사용하면 의존성 주입과 관련된 많은 작업을 수동으로 하지 않아도 되기 때문에 개발 작업이 쉬워진다.

의존성 주입을 좋아하는 개발자라도 의존성 주입 프레임워크를 항상 사용하는 것은 아니다. 왜냐하면 프레임워크의 어떤 설정이 코드의 어떤 부분에 적용되는지 알기 어렵기 때문에 파악하기 어려운 코드가 만들어질 수 있다.

#### 8.1.3 의존성 주입을 염두에 두고 코드를 설계하라

코드를 작성하다 보면 나중에 의존성 주입을 사용하고 싶어도 사용이 거의 불가능한 코드가 짜여질 수 있기 때문에 이후에 의존성 주입을 사용할 가능성이 있다면 이런 방식으로 코드를 작성하는 것은 피해야 한다.

의존성 주입을 사용하도록 클래스를 수정하고 싶어도 그렇게 할 수 없는 이유는 함수 안에서 정적 메서드를 호출해서 의존하기 때문이다.

하위 문제를 해결하기 위해 코드를 작성할 때, 간단하게 정적 함수를 작성하면 충분한 것처럼 보일 때가 많다. 그러나 상위 코드 계층에서 하위 문제에 대해 설정을 달리하고자 한다면 문제가 될 수 있다.

**정적 매달림**

> 정적 함수 (또는 변수) 에 과도하게 의존하는 것을 정적 매달림(static cling)이라고 한다. 단위 테스트 코드에서 특히 문제가 될 수 있는데, 그 이유는 정적 매달림이 많은 코드에 대해서는 테스트 더블(test doubles)을 사용할 수 없기 때문이다.

```
의견 (및 격한 공감)
정적 메서드 특히 싱글톤 객체에서 파생되는 메서드의 조합으로 이루어지는 로직은
테스트가 거의 불가능할 정도로 문제가 많다.
이것은 테스트 코드를 짜본 사람이면 알 수 있는 것이기도 하다.
이와 더불어 의존성 주입 방식을 잘 설계해 두면 테스트 코드를 작성할 때
인터페이스를 통한 객체 생성 및 테스트 메서드로의 전달이 매우 용이하다.

유니티 프로그래머가 테스트 코드를 짜고 싶어도 잘 못짜는 이유가 여러 가지가 있는데
테스트 코드의 중요성과 유닛 테스트를 짜는 best practice를 안다고 가정해도
싱글톤 객체로 인해 테스트 코드가 작성이 안되는 문제는 심각한 수준이고
UnityEditor 상에서 제공되는 public field의 serialize(inspector 상에 노출되는 UI 인터페이스)의 편의성 때문에
막상 MonoBehaviour 기반의 테스트 코드를 작성하려고 하면 어떻게 GameObject 부터 준비해서
테스트 코드를 짜야 하는지 모르는 개발자가 너무 많다.
마지막으로 힘들게 테스트 코드를 작성하는데 성공하고 Assert를 통과하는 코드를 짜 놔도
다시 테스트 코드를 검토해 보면 원래 수행해야 하는 로직 보다 테스트 코드 수행을 위한 준비 코드의 양이 훨씬 더 많아지는
말 그대로 배보다 배꼽이 더 큰 웃지 못할 상황도 많이 일어난다.

결론:
왜 유니티 프로그래머는 테스트 코드를 잘 못짜는가?
싱글톤 객체에 의존해서 훅 들어오는 로직의 남발
인터페이스를 통한 의존성 주입은 커녕 UnityEditor에 의존성이 있기 때문이다.
```

하위 문제에 대한 해결책이 두 가지 이상 가능한 경우 인터페이스를 정의하는 것이 좋다.
하위 문제를 해결하는 상황이 올 것이 예상된다면 인터페이스를 정의하고 구현하는 클래스를 만드는 것이 더 낫다.
또한 이렇게 하는 것은 함수를 정적이지 않게 만드는 것을 의미한다.

의존성 주입은 코드를 모듈화하고 다른 시나리오에도 적용할 수 있게 해주는 훌륭한 방법이다.
하위 문제에 대한 해결책이 여러 개 있는 경우에는 의존성 주입이 특별히 중요할 수 있다.
그렇지 않은 경우라도 의존성 주입은 여전히 유용하다.

### 8.2 인터페이스에 의존하라

인터페이스에 의존한다는 것은 코드를 모듈화하고 적응성을 높이기 위한 보다 일반적인 기술로 이어진다.
어떤 클래스에 의존하고 있는데 그 클래스가 어떤 인터페이스를 구현하고 필요한 기능이 그 인터페이스에 모두 정의되어 있으면,
클래스에 직접 의존하기보다는 인터페이스에 의존하는 것이 일반적으로 더 바람직하다.

#### 8.2.1 구체적인 구현에 의존하면 적응성이 제한된다

이 코드는 의존성 주입을 사용할 때 얻을 수 있는 이점을 놓치고 있는데
RoutePlanner 클래스를 RoadMap을 구현하는 다른 클래스에 대해서는 사용할 수 없다.

``` java
interface RoadMap {
...
}

class NorthAmericaRoadMap implements RoadMap {
...
}

class RoutePlanner {
   ...
  RoutePlanner(NorthAmericaRoadMap roadMap) {
    this.roadMap = roadMap;
  }
}
```

#### 8.2.2 해결책: 가능한 경우 인터페이스에 의존하라

인터페이스를 구현하는 클래스는 하위 문제를 해결하는데 있어서 구현 중심적인 방식으로 해결한다.
추상적인 인터페이스에 의존하면 대개의 경우 더 간결한 추상화 계층과 더 나은 모듈화를 달성할 수 있다.

클래스의 인터페이스를 구현하고 필요한 동작을 정의한다면
다른 개발자가 해당 인터페이스에 대해 다르게 구현한 클래스를 작성할 수 있다는 것을 의미한다.
인터페이스에 의존한다고 해서 더 많은 노력을 기울일 필요가 없으면서도, 코드는 상당히 모듈화되고 적응성이 높아진다.

**의존성 역전 원리**

> 보다 구체적인 구현보다는 추상화에 의존하는 것이 낫다는 생각은 의존성 역전 원리(dependency inversion principle)의 핵심이다.

### 8.3 클래스 상속을 주의하라

Vehicle 클래스를 상속받는 Car, Car를 상속받는 클래스 가 진행이 되면 클래스 계층class hierachy이 형성된다.

두 가지 사물이 진정한 is-a 관계를 갖는다면 상속은 적절하다.
상속은 강력한 도구지만, 단점이 존재하고 상속이 야기하는 문제가 치명적일 수 있기 때문에
클래스 상속을 사용하는 코드를 작성하는 것은 신중하게 생각해봐야 한다.

상속을 사용할 수 있는 상황에서는 상속 대신 구성composition을 사용할 수 있다.
클래스를 확장하는 개념보다는 인스턴스를 가지고 있음으로써 한 클래스를 다른 클래스로부터 구성할 수 있다.

```
의견)
많은 객체지향 관련 책을 읽어본 경험으로는
보통 클래스 상속의 구현과 방법에 대해 설명한 책은 초급자용 책일 가능성이 높고
클래스 상속의 문제점과 대안을 설명한 책은 고급자용 책일 가능성이 높다고 본다.
```

#### 8.3.1 클래스 상속은 문제가 될 수 있다

자동차의 예는 클래스 상속의 의미를 잘 설명하지만 문제점에 대해서는 추상적으로 이해할 수 밖에 없으므로
쉼표로 구분된 정수를 가지고 있는 파일을 열어 정수를 하나씩 읽어들이는 클래스를 작성한다고 가정하는 것으로 이해해 본다.

CSV 파일을 읽는 클래스

``` java
interface FileValueReader {
 String? getNextValue();
 void close();
}

interface FileValueWriter {
 void writeValue(String value);
 void close();
}

class CsvFileHandler implements FileValueReader, FileValueWriter {
 ...
 CsvFileReader(File file) { ... }
 override String? getNextValue() { ... }
 override void writeValue(String value) { ... }
 override void close() { ... }
}

class IntFileReader extends CsvFileHandler {
 ...
 IntFileReader(File file) {
   super(file);
 }

 Int? getNextInt() {
   String? nextValue = getNextValue();
   if (nextValue == null) {
     return null;
   }
   return Int.parse(nextValue, Radix.BASE_10);
 }
} 
```

##### 상속은 추상화 계층에 방해가 될 수 있다

한 클래스가 다른 클래스를 확장하면 수퍼클래스의 모든 기능을 상속한다.
이 방식은 유용할 때가 있지만, 원하는 것보다 더 많은 기능을 노출할 수도 있다.
이로 인해 추상화 계층이 복잡해지고 구현 세부 정보가 드러날 수 있다.

IntFileReader 클래스가 CsvFileHandler를 사용한다는 사실은 구현 세부 사항이어야 하지만
상속을 통해서 이 클래스들의 함수들이 의도치 않게 외부에 공개된다.

##### 상속은 적응성 높은 코드의 작성을 어렵게 만들 수 있다

쉼표가 아니라 세미콜론으로 구분된 값을 읽는 SemicolonFileHandler를 FileValueReader, FileValueWriter를 사용해 구현했다고 하자.
CsvFileHandler 대신에 SemicolonFileHandler를 사용해야 할 때가 있다면
살짝 바뀐 요구사항 때문에 코드를 약간만 수정하면 될 것 같지만,
상속을 사용하는 경우에는 코드 변경이 간단하지 않을 수 있다.
단순히 IntFileReader가 CsvFileHandler 대신 SemicolonFileHandler를 상속하도록 바꿀 수 없다.
IntFileReader 클래스의 새 버전인 SemicolonFileHander를 상속하는 SemicolonIntFileReader를 만드는 것이다.
그러면 코드 중복이 엄청난데, 유지보수 비용과 버그 발생 가능성을 높이기 때문에 바람직하지 않은 방법이다.

#### 8.3.2 해결책: 구성을 사용하라

상속을 사용한 동기는 IntFileReader 클래스를 구현하는 데 도움이 되고자 CsvFileHandler 클래스의 일부 기능을 재사용하는 것이었다.
하지만 단점이 있기 때문에 해당 클래스의 인스턴스를 가지고 있음으로써 하나의 클래스를 다른 클래스로부터 구성compose 하는 방법을 사용한다.

``` java
class IntFileReader {
 private final FileValueReader valueReader;
 IntFileReader(FileValueReader valueReader) {
   this.valueReader = valueReader;
 }

 Int? getNextInt() {
   String? nextValue = valueReader.getNextValue();
   if (nextValue == null) {
     return null;
   }
   return Int.parse(nextValue, Radix.BASE_10);
 }

 void close() {
   valueReader.close();
 }
} 
```

##### 더 간결한 추상화 계층

상속 대신 구성을 사용하면 IntFileReader 클래스가 전달이나 위임을 사용하여 명시적으로 노출하지 않는 한 CsvFileHandler 클래스의 기능이 노출되지 않는다.

##### 적응성이 높은 코드

팩토리 함수를 통해 IntFileReader 클래스의 인스턴스를 생성할 때 쉽표나 세미콜론을 구분해서 구현한 FileValueReader 클래스를 주입하면 적응성이 높아진다.

``` java
class IntFileReaderFactory {
 IntFileReader createCsvIntReader(File file) {
   return new IntFileReader(new CsvFileHandler(file));
 }

 IntFileReader createSemicolonIntReader(File file) {
   return new IntFileReader(new SemicolonFileHandler(file));
 }
} 
```

예제는 간단하게 만든 것이지만, 실제로는 훨씬 더 많은 코드와 기능을 포함하므로
요구 사항의 작은 변화에도 코드가 적응하지 못하면 코드를 유지하는 비용은 상당히 커지게 된다.

#### 8.3.3 진정한 is-a 관계는 어떤가?

진정으로 is-a 관계일 때 조차 상속하는 것이 좋은 접근법인지에 대해서는 명확하지 않을 수 있고 이에 대한 답은 없다.
오직 주어진 상황과 작업 중인 코드에 따라 다르게 해야 한다.
진정한 is-a 관계가 있다고 하더라도 상속은 여전히 문제가 될 수 있다는 점을 알아야 한다.

- 취약한 베이스 클래스 문제the fragile base class problem: 수퍼클래스 수정으로 인해 서브클래스가 작동하지 않음
- 다이아몬드 문제diamond problem: 다중상속 문제(C++)
- 문제가 있는 계층 구조problematic hierachy: 자동차와 비행기에서 하늘을 나는 차는 어떻게 상속 구조를 가져야 할까에 대한 문제

```
의견)
클린코드에서 로버트 마틴 역시 상속을 피하자고 했지만, 어쩔 수 없을 때는 써야 한다고 했다.
그 어쩔 수 없을 때의 설명도 있어서, 톰 롱의 주장과 좀 상반되는 부분이 있다.
```

클래스 상속에 숨어 있는 많은 함정을 피하면서 계층 구조를 달성하기 위한 방법으로

- 인터페이스를 사용하여 계층 구조를 정의한다
- 구성을 사용하여 코드를 재사용한다

**믹스인(Mixin)과 트레이트(Trait)**

> 클래스 상속을 하지 않고도 해당 클래스의 기능 일부를 사용하고 공유할 수 있는 방법, 하지만 여전히 간결한 추상화 계층을 갖지 못하거나 적응성이 낮아질 수 있는 문제가 있으므로 주의를 기울여야 한다.

### 8.4 클래스는 자신의 기능에만 집중해야 한다

모듈화의 핵심 목표 중 하나는 요구 사항이 변경되면 그 변경과 직접 관련된 코드만 수정한다.
단일 개념이 단일 클래스 내에 완전히 포함된 경우라면 이 목표는 달성할 수 있다.
어떤 개념과 관련된 요구 사항이 변경되면 그 개념에 해당하는 단 하나의 클래스만 수정하면 된다.

#### 8.4.1 다른 클래스와 지나치게 연관되어 있으면 문제가 될 수 있다

``` java
class Book {
 private final List<Chapter> chapters;
 ...
 Int wordCount() {
   return chapters
     .map(getChapterWordCount)
     .sum();
 }
 private static Int getChapterWordCount(Chapter chapter) {
   return chapter.getPrelude().wordCount() +
     chapter.getSections()
     .map(section -> section.wordCount())
     .sum();
 }
}

class Chapter {
 ...
 TextBlock getPrelude() { ... }
 List<TextBlock> getSections() { ... }
} 
```

getChapterWordCount() 함수는 Book 클래스 속에 있지만 Chapter 클래스에만 관련된 사항을 다룬다.
이것은 Chapter 클래스에 대한 많은 세부 사항이 Book 클래스에 하드 코딩된다는 것을 의미한다.

이런 방식은 모듈화가 되지 않으며 Chapter에 대한 요구 사항의 변경이 Book 클래스에도 영향을 미친다.

#### 8.4.2 해결책: 자신의 기능에만 충실한 클래스를 만들라

코드 모듈화를 유지하고 한 가지 사항에 대한 변경 사항이 코드의 한 부분만 영향을 미치도록 하기 위해
Book과 Chapter 클래스는 가능한 한 자신의 기능에만 충실하도록 해야 한다.

Book 클래스는 Chapter 클래스의 세부 사항을 다룰 필요가 없고 자기 자신만 신경 쓰면 된다.
Chapter 관련된 요구 사항이 변경된다면 Chapter 클래스만 수정하면 된다.

**디미터의 법칙**

> 디미터의 법칙(The Law of Demeter, LoD)은 한 객체가 다른 객체의 내용이나 구조에 대해 가능한 한 최대한으로 가정하지 않아야 한다는 소프트웨어 공학의 원칙이다.
이 원칙은 특히 한 객체는 직접 관련된 객체와만 상호작용해야 한다고 주장한다.
소프트웨어 엔지니어링의 이면에 있는 추론과 여러 상황에서 발생할 수 있는 장단점을 모두 고려하는 것이 중요하다.
디미터의 법칙 역시 다른 주장들을 바탕으로 자신만의 의견을 갖되 근거에 기반해서 갖기를 권장한다.

이점을 설명하는 글: http://mng.bz/8WP5
단점을 제시하는 글: http://mng.bz/EVPX

### 8.5 관련 있는 데이터는 함게 캡슐화하라

너무 많은 것들을 한 클래스에 두지 않도록 주의해야 하지만
한 클래스 안에 함께 두는 것이 합리적일 때는 그렇게 하는 것의 이점을 놓쳐서도 안 된다.

서로 다른 데이터가 서로 밀접하게 연관되어 있어 그것들이 항상 함께 움직여야 할 때가 있다.
이 경우에는 클래스로 그룹화 하는 것이 합리적이다.
이렇게 하면 세부 사항을 다루는 대신 상위 수준의 개념을 다룰 수 있다.

#### 8.5.1 캡슐화되지 않은 데이터는 취급하기 어려울 수 있다

텍스트를 렌더링하기 위한 클래스 및 함수

``` java
class TextBox {
 ...

 void renderText(
   String text,
   Font font,
   Double fontSize,
   Double lineHeight,
   Color textColor) {
   ...
 }
} 
```

TextBox 클래스는 하위 수준의 코드일 가능성이 크므로, 텍스트 스타일링과 관련된 값이 함수가 호출 될 때 마다 한 함수에서 다음 함수로 넘겨져야 한다.
요구 사항이 변경되면 요구 사항과 직접 관련 있는 코드만 수정해야 하는데 세부 값들에 대해 계속 수정해줘야 하는 건 바람직하지 않다. 

#### 8.5.2 해결책: 관련된 데이터는 객체 또는 클래스로 그룹화하라

font, font size, line height, text color 값들은 본질적으로 서로 연결되어 있다.
이들을 하나의 객체인 TextOptions로 캡슐화해서 전달하는 것이 타당하다.

**데이터 객체의 대안**

> 데이터를 캡슐화하는 것은 데이터 객체에 대한 또 다른 용례가 될 수 있다.
객체 지향 프로그래밍에 대해 보다 전통적인 관점을 지지하는 사람들은 데이터 전용 객체를 바람직하지 않은 관행으로 간주한다.

TextOptions 클래스를 사용하여 텍스트 스타일 정보를 함께 캡슐화해서 TextOptions 인스턴스를 전달할 수 있다.

캡슐화된 객체를 전달

``` java
class TextBox {
 ...

 void renderText(String text, TextOptions textStyle) {
   ...
 }
} 
```

한 클래스에 너무 많은 개념이 있으면 문제가 있을 수 있지만
여러 데이터가 따로 떨어져서는 별 의미가 없을 정도로 밀접한 연관성이 있고
캡슐화를 한 데이터 중에서 일부만 쓰는 게 아니라면 캡슐화하는 것이 합리적이다.

### 8.6 반환 유형에 구현 세부 정보가 유출되지 않도록 주의하라

간결한 추상화 계층을 가지려면 세부 정보가 유출되지 않아야 한다.
유출된다면 코드의 하위 계층에 대한 정보가 노출될 수 있으며, 나중에 수정이나 재설정이 매우 어려워질 수 있다.

#### 8.6.1 반환 형식에 구현 세부 사항이 유출될 경우 문제가 될 수 있다

ProfilePictureService 클래스는 HttpFetcher가 사용된다는 사실을 직접적으로 유출하지 않지만
ProfilePictureResult 클래스 유형을 통해 Status, Payload를 사용한다는 것을 알 수 있다.
이것은 HTTP 연결을 사용하여 프로필 사진을 가져온다는 사실을 유출한다.

``` java
class ProfilePictureService {
 private final HttpFetcher httpFetcher;
 ...

 ProfilePictureResult getProfilePicture(Int64 userId) { ... }
}

class ProfilePictureResult {
 ...

 /**
 * Indicates if the request for the profile picture was
 * successful or not.
 */
 HttpResponse.Status getStatus() { ... }
 /**
 * The image data for the profile picture if it was successfully
 * found.
 */
 HttpResponse.Payload? getImageData() { ... }
} 
```

Status의 경우 HTTP 상태 코드에 대한 지식이 있어야 하고, 서버가 어떤 상태 코드를 사용하는지도 알아야 한다.
구현을 변경하는 것 역시 어려운데, status와 payload를 통해 http response에 특정된 유형을 반환한다는 사실에 의존한다. 만약 웹소켓 연결을 사용하는 것으로 요구 사항이 변경 된다면 코드 수정이 너무 많이 일어나야 한다.

#### 8.6.2 해결책: 추상화 계층에 적합한 유형을 반환하라

ProfilePictureService 클래스가 해결하는 문제는 사용자의 프로필 사진을 가져오는 것이다.
따라서 이 클래스를 통해 제공하고자 하는 이상적인 추상화 계층과 모든 반환 형식은 이 점을 반영해야 한다.
다른 개발자에게 노출하는 개념이 최소화되어야 하는데 다음과 같다.

- 요청이 성공/실패 인데, 사용자가 존재하지 않거나 서버에 연결할 수 없는 일시적인 오류일 수 있다
- 프로필 사진을 나타내는 데이터 바이트의 값

이걸 토대로 중요한 변경 사항은 다음과 같다.

- status 열거형을 사용하는 대신 사용자 지정 열거형을 통해 필요한 상태만 신경쓰도록 정의한다
- payload를 반환하는 대신, 바이트 리스트를 반환한다.

``` java
class ProfilePictureResult {
 ...
 enum Status {
   SUCCESS,
   USER_DOES_NOT_EXIST,
   OTHER_ERROR,
 }

 /**
 * Indicates if the request for the profile picture was
 * successful or not.
 */
 Status getStatus() { ... }
 /**
 * The image data for the profile picture if it was successfully
 * found.
 */
 List<Byte>? getImageData() { ... }
} 
```

**열거형**

> Enum 방식에 대해서 개발자 간 의견 차이가 있다. 하지만 여기서의 핵심은 추상화 계층에 적합한 형식을 사용해야 한다는 점이다.

```
의견)
톰 롱 아저씨는 여기서도 객체지향 빠돌이를 의식한 듯 열거형 나오면 또 다형성을 통한 접근법이 있다고 주장하는 놈들을 위해 그게 중요한게 아니라고 무시한다.
매우 심각한 수준의 빠돌이들과 엄청난 토론과 싸움을 하지 않았나 하는 추측을 해볼 수 있는 부분이라고 본다.
```

외부로 노출할 개념을 최소화 하는 유형을 새로 정의해 사용하면
좀 더 모듈화된 코드와 간결한 추상화 계층을 얻을 수 있다.

### 8.7 예외 처리 시 구현 세부 사항이 유출되지 않도록 주의하라

호출하는 쪽에서 복구하고자 하는 오류에 대해 비검사 예외를 사용하는 경우 예외 처리 시 구현 세부 정보를 유출하는 것은 특히 문제가 될 수 있다.

#### 8.7.1 예외 처리 시 구현 세부 사항이 유출되면 문제가 될 수 있다

비검사 예외의 핵심 기능 중 하나는 예외가 발생하는 위치나 시기, 코드가 어디에서 그 예외를 처리하는지 등에 대해
그 어떠한 것도 컴파일러에 의해 강제되지 않는다는 것이다.
비검사 예외에 대한 지식은 코드 계약의 세부 조항을 통해 전달되지만 개발자가 문서화하는 것을 잊어버리면 코드 계약을 통해 전혀 전달되지 않는다.

비검사 예외로 인해 구현 세부 정보가 유출될 수 있고, 인터페이스를 구현하는 클래스가 반드시 인터페이스가 규정하는 오류만 발생시켜야 하는 것은 아니다.

#### 8.7.2 해결책: 추상화 계층에 적절한 예외를 만들라

주어진 추상화 계층을 반영하는 오류 유형만을 드러내는 것이 이상적이다.
적합한 오류 유형으로 감싸면 호출한 쪽에 적절한 추상화 계층이 제시되면서 원래의 오류 정보가 손실되지 않는다.

호출하는 쪽에서 오류로부터 복구하지 않을 것이라는 점이 확실하다면,
구현 세부 정보 유출은 큰 문제가 되지 않는다
그러나, 호출하는 쪽에서 복구하기를 원하는 오류가 있다면,
오류 유형이 추상화 계층에 적합한지 확인하는 것이 중요하다.
검사 예외, 리절트나 아웃컴 반환 유형과 같은 명시적 오류 전달 기법을 사용하면 이것을 쉽게 할 수 있다.

### 요약

- Modular code is often easier to adapt to changing requirements
- One of the key aims of modularity is that a change in a requirement should only affect parts of the code directly related to that requirement
- Making code modular is highly related to creating clean layers of abstraction
- The following techniques can be used to make code modular:
  - Using dependency injection
  - Depending on interfaces instead of concrete classes
  - Using interfaces and composition instead of class inheritance
  - Making classes care about themselves
  - Encapsulating related data together
  - Ensuring that return types and exceptions don’t leak implementation details