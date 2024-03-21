## 10장 데이터 원본 아키텍처 패턴

논의주제)

데이터 원본 패턴을 보면 사실 도메인 논리가 얼마나 복잡하느냐에 따라 데이터 매퍼를 쓰느냐 게이트웨이를 쓰느냐로 갈리는 것 같습니다.

그렇다면 각자 주관적으로 도메인 논리의 복잡성의 기준을 여태까지 프로젝트를 한 경험에 비추어 정량적으로 볼 수 있는 지표를 만들 수 있을까요?
이런 생각을 한 이유는 복잡성에 대한 기준을 정하는 게 어렵긴 하지만 그래도 대략의 가이드라인은 있으면 좋겠는데 그런게 없다보니 복잡성을 생각했을 때는 매우 주관적일 것 같아서 그렇습니다.

저는 대략 class 50개 이상, 인터페이스도 30개 이상, 그리고 테스트 코드 개수가 100개가 넘어간다고 했을 때 이 애플리케이션은 간단하지 않다! 라고 생각할 수 있을 것 같습니다.

그리고 더 추가로 생각해 봐야 할게 투입 인력과 기간을 대략 산정해 봐야 하는데
저는 투입 인력 최소 세 명 이상, 그리고 기간이 두 달 이상(기획, 설계 기간 제외하고 개발, 테스트 기간만 산정)이라면 역시 복잡성이 있는 애플리케이션이다 라고 보고 싶습니다.

- Table Data Gateway
- Row Data GateWay
- Active Record
- Data Mapper

### 테이블 데이터 게이트웨이

> 데이터베이스 테이블에 대한 `게이트웨이` 역할을 하는 객체, 한 인스턴스가 테이블의 모든 행을 처리한다.

![image](https://github.com/jongfeel/BookReview/assets/17442457/357709f6-fab4-45ff-8673-e307da8bd10d)

`테이블 데이터 게이트웨이(Table Data Gateway)`는 단일 테이블이나 뷰에 접근하는 모든 SQL을 포함한다.
다른 코드는 테이블 데이터 게이트웨이의 메서드를 호출해 데이터베이스와의 모든 상호작용을 수행한다.

#### 작동 원리

데이터베이스에서 데이터를 얻는 여러 검색 메서드와 갱신, 삽입, 삭제 메서드로 구성된 간단한 인터페이스를 가진다.
각 메서드는 입력 매개변수를 SQL 호출로 매핑하고 데이터베이스 연결에 대해 SQL을 실행한다.
데이터를 주고 받는 역할을 하므로 상태를 가지지 않는다.

어려운 부분은 쿼리에서 정보를 반환하는 방법이다. ID 기준 검색 쿼리도 여러 데이터 항목을 반환한다. 그래서 대안으로 맵과 같은 간단한 자료구조를 사용한다. 하지만 데이터베이스에서 얻은 레코드 집합을 맵으로 복사하는 과정을 거쳐야 한다. 그래서 `데이터 전송 객체`를 사용하는 것이 나은 방법이다.

SQL 쿼리에서 얻은 `레코드 집합`을 반환하는 방법도 있다.  코드 안에서 레코드 집합을 쉽게 마들 수 없는 경우 데이터베이스를 파일로 대체하기 어려워지는데 레코드 집합을 사용하는 .NET 환경에서는 효과적인 방식이다.

테이블 데이터 게이트웨이는 테이블 모듈과 함께 사용하기 적합하다. 테이블 데이터 게이트웨이를 통해 반환된 데이터가 실제 테이블이 아닌 뷰에 바탕을 둘 수 있으며 이 경우 코드와 데이터베이스 간의 결합이 줄어든다.

도메인 모델을 사용하는 경우 테이블 데이터 게이트웨이가 적절한 도메인 객체를 반환하게 할 수 있다. 이렇게 하면 양방향 의존성이 생기는 문제가 있다. 심각하진 않지만 피하는 게 좋다.

데이블 데이터 게이트웨이는 데이터베이스 테이블 당 하나씩 사용하는 경우가 많다. 간단한 경우에는 모든 테이블의 모든 메서드를 처리할 수도 있다. 쿼리를 통해 뷰 기반 데이터 게이트웨이를 사용할 수도 있다.

#### 사용 시점

먼저 게이트웨이를 사용할지 여부를 결정한 후에 어떤 방식을 사용할지 결정한다.

데이터베이스 테이블이나 레코드 형식에 잘 매핑되므로 가장 간단하게 사용할 수 있는 데이터베이스 인터페이스 패턴이다.
또 데이터 원본의 접근 논리를 캡슐화 하는데 적합한 위치이다.

테이블 데이터 게이트웨이는 테이블 모듈과 잘 어울리며, 테이블 모듈이 작업할 레코드 집합 자료구조를 생성할 수 있다.
테이블 모듈에 다른 데이터베이스 매핑 방식을 생각할 수 없을 정도이다.

테이블 데이터 게이트웨이는 행 데이터 게이트웨이와 마찬가지로 트랜잭션 스크립트와 함께 사용하는 데 아주 적합하다.

데이터 매퍼가 테이블 데이터 게이트웨이를 통해 데이터베이스와 상호작용하면 유용한 경우가 있다.
테이블 데이터 게이트웨이는 메타데이터를 사용하고, 도메인 객체의 실재 매핑은 직접 작성하려면 이 방법이 효과적이다.

테이블 데이터 게이트웨이로 데이터베이스 접근을 캡슐화하면 SQL을 사용해 데이터베이스를 조작할 때와 저장 프로시저를 사용할 때 동일한 인터페이스를 사용할 수 있는 장점이 있다. 저장 프로시저가 테이블 데이터 게이트웨이로 구성된 경우도 많다.

#### 참고 자료

[Alur et al.] 에서는 테이블 데이터 게이트웨이와 동일한 개념의 접근 패턴을 얘기하며, 쿼리 메서드에서 `데이터 전송 객체`의 컬렉션을 반환하는 방법을 설명한다.

#### 예제: 인물 게이트웨이(C#)

테이블 데이터 게이트웨이는 윈도우 환경에서 데이터베이스에 접근하는 일반적인 방식으로 C# 예제가 적합하다.
참고로 예제는 전통적인 방식이며 ADO.NET 데이터 집합을 사용하지 않고 데이터 리더를 사용해 현재 .NET 환경에는 적합하지 않다. 데이터 리더는 한번에 메모리로 가져오지 않고 많은 양의 정보를 조적하려고 할 때 좋은 선택이다.

예제는 데이터베이스의 인물 테이블에 연결하는 인물 게이트웨이 클래스를 보여준다.

``` c#
class PersonGateway {
  public IDataReader FindAll() {
    String sql = "select * from person";
    return new OleDbCommand(sql, DB.Connection).ExecuteReader();
  }

  public IDataReader FindWithLastName(String lastName) {
    String sql = "SELECT * FROM person WHERE lastname = ?";
    IDbCommand comm = new OleDbCommand(sql, DB.Connection);
    comm.Parameters.Add(new OleDbParameter("lastname", lastName));
    return comm.ExecuteReader();
  }

  public IDataReader FindWhere(String whereClause) {
    String sql = String.Format("select * from person where {0}", whereClause);
    return new OleDbCommand(sql, DB.Connection).ExecuteReader();
  }
}
```

리더를 이용하면 한 번에 여러 행을 가져올 수 있는데, 가끔 개별 데이터 행을 가져올 수도 있다.

``` c#
class PersonGateway
{
  public Object[] FindRow (long key)
  {
    String sql = "SELECT * FROM person WHERE id = ?";
    IDbCommand comm = new OleDbCommand(sql, DB.Connection);
    comm.Parameters.Add(new OleDbParameter("key",key));
    IDataReader reader = comm.ExecuteReader();
    reader.Read();
    Object [] result = new Object[reader.FieldCount];
    reader.GetValues(result);
    reader.Close();
    return result;
  }
}
```

업데이트 및 삽입 메서드는 필요한 데이터를 인수로 받고 적절한 SQL 쿼리를 실행한다.

``` c#
public void Update(long key, string lastname, string firstname, long numberOfDependents);
```

삭제 메서드에는 키만 있으면 된다.

``` c#
public void Delete(long key);
```

#### 예제: ADO.NET 데이터 집합 사용(C#)

데이터 집합에 데이터를 로드하고 업데이트하려면 데이터 어댑터가 필요하다. 데이터 집합과 어댑터를 위한 홀더를 정의하면 유용하다. 게이트웨이는 홀더를 이용해 데이터 집합을 저장할 수 있다.

홀더는 테이블 이름을 기준으로 데이터 집합과 어댑터를 인덱싱한다.

``` c#
class DataSetHolder
{
  public DataSet Data = new();
  private Hashtable DataAdapters = new();
}
```

![image](https://github.com/jongfeel/BookReview/assets/17442457/066ffe16-4c4e-4d4c-bd85-94c6d9d87cc7)

게이트웨이는 홀더를 저장하고 데이터 집합을 클라이언트에 노출한다.

``` c#
class DataGateway
{
  public DataSetHolder Holder;
  public DataSet Data => Holder.Data;
}
```

게이트웨이는 기존 홀더로 작업하거나 새 홀더를 만들 수 있다.

``` c#
class DataGateway
{
  protected DataGateway() => Holder = new DataSetHolder();
  protected DataGateway(DataSetHolder holder) => Holder = holder;
}
```

데이터 집합은 테이블 기반 데이터의 컨테이너이며 여러 테이블에서 가져온 데이터를 저장할 수 있다. (책 예제 코드 참고)
따라서 데이터 집합에 데이터를 로드하는 것이 좋다. (책 예제 코드 참고)
업데이트에서는 홀더의 업데이트 동작을 트리거한다. (책 예제 코드 참고)
삽입은 데이터 집합을 얻고, 데이터 테이블에 새 행을 삽입하고 각 열을 채운다. 업데이트 메서드 호출로 삽입을 한다. (책 예제 코드 참고)

### 행 데이터 게이트웨이

> 데이터 원본의 단일 레코드에 대한 게이트웨이 역할을 하는 객체, 행마다 인스턴스가 하나가 사용된다.

![image](https://github.com/jongfeel/BookReview/assets/17442457/d63b85dc-07eb-4c26-b554-7879abe60d19)

데이터베이스 접근 코드를 인메모리 객체에 넣는 방법에는 몇 가지 단점이 있다.

- 자체 비즈니스 논리가 있는 인메모리 객체에 데이터베이스 조작 코드를 넣으면 복잡해진다.
- 인메모리 객체가 데이터베이스 접근 시 테스트 실행이 느리므로 테스트가 불편해진다.
- 여러 데이터베이스에서 SQL의 차이점을 모두 고려해서 데이터베이스 접근이 필요할 수 있다.

`행 데이터 게이트웨이(Row Data Gateway)`는 레코드 구조의 레코드와 완전 동일하고, 프로그래밍 언어의 매커니즘으로 접근 가능한 객체를 제공한다. 데이터 원본 접근에 대한 세부 사항은 이 인터페이스 너머에 숨어있다.

#### 작동 원리

행 데이터 게이트웨이는 데이터베이스 행 하나, 단일 레코드의 흉내를 내는 객체이다. 컬럼은 객체의 필드가 된다.

행 데이터 게이트웨이를 사용할 때는 이 패턴을 생성하는 검색 작업을 어디에 해야 할지 결정해야 한다.
별도의 검색기 객체를 두고 데이터베이스 테이블 마다 검색기 클래스 하나와 결과에 대한 게이트웨이 클래스 하나를 사용한다. (그림 10.2)

![image](https://github.com/jongfeel/BookReview/assets/17442457/eb85414f-080a-4da0-974f-2492b6432a83)

`행 데이터 게이트웨이`와 `활성 레코드`의 차이를 구분하기 어려울 수 있다.
핵심적인 차이는 도메인 논리가 있으면 활성 레코드이다.
행 데이터 게이트웨이는 데이터베이스 접근 논리만 포함하고 도메인 논리는 없다.

행 데이터 게이트웨이는 테이블 외에 뷰나 쿼리에도 사용할 수 있다. 이런 방식으로 업데이트를 할 때는 기반 테이블을 업데이트 해야 하므로 작업이 더 복잡해진다.

행 데이터 게이트웨이의 코드를 직접 작성하기는 지루하지만 `메타데이터 매핑`을 활용해 코드를 자동으로 생성할 수 있다.

#### 사용 시점

우선 게이트웨이가 필요한지 여부를 결정하고
`행 데이터 게이트웨이`와 `테이블 데이터 게이트웨이` 중 무엇을 사용할지 결정해야 한다.

트랜잭션 스크립트의 경우 행 데이터 게이트웨이를 많이 사용한다. 데이터베이스 접근 코드의 분리와 함께 다른 트랜잭션 스크립트에서 재사용 가능해진다.

도메인 모델에는 사용하지 않는다.
매핑이 간단하다면 `활성 레코드`로 추가적인 코드 계층 없이 작업 할 수 있다.
매핑이 복잡하다면 자료구조와 도메인 객체의 결합을 느슨하게 해주는 `데이터 매퍼`가 좋은 선택이다.

물론 도메인 객체를 데이터베이스 구조로 부터 보호하는데 행 데이터 게이트웨이를 활용할 수 있지만,
대규모 환경에서는 데이터 표현이 비즈니스 논리, 행 데이터 게이트웨이, 데이터베이스에 하나씩 총 세 가지가 되는 문제가 있으므로 데이터베이스와 구조가 같은 행 데이터 게이트웨이를 사용한다.

<img width="506" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/7b14497c-c6ce-4cf0-9f3d-e979d21c8f73">

흥미로운 점으로, 행 데이터 게이트웨이를 데이터 매퍼와 연결할 수 있다. 메타데이터를 써서 행 데이터 게이트웨이를 자동으로 생성하고 데이터 매퍼만 직접 작성하면 효과적인 방법이 된다.

트랜잭션 스크립트 + 행 데이터 게이트웨이에서 여러 비즈니스 논리가 반복되고, 논리를 옮기다 보면 점차 활성 레코드로 변하는데 논리의 중복을 줄인다는 측면에서는 좋은 방법이다.

#### 예제: 인물 레코드(자바)

인물 테이블을 사용하는 행 데이터 게이트웨이의 예

``` java
create table people (ID int primary key, lastname varchar, firstname varchar, number_of_dependents int)
```

PersonGateway는 테이블에 대한 게이트웨이이며, 데이터 필드와 접근자로 시작한다.

``` java
class PersonGateway {
  private String lastName;
  private String firstName;
  private int numberOfDependents;
  public String getLastName() {
    return lastName;
  }
  public void setLastName(String lastName) {
    this.lastName = lastName;
  }
  public String getFirstName() {
    return firstName;
  }
  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }
  public int getNumberOfDependents() {
    return numberOfDependents;
  }
  public void setNumberOfDependents(int numberOfDependents) {
    this.numberOfDependents = numberOfDependents;
  }
}
```

게이트웨이 클래스는 업데이트와 삽입을 자체적으로 처리할 수 있다.

``` java
class PersonGateway {
  private static final String updateStatementString =
    "UPDATE people " +
    " set lastname = ?, firstname = ?, number_of_dependents = ? " +
    " where id = ?";
  public void update() {
    PreparedStatement updateStatement = null;
    try {
      updateStatement = DB.prepare(updateStatementString);
      updateStatement.setString(1, lastName);
      updateStatement.setString(2, firstName);
      Row Data Gateway 143
      www.EbooksWorld.ir
      updateStatement.setInt(3, numberOfDependents);
      updateStatement.setInt(4, getID().intValue());
      updateStatement.execute();
    } catch (Exception e) {
      throw new ApplicationException(e);
    } finally {
      DB.cleanUp(updateStatement);
    }
  }
  private static final String insertStatementString =
    "INSERT INTO people VALUES (?, ?, ?, ?)";
  public Long insert() {
    PreparedStatement insertStatement = null;
    try {
      insertStatement = DB.prepare(insertStatementString);
      setID(findNextDatabaseId());
      insertStatement.setInt(1, getID().intValue());
      insertStatement.setString(2, lastName);
      insertStatement.setString(3, firstName);
      insertStatement.setInt(4, numberOfDependents);
      insertStatement.execute();
      Registry.addPerson(this);
      return getID();
    } catch (SQLException e) {
      throw new ApplicationException(e);
    } finally {
      DB.cleanUp(insertStatement);
    }
  }
}
```

PersonFinder는 데이터베이스에서 인물을 가져오며, 게이트웨이와 함께 새로운 게이트웨이 객체를 만든다.

``` java
class PersonFinder {
  private final static String findStatementString =
    "SELECT id, lastname, firstname, number_of_dependents " +
    " from people " +
    " WHERE id = ?";
  public PersonGateway find(Long id) {
    PersonGateway result = (PersonGateway) Registry.getPerson(id);
    if (result != null) return result;
    PreparedStatement findStatement = null;
    ResultSet rs = null;
    try {
      findStatement = DB.prepare(findStatementString);
      findStatement.setLong(1, id.longValue());
      rs = findStatement.executeQuery();
      rs.next();
      result = PersonGateway.load(rs);
      return result;
    } catch (SQLException e) {
      throw new ApplicationException(e);
    } finally {
      DB.cleanUp(findStatement, rs);
    }
  }
  public PersonGateway find(long id) {
    return find(new Long(id));
  }
}
```

조건에 따라 두 명 이상의 인물을 검색할 수 있도록 검색기 메서드를 제공할 수 있다. (책 예제 참고)
검색기는 `식별자 맵`을 저장하기 위해 `레지스트리`를 사용한다. 
이제 트랜잭션 스크립트에서 게이트웨이를 사용할 수 있다.

#### 예제: 도메인 객체를 위한 데이터 홀더(자바)

데이터를 도메인 객체로 복사하는 대신 행 데이터 게이트웨이를 도메인 객체에 대한 데이터 홀더로 사용한다.

``` java
class Person {
    private PersonGateway data;
    public Person(PersonGateway data) {
      this.data = data;
    }
}
```

도메인 논리의 접근자는 데이터에 대한 게이트웨이로 위임할 수 있다.

``` java
class Person {
    public int getNumberOfDependents() {
        return data.getNumberOfDependents();
    }
}
```

도메인 논리에서는 접근자 메서드를 사용해 게이트웨이에서 데이터를 가져온다.

``` java
class Person {
    public Money getExemption() {
        Money baseExemption = Money.dollars(1500);
        Money dependentExemption = Money.dollars(750);
        return baseExemption.add(dependentExemption.multiply(this.getNumberOfDependents()));
    }
}
```

### 활성 레코드

> 데이터베이스 테이블이나 뷰의 행을 래핑하고, 데이터베이스 접근을 캡슐화하며, 해당 데이터에 대한 도메인 논리를 추가하는 객체

<img width="407" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/51844c16-a1bd-40b3-8c19-40928557cf1c">

활성 레코드는데이터 접근 논리를 도메인 객체에 넣는 합리적인 방식을 사용한다.
이 방법을 쓰면 해당 데이터를 데이터베이스에서 읽고 저장하는 방법을 알 수 있다.

#### 작동 원리

`활성 레코드(Active Record)의 핵심은 도메인 모델이며 클래스는 기반 데이터베이스의 레코드 구조와 거의 일치하게 된다.
활성 레코드는 데이터베이스에 데이터를 저장 및 로드하고 해당 데이터를 대상으로 하는 모든 도메인 논리를 담당한다.
모든 도메인 논리를 포함시켜 작업할 수도 있고, 일부는 트랜잭션 스크립트에 포함시킬 수 있다.

활성 레코드의 자료구조는 데이터베이스의 구조와 정확하게 일치해야 한다. `왜래 키 매핑`을 고려할 수 있지만 왜래 키도 원래대로 유지한다. 뷰나 테이블을 활성 레코드와 함께 사용할 수 있지만 뷰를 통해 업데이트하기는 확실히 힘들다.

활성 레코드 클래스에는 아래의 메서드들이 있다.

- SQL 결과 집합 행을 이용해 활성 레코드의 인스턴스를 생성
- 테이블에 삽입할 새로운 인스턴스 생성
- 자주 사용하는 SQL 쿼리를 래핑하고 활성 레코드 객체를 반환하는 정적 검색기 메서드
- 데이터베이스를 업데이트하고 활성 레코드의 데이터 삽입
- 필드 얻기 및 설정
- 비즈니스 논리의 일부를 구현

필드 얻기와 설정 메서드는 SQL을 인메모리 형식으로 변환하는 등의 유용한 다른 작업도 할 수 있다.

클래스 구조에서 관계형 데이터베이스가 있다는 사실을 감출 수는 없다. 따라서 일반적으로 다른 객체-관계형 매핑 패턴이 적게 사용된다.

행 데이터 게이트웨이와 아주 비슷하다.
차이점은 행 데이터 게이트웨이는 데이터베이스 접근만 하고, 활성 레코드는 데이터 원본과 도메인 논리를 모두 포함한다.
소프트웨어 경계를 생각할 때 이 구분은 유용하다.

데이터베이스와의 밀접한 결합으로 정적 검색 메서드가 사용될 수도 있다.
하지만 클래스로 분리하는 게 테스트를 쉽게 하기 위해서 좋은 방법이다.

테이블 뿐 아니라 뷰나 쿼리에도 사용할 수 있다.

#### 사용 시점

CRUD의 기본적인 도메인 논리를 처리하는 데 적합하다.
단일 레코드 기반의 파생과 유효성 검사는 이 구조에서 잘 작동한다.

도메인 모델을 설계하는 초기 단계에서 `활성 레코드` vs `데이터 매퍼`를 선택하는 게 중요하다.
활성 레코드의 장점은 단순성이므로 작성과 이해가 쉽다. 문제점으로는 활성 레코드 객체는 데이터베이스 테이블과 1:1 대응 동형(isomorphic) 스키마일 때만 잘 작동한다.
비즈니스 논리가 복잡해지면서 객체의 직접 관계, 컬렉션, 상속을 사용할 필요가 생기면 데이터 매퍼로 방향을 바꿀 필요가 있다.

활성 레코드를 반대하는 의견 중 하나로 객체 설계를 데이터베이스 설계와 결합한다는 것이다.
그래서 프로젝트가 진행되는 동안에 두 설계를 리팩터링 하기가 더 어려워진다.

처음에 트랜잭션 스크립트를 사용하면서 코드 중복과 스크립트 테이블 업데이트가 어려워지면 활성 레코드를 고려해 볼 수 있다.

#### 예제: 간단한 인물 클래스(자바)

``` java
class Person {
    private String lastName;
    private String firstName;
    private int numberOfDependents;
}
```

상위 클래스에는 ID 필드가 있고, 데이터베이스도 동일한 구조로 설정된다.

``` sql
create table people (ID int primary key, lastname varchar, firstname varchar, number_of_dependents int)
```

인물 클래스는 객체를 로드하는 검색기 역할을 하고, 직접 로드도 한다. 예제는 정적 메서드를 사용한다.

``` java
class Person {
  private final static String findStatementString =
    "SELECT id, lastname, firstname, number_of_dependents" +
    " FROM people" +
    " WHERE id = ?";
  public static Person find(Long id) {
    Person result = (Person) Registry.getPerson(id);
    if (result != null) return result;
    PreparedStatement findStatement = null;
    ResultSet rs = null;
    try {
      findStatement = DB.prepare(findStatementString);
      findStatement.setLong(1, id.longValue());
      rs = findStatement.executeQuery();
      rs.next();
      result = load(rs);
      return result;
    } catch (SQLException e) {
      throw new ApplicationException(e);
    } finally {
      DB.cleanUp(findStatement, rs);
    }
  }
  public static Person find(long id) {
    return find(new Long(id));
  }
  public static Person load(ResultSet rs) throws SQLException {
    Long id = new Long(rs.getLong(1));
    Person result = (Person) Registry.getPerson(id);
    if (result != null) return result;
    String lastNameArg = rs.getString(2);
    String firstNameArg = rs.getString(3);
    int numDependentsArg = rs.getInt(4);
    result = new Person(id, lastNameArg, firstNameArg, numDependentsArg);
    Registry.addPerson(result);
    return result;
  }
}
```

객체를 업데이트하는 데는 update(), 삽입은 insert() 메서드를 이용한다. (책 예제 코드 참고)
모든 비즈니스 논리는 인물 클래스에 포함된다. (책 예제 코드 참고)

### 데이터 매퍼

> 객체와 데이터베이스 사이에서 둘 사이는 물론 매퍼 자체에 대한 독립성을 유지하면서 데이터를 옮기는 `매퍼`의 한 계층

<img width="502" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/b3cda219-e055-4411-82ba-553b19e99046">

객체에만 지원되는 매커니즘을 활용할 경우 객체 스키마와 관계형 스키마가 일치하지 않는 이형(variant) 스키마가 만들어진다.
이형 스키마 간의 데이터 전송은 본질적으로 아주 복잡하다. 인메모리 객체가 관계형 데이터베이스 구조에 대해 알고 있으면 한쪽의 변화가 다른 쪽에 영향을 미치게 된다.

`데이터 매퍼(Data Mapper)`는 인메모리 객체를 데이터베이스로부터 분리하는 소프트웨어 계층이다.
데이터 매퍼의 역할은 인메모리 객체와 데이터베이스 사이에서 데이터를 전송하고 동시에 둘을 서로 격리하는 것이다.
데이터 매퍼에서 인메모리 객체는 데이터베이스가 있다는 걸 알 필요가 없다. SQL 인터페이스 코드도 필요가 없으며 데이터베이스 스키마에 대해서도 알 필요가 없다.
데이터 매퍼는 `매퍼`의 한 형태이므로 도메인 계층에도 알려지지 않는다.

#### 작동 원리

개념을 설명하기 위해 기본 적인 예제로 인물과 인물 매퍼 클래스를 사용한다.
클라이언트는 데이터베이스에서 인물을 로드하기 위해 매퍼의 검색 매서드를 호출한다. (그림 10.3)
매퍼는 `식별자 맵`을 사용해 해당 인물이 로드됐는지 확인한다.

<img width="503" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/afb3e62c-fd08-4179-85a3-6910b68a49c0">

클라이언트가 도메인 객체를 저장하도록 매퍼에 요청한다.
매퍼는 도메인 객체에서 데이터를 받고 이를 데이터베이스로 전달한다. (그림 10.4)

<img width="502" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/3a3bd7e9-d94e-4d2d-9d4b-73286ec20bcb">

데이터 매퍼의 전체 계층은 테스트 용도 또는 단일 도메인 계층이 다른 데이터베이스와 동작할 수 있도록 대체될 수 있다.

간단한 데이터 매퍼는 데이터베이스 테이블을 인메모리 클래스에 필드-대-필드 방식으로 매핑할 수 있다.

객체는 복잡하게 상호연결되므로 어떤 지점에서는 데이터 읽기를 중단해야 한다. 매핑 계층은 `지연 로드`라는 기법을 사용해 인메모리 객체에 미치는 영향을 최소화하면서 작업을 할 수 있다. 따라서 인메모리 객체는 매핑 계층을 완전히 몰라도 되는 건 아니며, 검색기나 몇 가지 다른 매커니즘에 대해 알아야 할 수 있다.

한 애플리케이션은 데이터 매퍼를 여러 개 가질 수 있다.
반면 `메타데이터 매핑`을 사용할 때는 단일 매퍼 클래스를 사용해도 된다. 이 때는 검색 메서드가 문제가 될 수 있다. 규모가 크면 검색 메서드가 여러 개 포함된 단일 매퍼를 사용하기는 어려울 수 있기 때문에 각 도메인 클래스나 도메인 계층의 루트마다 분할한다. 여러 개의 작은 검색기 클래스를 만들어야 하지만 개발자가 필요한 검색기를  찾기가 더 쉬워진다.

검색기는 데이터베이스에서 읽은 객체의 식별자를 유지하기 위해 `식별자 맵`을 사용한다.
이를 위해 `레지스트리`나 `식별자 맵`을 사용하거나 각 검색기가 `식별자 맵`을 가질 수 있다.

검색기 처리:
도메인 계층이 필요로 하는 모든 객체를 메모리로 로드했거나 `지연 로드`를 사용해 필요할 때 추가 객체를 로드하는 경우 효과적으로 작동한다.

도메인 객체가 데이터 매퍼의 검색 메서드를 호출하는 경우, `지연 로드`를 잘 설계하면 예방할 수 있다.
도메인 객체에 데이터 매퍼에 대한 의존성을 추가하는 것은 바람직하지 않다.

`분리 인터페이스`를 이용하면 이 딜레마를 해결할 수 있다. 도메인 코드에 필요한 모든 검색 메서드를 한 인터페이스 클래스에 넣고 이를 도메인 패키지에 넣는다.

데이터를 도메인 필드로 매핑:
매퍼는 도메인 객체의 필드에 접근할 수 있야 한다.
매퍼를 도메인 객체와 가까운 위치에 패키징 해서 낮은 수준의 가시성을 활용하는 방법이 있지만,
도메인 객체에 대해 아는 시스템의 다른 부분도 매퍼에 대해 알게되므로 의존성에 혼란이 생긴다.
리플랙션을 사용하거나, 공용 메서드를 통해 상태 필드로 보호하는 방법도 있다.

관련해서 객체를 언제 생성할지도 결정해야 한다.

- 리치 생성자(rich constructor): 객체를 모든 필수 데이터가 포함된 상태로 생성
- 비어 있는 객체를 생성 후 나중에 필수 데이터로 채우는 방법

리치 생성자를 사용할 때는 순환 참조 문제를 알고 있어야 한다. `지연 로드`를 써서 특수 사례 코드를 작성해야 한다.
특수 사례 코드는 쉬운 방법이 아니므로 비어있는 객체(empty object)를 사용한다. 인수 없는 생성자를 통해 비어 있는 객체를 생성하고 이를 곧 식별자 맵에 삽입한다. 순환이 있으면 식별자 맵에서 빈 객체가 반환되고, 이를 확인하면 순환 로딩을 중단할 수 있다.

데이터 기반 매핑:
도메인 객체의 필드와 데이터베이스의 열이 어ㄸ허게 매핑되는지를 저장하는 방법도 결정해야 한다.
간단하고 좋은 방법은 명시적으로 도메인 객체별로 매퍼 클래스를 생성한다.
다른 방법으로 메타데이터를 클래스나 별도의 파일을 통해 데이터로 저장하는 `메타데이터 매핑`을 사용하는 것이다.
메타데이터의 장점은 매퍼의 변형을 코드 생성이나 리플랙션 프로그래밍을 활용해 소스코드를 추가로 작성하지 않고 데이터를 통해 처리할 수 있다는 것이다.

#### 사용 시점

데이터 매퍼를 사용하는 이유는 데이터베이스 스키마와 객체 모델을 분리해서 발전시킬 수 있기 때문이다.
도메인 모델과 함께 데이터 매퍼를 사용하면 설계와 구축, 테스트 프로세스에서 데이터베이스를 고려할 필요가 없다.
도메인 객체에 집중해 코드를 편하게 작성할 수 있고 도메인 모델이나 데이터베이스를 독릭접으로 변경할 수 있다.

만약 활성 레코드를 사용할 때는 계층 하나를 더 만들어야 한다. 그래서 이 패턴이 가치가 있으려면 비즈니스 논리가 얼마나 복잡하느냐에 달려 있다. 비즈니스 논리가 간단할 경우 도메인 모델, 데이터 매퍼는 필요가 없을 것이다.

데이터 매퍼 없이 도메인 모델을 사용할 때는 활성 레코드를 사용해 직접 데이터베이스에 접근하는 게 합리적이다.
이후 논리가 복잡해지면 데이터베이스 동작을 별도의 계층으로 리팩터링 하는 것이 바람직하다.

데이터 매핑 계층을 직접 만드는 건 복잡한 일이므로 데이터베이스 매핑 툴을 이용한다.

#### 예제: 간단한 데이터베이스 매퍼(자바)

활성 레코드와 마찬가지로 인물 클래스 예제이고 스키마도 동일하다.

``` java
class Person {
    private String lastName;
    private String firstName;
    private int numberOfDependents;
}
```

``` sql
create table people (ID int primary key, lastname varchar, firstname varchar, number_of_dependents int)
```

인물 매퍼(PersonMapper) 클래스는 검색기와 `식별자 맵`을 구현한다.
공통 동작을 가져올 수 있는 위치를 나타내는 추상 매퍼 `계층 상위 형식`을 하나 추가한다.
로딩 작업에는 객체가 `식별자 맵`에 이미 있는지 확인한 다음 데이터베이스에서 데이터를 가져오는 과정이 포함된다.

검색 동작은 추상 검색 메서드에 대한 호출을 래핑해 ID를 기준으로 검색하는 인물 매퍼에서 시작한다.

``` java
class PersonMapper {
  protected String findStatement() {
    return "SELECT " + COLUMNS +
      " FROM people" +
      " WHERE id = ?";
  }

  public static final String COLUMNS = " id, lastname, firstname, number_of_dependents ";

  public Person find(Long id) {
    return (Person) abstractFind(id);
  }

  public Person find(long id) {
    return find(new Long(id));
  }
}

class AbstractMapper {
  protected Map loadedMap = new HashMap();
  abstract protected String findStatement();
  protected DomainObject abstractFind(Long id) {
    DomainObject result = (DomainObject) loadedMap.get(id);
    if (result != null) return result;
    PreparedStatement findStatement = null;
    try {
      findStatement = DB.prepare(findStatement());
      findStatement.setLong(1, id.longValue());
      ResultSet rs = findStatement.executeQuery();
      rs.next();
      result = load(rs);
      return result;
    } catch (SQLException e) {
      throw new ApplicationException(e);
    } finally {
      DB.cleanUp(findStatement);
    }
  }
}
```

검색 메서드는 load를 호출, 추상 매퍼는 ID를 확인하고 데이터에서 ID를 가져온 다음 새로운 객체를 `식별자 맵`에 등록한다.

``` java
class AbstractMapper {
  protected DomainObject load(ResultSet rs) throws SQLException {
    Long id = new Long(rs.getLong(1));
    if (loadedMap.containsKey(id)) return (DomainObject) loadedMap.get(id);
    DomainObject result = doLoad(id, rs);
    loadedMap.put(id, result);
    return result;
  }
  abstract protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException;
}

class PersonMapper {
  protected DomainObject doLoad(Long id, ResultSet rs) throws SQLException {
    String lastNameArg = rs.getString(2);
    String firstNameArg = rs.getString(3);
    int numDependentsArg = rs.getInt(4);
    return new Person(id, lastNameArg, firstNameArg, numDependentsArg);
  }
}
```

`식별자 맵`은 abstractFind와 load에서 각각 한번 씩 확인하는데, 이유가 있다.

검색기에서 맵을 확인한 이유는 객체가 이미 있을 경우 데이터베이스에 조회를 하지 않아도 되기 때문이다.
load에서도 다시 확인한 이유는 `식별자 맵`에 확인되지 않은 쿼리가 있을 수 있기 때문이다.

검색 메서드가 필요한 하위 클래스에 검색기 메서드를 작성할 때는 공용 메서드를 제공해서 반복 작업을 줄인다.

``` java
class AbstractMapper {
  public List findMany(StatementSource source) {
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
      stmt = DB.prepare(source.sql());
      for (int i = 0; i < source.parameters().length; i++)
        stmt.setObject(i + 1, source.parameters()[i]);
      rs = stmt.executeQuery();
      return loadAll(rs);
    } catch (SQLException e) {
      throw new ApplicationException(e);
    } finally {
      DB.cleanUp(stmt, rs);
    }
  }
}
```

이 방법을 쓰려면 SQL 문자열 래핑 후에 매개변수를 prepared statement로 로드하는 인터페이스가 있어야 한다.

``` java
interface StatementSource {
    String sql();
    Object[] parameters();
}
```

이후 내부 클래스로 구현해서 이 기능을 사용한다.

``` java
class PersonMapper {
  public List findByLastName2(String pattern) {
    return findMany(new FindByLastName(pattern));
  }
  static class FindByLastName implements StatementSource {
    private String lastName;
    public FindByLastName(String lastName) {
      this.lastName = lastName;
    }
    public String sql() {
      return "SELECT " + COLUMNS +
        " FROM people " +
        " WHERE UPPER(lastname) like UPPER(?)" +
        " ORDER BY lastname";
    }
    public Object[] parameters() {
      Object[] result = {
        lastName
      };
      return result;
    }
  }
}
```

반복 코드를 많이 써야 한다면 이와 비슷한 기법을 사용하면 좋다.

업데이트 작업은 JDBC 코드를 하위 형식에 연결한다. (책 예제 코드 참고)
삽입 작업의 코드 일부는 `계층 상위 형식`으로 분리할 수 있다. (책 예제 코드 참고)

#### 예제: 검색기 분리(자바)

도메인 객체가 검색기 동작을 호출하려면 `분리 인터페이스`를 이용해 매퍼에서 검색기 인터페이스를 분리한다. (그림 10.5)
검색기 인터페이스는 도메인 계층 안에 넣을 수 있고, 별도 패키지로 넣을 수도 있다.

흔한 검색 예제로 특정 대리 ID를 기준으로 객체를 찾는다. 일반적인 작업이므로 적절한 `계층 상위 형식`에서 처리할 수 있다.
이 작업에는 ID에 대해 아는 도메인 객체의 `계층 상위 형식`이 필요하다.

**Figure 10.5. Defining a finder interface in the domain package.**
<img width="508" alt="image" src="https://github.com/jongfeel/BookReview/assets/17442457/90fc4aee-1a79-4feb-811d-9bf84059c4c2">

검색기 인터페이스에서 반환 형식이 무엇인지 알아야 하므로 범용적으로 만들지 않는 것이 좋다.

``` java
interface ArtistFinder {
    Artist find(Long id);
    Artist find(long id);
```

검색기 인터페이스는 도메인 패키지에 선언하고 검색기는 `레지스트리`에 포함되게 하는 것이 좋다.
이 경우 매퍼 클래스가 검색기 인터페이스를 구현한다.

``` java
class ArtistMapper implements ArtistFinder {
  public Artist find(Long id) {
    return (Artist) abstractFind(id);
  }
  public Artist find(long id) {
    return find(new Long(id));
  }
}
```

검색 메서드의 주요 부분이 매퍼의 `계층 상위 형식`에 의해 수행되며, `식별자 맵`을 검사해 객체가 이미 메모리에 있는지 확인한다.
객체가 메모리에 없다면 음악가 매퍼에 의해 로드된 준비된 문을 완성한 후 실행한다.

``` java
class AbstractMapper {
  abstract protected String findStatement();
  protected Map loadedMap = new HashMap();
  protected DomainObject abstractFind(Long id) {
    DomainObject result = (DomainObject) loadedMap.get(id);
    if (result != null) return result;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
      stmt = DB.prepare(findStatement());
      stmt.setLong(1, id.longValue());
      rs = stmt.executeQuery();
      rs.next();
      result = load(rs);
      return result;
    } catch (SQLException e) {
      throw new ApplicationException(e);
    } finally {
      cleanUp(stmt, rs);
    }
  }
}
class ArtistMapper {
  protected String findStatement() {
    return "select " + COLUMN_LIST + " from artists art where ID = ?";
  }
  public static String COLUMN_LIST = "art.ID, art.name";
}
```

동작의 검색에서는 기존 객체나 새로운 객체를 얻는 일을 한다.
로드 부분은 데이터베이스에서 가져온 데이터를 새로운 객체에 넣는 일을 한다. (책 예제 코드 참고)

load 메서드로 `식별자 맵`을 검사한다. 또 쿼리를 바탕으로 검색할 수도 있다. 그러면 인터페이스에 검색기를 선언한다.

``` java
interface TrackFinder {
    Track find(Long id);
    Track find(long id);
    List findForAlbum(Long albumID);
}
```

특정 검색 메서드는 `계층 상위 형식`이 아니라 트랙 매퍼 클래스와 같은 특정 클래스에 구현한다. (책 예제 코드 참고)

이전 예제와 마찬가지로 이미 로드된 객체가 있는지 `식별자 맵`을 검사하는 것을 포함해 이 작업의 일부는 `계층 상위 형식`에서 처리할 수 있다.

#### 예제: 비어 잇는 객체 만들기(자바)

객체 로드 하는 방식 중에 생성자를 이용해 생성하는 방식이고 이전에 봤전 예제의 방식이다.
다른 방법으로는 비어 있는 객체를 만든 후에 설정 메서드를 통해 객체를 로드하는 방식이다.

``` java
class AbstractMapper {
  protected DomainObjectEL load(ResultSet rs) throws SQLException {
    Long id = new Long(rs.getLong(1));
    if (loadedMap.containsKey(id)) return (DomainObjectEL) loadedMap.get(id);
    DomainObjectEL result = createDomainObject();
    result.setID(id);
    loadedMap.put(id, result);
    doLoad(result, rs);
    return result;
  }
  abstract protected DomainObjectEL createDomainObject();
  abstract protected void doLoad(DomainObjectEL obj, ResultSet rs) throws SQLException;
}
class PersonMapper {
  protected DomainObjectEL createDomainObject() {
    return new Person();
  }
  protected void doLoad(DomainObjectEL obj, ResultSet rs) throws SQLException {
    Person person = (Person) obj;
    person.dbLoadLastName(rs.getString(2));
    person.setFirstName(rs.getString(3));
    person.setNumberOfDependents(rs.getInt(4));
  }
}
```

이 예제에서는 설정 메서드의 사용을 제어하기 위해 다른 종류의 도메인 객체 `계층 상위 형식`을 사용하고 있다.

한가지 걸리는 점은 인터페이스에 인물 클래스의 클라이언트 대다수가 사용할 수 없는 메서드가 추가 된다는 점이다.
매퍼에서 리플랙션을 쓰면 되지만, 이 방법은 자바의 보호 매커니즘을 무시하는 것이다.