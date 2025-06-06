### 논의내용
읽기 어렵고 사용하기도 어려우며 수정하기도 어려운 코드로 표현할 수 밖에 없는 경우도 존재하나요? 이런 경우라도 더 쉽고 표현력이 좋은 코드로 구현할 수 있는 개선 방법이 있을까요? 
# 더 나은 프로그래머 되는 법 1~8장
## Ch01 코드에 신경 쓰기
**좋은 프로그래머 되기**  
좋은 프로그래머가 되기 위해서는 코드에 신경을 써야하고 시간과 노력이 필요하다.

좋은 프로그래머는 기술적 역량만이 아닌 언어의 기본을 이해하고 있어 함축적이고 인상적인 알고리즘을 구현할 수 있다. 하지만 가끔 읽거나 수정하기 어렵고 사용하기 어려운 코드를 만들기도 한다. 

상대적으로 변변찮아 보이는 프로그래머들은 간단한 코드만 쓰지만 코드가 훌륭하고 표현력이 넘쳐 같이 일하기 즐겁다.

평범한 프로그래머와 훌륭한 프로그래머를 나누는 가장 큰 차이는 '태도'이다. 제약과 압박 속에서 프로의 접근 방식을 취하고 최고의 코드를 작성하려는 태도로부터 시작된다.


**훌륭한 코드란?**  
1. 의도가 드러나는 코드
2. 유지보수가 가능한 코드
3. 정확한 코드


**코드 대하기**  
어떤 코드든 간에 코드를 만지면 이전보다 더 나은 구조, 테스트, 이해가 이루어져야 한다. 코드에 대해 프로그래밍에 대해 계속 주의를 기울이면서 지속적으로 새로운 언어나 문법, 기술을 익혀나가야 한다. 새로운 코드는 적절한 상황에 사용하도록 해야한다.

복잡한 문제를 풀기 위해 코드를 수정하는 과정을 즐기자.

코드에 대해서 안 좋은 코드를 볼 때는 혐오감을 훌륭한 코드에는 편안함을 느끼는 것은 잘못된 것이 아니다.


**생각해보기**  
1. 코드에 신경 쓰는가? 자신이 만든 결과물에서 그 점이 어떻게 드러나는가?
	코드에 신경을 쓰긴 하지만 아직 부족한 점이 많다고 생각되며 좋은 코드들에 대한 경험이 부족한 것도 있다. 어떻게 하면 더 나아질 수 있는지 이 책을 통해 학습하며 적용해보도록 해야겠다.
2. 프로그래머로서 더 나아지고 싶은가? 가장 노력해야 하는 부분은 어떤 부분인가?
	의사표현이 명확한 코드에 대해서 좀 부족한 것 같다. 변수명이나 함수명을 지을 때 이게 최선일까에 대한 고민이 많고 협업하기 좋은 팀원이 되고 싶다.
3. 코드에 신경 쓰지 않는다면, 왜 이 책을 읽고 있는가?
	더 좋은 코드를 만들기 위해서 스스로 개선의 여지가 많이 필요하다. 그렇기 때문에 이 책의 목적과 현재 내 요구사항이 들어맞는다고 생각된다.
4. 좋은 프로그래머가 나쁜 코드를 만들 수도 있는가? 어떻게 그럴 수 있는가?
	좋은 코드를 만들기 위해서는 결국 자신의 에너지를 써야하는 일이기 때문에 연습하는데에도 시간이 필요하고 체화되지 않는다면 컨디션에 따라 코드의 품질이 떨어질 수도 있다고 생각된다. 그렇기에 컨디션 관리와 책에서 말한 프로의 마인드 세팅이 좋은 코드를 만들기 위해서는 아주 중요한 밑바탕이라고 생각한다.

## Ch02 정돈된 코드 유지하기
**코드 레이아웃**  
고드윈 법칙에 의하면 인터넷에서 논쟁이 길어질 수록 나치나 히틀러에 비교할 확률이 100프로에 가까워진다고 한다. 마찬가지로 코드의 레이아웃에 대한 논쟁이 증가할수록 의미 없는 논쟁으로 빠질 확률이 100프로에 가까워진다.

좋은 프로그래머는 코드의 레이아웃에 대해 고민하고 이런 사소한 논쟁 또한 극복한다.

모든 레이아웃 스타일을 지키는 것이 아닌 사용하는 언어에 맞는 것을 골라 동료들과 일관성있게 사용해야 한다.

코드 레이아웃을 선택하고 평생 고수해야 하는 것은 아니다. 코드 레이아웃이 작업한 코드에 어떤 영향을 미쳤는지에 대해 피드백을 지속적으로 받는 것이 좋다. 그리고 이를 통해 자신만의 레이아웃 스타일을 발전시켜라.


**명확한 코드**  
좋은 코드는 명백하며 일관성이 있으며 레이아웃이 눈에 거의 들어오지 않는다. 초점을 흐리지 않고 코드의 의도만 보여준다. 이런 코드가 유지보수하기도 좋고 능률을 높인다.

두 명의 관객을 위해 코딩을 하라. 하나는 컴파일러를 위해 하나는 같이 일하는 동료를 위해.


**코드 작성법**  
글을 쓰듯 코드를 작성해야한다. 코드를 장, 문단, 문장 단위로 잘라 비슷한끼리 묶고 다른 것은 나누야 한다. 

클래스 정의 최상단에는 읽을 사람이 관심있어하는 것을 먼저 적는다. (public을 private보다 먼저 적는다)

짧은 코드로 작성하며 한 함수 안에 다섯 '문단'으로 작성하는 대신 잘 명명된 다섯 함수로 나누어라.
```cpp
class Example
{
public:
	Example();  //생명주기 관리 먼저 시행
	~Example();

	void doMostImportantThing();  //새로운 '문단' 시작
	void doSomethingRelated();  //여기서 각 '줄은' 문장과 같음

	void somethingDifferent();  //다른 새로운 '문단' 시작
	void aRelatedThing();

private:
	int privateStuffComesLast;
};
```

**명명**  
이름은 사물을 정체성을 의미하며 사물을 설명하고, 행위나 사용법을 나타낸다.

불필요하게 반복되는 단어를 피하라. 예를 들어 WidgetList 클래스에 numberOfWidegets 함수인 경우 Widget 이라는 단어가 반복되므로 이보다는 명확하게 표현 가능한 size 로 변경하는 것이 좋다.

간결함보다는 명확함이 우선이다.

관용어법을 지켜야 한다. 언어에서 쓰이는 대문자화 규약을 따르자.

명명을 정확하게 하여 자료형의 역할과 성격 파악에 혼돈을 주지말자.


**코드 가다듬기**  
코드를 정리 정돈해야 할 때는 기능 변경과 모양 변경을 동시에 진행하지 말자. 커밋할 때 모양과 기능 변경을 구분지어서 커밋하자.


**생각해보기**  
1. 회사의 코딩 표준에 맞추기 위하여 레이아웃을 바꿔야 하는가? 아니면 원작자의 스타일을 그냥 두는 것이 나은가? 그렇다면 이유는 무엇인가?
	아직 회사를 다니는 것은 아니지만 회사의 코딩 표준에 맞춰야 한다고 생각한다.
2. 코드를 리포매팅해주는 도구는 중요한가? 도구는 당신이 사용하는 언어에 얼마나 의존적인가?
	중요하다고 생각된다. 일부분 도구에 맞기고 코드에 좀 더 집중을 할 수 있게 해주는 역할을 한다고 생각한다.
3. 코드의 외관과 설계 중 어떤 것이 더 중요한가?
	코드의 외관이지 않을까 싶다. 안좋은 코드들로 설계된 프로그램이 서비스 중이라면 이를 유지보수 하는데 있어 굉장히 힘들 것이다. 하지만 설계가 온전하지 못하더라도 코드가 깔끔하다면 언젠가는 좋은 설계에 다다를 수 있다고 생각된다. 결국 훌륭한 코드가 밑바탕이 되어야 좋은 설계 및 유지보수를 할 수 있다고 생각한다.
4. 현재 프로젝트에서 코드의 일관성은 어떠한가? 어떻게 개선할 수 있는가?
	이전 프로젝트를 본다면 일관성이 지켜지지 않았다고 생각한다. 짧은 시간에 해결해야하는 것이 많았기 때문에 그렇지 못하였다고 생각했지만 지금보니 핑계로 보이며 오히려 좋은 코드를 작성하려고 노력해야 더 효율적으로 개발할 수 있었을 것 같다는 생각이 들었다.
5. 탭 vs 스페이스? 선택한 이유는? 이것은 중요한가?
	팀의 규칙에 따라 맞출 수 있지만 개인적으로는 탭을 선호한다. 이유는 스페이스보다 클릭 수도 적고 깔끔하기 때문이다. 이것을 맞추는 것은 중요하다고 생각한다. 결국 협업이기에 서로 불필요한 요소들을 최대한 적게 만드는 것이 능률을 높이는 일이라고 생각하기 때문이다.
6. 언어의 레이아웃과 명명 규칙을 따르는 것이 중요한가? 아니면 표준 라이브러리와 차별화 하여 '자신만의 스타일'을 사용하는 것이 유용한가?
	책에서 언급된 대로 언어의 레이아웃과 명명 규칙을 우선 따르는 것이 중요하고 피드백하여 자신만의 스타일을 발전해나갈 수 있다고 생각된다.
7. 화려한 구문 강조 코드 편집기를 사용하면 색상이 코드의 구조를 나타내준다는 이유로, 코드의 레이아웃에 대해 신경 쓰지 않아도 될까?
	같은 코드 편집기를 사용한다면 상관이 없지 않을까 생각했지만 코드를 코드 편집기에서만 보는 것이 아닌 깃허브에서도 확인하는 경우도 있기 때문에 일관성 유지를 위하여 레이아웃을 신경써야 한다고 생각한다.
## Ch03 코드 적게 쓰기
**코드 줄이기**  
많은 양의 코드 작성이 곧 다량의 소프트웨어 개발을 의미하지는 않는다. 코드를 제거함으로써 소프트웨어를 개선하도록해야 한다.

코드는 버그를 품고 있기 때문에 코드가 많을수록 버그가 숨을 수 있는 공간이 많아진다. 중복 코드에 대한 버그 하나를 해결함과 동시에 다른 여러 버그들을 만들어 낼 수도 있어 중복 코드는 굉장히 조심해야한다.

리팩토링은 결과의 변경 없이 기존의 코드의 구조를 재조정하는 것이다. 코드 가독성을 높이고 내부 구조를 향상시키며 유지 보수를 원활하게 하며 나중에 있을 기능 향상에 대비한다.

책임감을 갖고 불필요한 코드를 쓰지말고 즉시 제거하며 스스로 정리하자.


**주석**  
모든 주석이 코드에 가치를 더하지는 않는다.

주석을 달아야 할 만큼 복잡한 알고리즘이란 거의 존재하지 않는다. 일부 알고리즘은 주석이 필요하기도 하다. 이 차이점은 무엇일까?


**생각해보기**  
1. 간결한 논리적 표현을 사용하는가? 간결한 표현이 너무 간결하여 이해하기 어렵지는 않은가?
	간결한 논리적 표현을 사용한다. 오히려 간결할 수록 이해하기 쉽다고 생각한다.
2. C 언어 패밀리의 삼항 연산자, 예를 들면 '조건? 참: 거짓'과 같은 표현은 읽기 쉽게 만드는가? 아니면 어렵게 만드는가? 그 이유는 무엇인가?
	읽기 쉽게 만든다. 왜냐하면 if 문을 사용할 때보다 한눈에 들어오기 때문이다. 하지만 처음 사용하는 사람들에게는 적응시간이 필요할 것 같다.
3. 잘라내기&붙여넣기 코딩은 피해야 한다. 공통 함수로 코드 일부를 나눌 때의 기준을 어느정도로 하는 것이 적당한가?
	중복되는 경우가 발생하거나 의미있는 단위로 묶일 수 있을 때 코드를 나누는 것이 필요하다고 생각된다.
4. 죽은 코드를 어떻게 발견하고 제거할 수 있는가?
	IDE를 이용하여 죽은 코드를 발견하고 제거할 수 있다.
5. 몇몇 코딩 표준은 모든 함수를 특별히 정형화된 주석으로 문서화하도록 한다. 이것은 유용한가? 아니면 불필요한 여분 주석으로 짐이 될까?
	유용하다고 생각한다. 정형화 되었기 때문에 함수를 빠르게 이해할 수 있고 주의해야할 점도 금방 파악할 수 있다고 생각한다.
## Ch04 코드 줄여 개선하기
**제멋대로 코드 작성하지 않기**  
불필요한 코드가 만들어지는 이유는 프로그래머가 자신의 개인적 취향만으로 제멋대로 코드를 작성했기 때문이다.

YAGNI란 'You Aren't Gonna Need It'의 약자로, 불필요한 코드를 작성하지 않도록 주의하자는 의미이다. 이는 해당 코드가 언젠가 필요할 것으로 보이는 경우도 마찬가지이다. 당장 필요하지 않으면 작성하면 안된다. 


**죽은 코드 제거하기**  
죽은 코드를 제거하는 일은 해로운 것이 아니다. 

죽은 코드를 제거하는 작업과 기능 추가 작업을 병행하지 말자.


**생각해보기**  
1. 프로그램에서 작동하지 않는 '죽은 코드'를 어떻게 식별할 수 있는가?
	IDE를 사용하여 식별할 수 있다.
2. 현재 일시적으로 필요하지 않은(그러나 미래에는 필요할지도 모르는) 코드를 제거할 때, 소스 트리에 주석 처리하여 눈에 띄게 남겨두는가? 아니면 완전히 삭제하는가? 이유는 무엇인가?
	주석을 처리하여 남겨두었던 것 같다. 그러나 책을 읽어보니 애초에 그런 현재에 필요하지 않은 코드를 작성할 필요가 없었구나 라는 점을 알게 되었다. 또한 버전 관리를 통해 관리가 되므로 미리 작성을 했더라도 지우는 것이 좋다고 생각된다.
3. 사용하지 않는 레거시 기능을 제거하는 것은 항상 적절한가? 코드 일부를 제거할 때 내재된 위험이 있는가? 불필요한 기능을 제거하는 적절한 시점을 어떻게 결정할 수 있는가?
	다른 개발 작업과 대청소 기능을 분리해 버전 히스토리를 깨끗하게 하는 것이 중요하다고 생각한다. 코드 일부를 제거하고 이를 알아차리지 못한 상태에서 팀원이 해당 코드를 사용하려는 경우 문제가 발생할 수 있다고 본다. 그렇기에 대청소를 주기적으로 하며 팀원들은 해당 대청소에 어떤 점이 정리되었는가를 확인하는 것이 중요하다고 생각된다.
4. 현재 프로젝트의 코드베이스에서 불필요한 부분이 얼마나 되는가? 당신의 팀은 유용하다고 여겨지거나 마음에 드는 기능을 제멋대로 추가하는 문화를 가지고 있는가?
	이전에 같은 팀을 했던 팀원의 경우 아주 잘 관리를 했다고 생각한다. 오히려 내 경우가 앞에 필요할 기능에 대한 코드 구현을 해놓고 해당 기능이 필요가 없어졌을 때 코드 정리를 하지 못한 경우가 있었다. 다음부터는 이런 상황이 온다면 빠르게 정리하고 코드를 작성하는 환경을 더 깔끔하게 해놓는 것이 좋다고 생각한다.
	
## Ch05 코드베이스의 망령
**코드 돌아보기**  
오래된 코드를 다시 들여다보는 것은 새로운 경험이다. 더 이상 적절하지 않다고 느껴지는 예전의 코드를 찾아냄으로써 많이 배웠고 나아졌음을 느낄 수 있다.

기존의 코드를 돌아보면서 코드를 리뷰하는 것은 가치있는 행동이다.

특정 종류의 버그에 지독하게 당해본 뒤 예전의 코드로 되돌아가면, 해당 코드에 숨어 있는 잠재적인 버그를 자연스럽게 발견할 수 있다. 이것이 프로그래머의 육감이다.

**생각해보기**  
1. 예전의 코드가 지금은 어떻게 보이는가? 그다지 나빠 보이지 않는다면, 최근에 새로운 뭔가를 배우지 않았음을 뜻하는 것인가?
	이전의 코드를 보니 줄간격이라던지 이런 것들이 명백하지 않다고 느낀다. 이런 사소한 부분들을 지키지 않는 경우가 많았구나 느낀다. 
2. 주요 언어로 얼마나 오랫동안 일했는가? 그 사이 언어 표준이나 내장 라이브러리가 얼마나 많이 바뀌었는가? 당신이 코드를 작성하는 스타일을 형성할 때 어떤 언어 기능에 영향을 받았는가?
	C#을 사용하면서 그렇게 많이 바뀌었다고 생각하지 않았다. 아마도 새로운 뭔가가 나왔을 때 바로 학습을 하는 습관이 없어서 그런 것 같다고 생각한다.
3. 무의식적으로 사용하는 일반적인 관례의 일부에 대해 생각해보자. 이들이 오류가 발생하지 않도록 하는 데 무엇이 도움이 되는가?
	관례들이 지금은 생각이 나지 않는 것 같다..

## Ch06 경로 탐색하기
**이미 거대한 코드베이스를 파악하는 방법**  
+ 코드의 어느 부분부터 보아야 하는지 파악하기
+ 코드의 부분별 기능을 알아내고, 그 기능을 어떻게 수행하는지 살펴보기
+ 코드의 품질을 가늠하기
+ 시스템 내부를 어떻게 탐색할 것인지 계획하기
+ 코딩 관례를 이해하고, 본인의 수정 사항이 그것과 어울리도록 만들기
+ 특정 기능이 있을 법한 위치를 파악하고, 그 기능에 의해 발생하는 버그 찾아보기
+ 코드와 함께 그것의 중요한 부속 부분들인 테스트 코드 및 문서 등의 관계를 이해하기


**주변인들에게 도움받기**  
코드를 파악하기 가장 좋은 방법은 이미 코드를 파악하고 있는 사람의 도움을 얻는 것이다. 도움을 요청할 때는 항상 공손해야 하며 감사해야 한다. 합리적이고 적절한 질문을 하자.


**코드 속 단서 찾기**  
도와주는 사람이 없다면 아래와 같이 단서들을 찾아 소프트웨어의 깊은 부분을 파악할 수 있다.

소스 획득이 용이하면 좋다. 건전한 프로젝트에서는 전체 코드베이스를 얻기 위해 코드를 한 번만 체크아웃해도 된다.

코드를 빌드하기 어렵다면 해당 코드를 이용해 일하기도 어렵다. 

좋은 테스트를 포함하는 코드는 일반적으로 적절하게 분류되고, 심사숙고되며, 제대로 설계된다.

디렉터리 구조가 코드의 형태와 어울리는지, 여러 계층을 명확히 보여주는지 확인해보자.

프로젝트 문서가 최신정보를 잘 반영하고 있는지가 중요하다.

코드 간의 관계를 확인하기 이해 도구를 사용하자.(Doxygen으로 클래스 다이어그램과 제어 흐름 다이어그램을 얻을 수 있다.)

최초의 프로젝트 요구 사항 문서나 기능 명세서를 살펴보자.

코드에서 특정 프레임워크와 서드파티 라이브러리를 사용하는가? 시스템에서 제공하는 핵심 코드는 한결 견고하고, 잘 테스트 되었으며, 버그가 없을 가능성이 크다.

주요 계층들을 구분할 수 있는지 그 계층들이 간결하게 나뉘어져 있는지, 데이터베이스 계층이 있는지, 스키마를 확인할 수 있는지를 확인해보자.


**실행을 통해 배우기**  
자전거 타는 방법에 대한 책을 많이 읽을 수 있으나 실제로 페달에 발을 올리고 자전거를 타보기 전까지는 실력이 향상되지 않는다. 자전거를 직접타며 직접 넘어지는 과정을 통해 성장할 수 있다. 코드 또한 마찬가지이다. 많은 실수를 통해 코드베이스에 대해 알 수 있다. 나태함에 발이 묶여서 앞으로 나아가지 못하면 안 된다.

코드를 다루지 못하는 심리적 장벽을 머릿속에 세워서는 안 된다. 넘어서고, 뛰어들고, 과감하게 코드를 수정해야한다.

간단하고 사소한 일부터 시작하면 된다. 이는 바로 확인해볼 수 있으며 코드와 관련이 있는 작은 버그를 찾아내는 일이다.

Lint, Fortify, Cppcheck, FxCop, ReSharper 같은 코드 검증 도구들로 코드베이스를 확인해보자. 이를 통해 코드 구조를 확인하고 코드 품질에 대한 단서를 얻을 수 있으며 빠르게 코드에 다가갈 수 있다.

코드의 작은 부분부터 확인하라. 그것을 비평하라. 취약한 부분이 있는지 확인하라. 가차 없이 리팩터링하라. 변수명을 적절하게 변경하라. 들쭉날쭉 작성된 코드 부분을 더 작고 어울리는 이름의 함수들로 바꾸어라.

신중해져야 한다. 코드를 작성하는 것이 읽는 것보다 쉽다. 수많은 불필요한 코드 변동, 시간 낭비, 새로운 버그를 초래할 수 있어 확인하고 행동하자.

사용자 인터페이스를 변경하여 더 사용하기 즐겁게 만들고 소스 파일을 정리하고 디렉터리 구조를 적절하게 변경하라.

코드에 최상위 수준의 README 파일이 있는지 확인하고 그것이 어떻게 작업을 시작하는지 알려주지 않는다면 하나만 만들어보고 지금까지 알아낸 것들을 기록해보자. 그 후에 경험 많은 프로그래머에게 REAMDE 문서 리뷰를 요청해보도록 하자.

경험이 쌓일수록 고통이 줄어들고 이득은 커진다. 코딩도 마찬가지이다. 새로운 코드베이스에서 더 많이 작업해볼수록, 새로운 코드를 더 효과적으로 이해할 수 있다.

**생각해보기**  
1. 새로운 코드베이스에 자주 들어가보았는가? 익숙하지 않은 코드로 작업하기 수월했는가? 프로젝트 탐색에 사용하는 일반적 도구가 있는가? 이 무기고에 어떤 도구를 넣을 수 있겠는가?
	새로운 코드베이스를 들어가본 경험이 많지 않다. 42서울에서도 내가 직접 짠 코드들로 작업을 했었다. 코드베이스를 탐색을 할 기회가 있을 때 책에 소개 되었던 탐색 도구들을 한 번 사용해봐야겠다.
2. 아직 완전히 이해하지 못한 시스템에 새 코드를 추가할 때 사용할 수 있는 몇 가지 전략을 기술하라. 기존 코드를 (그리고 자신도) 보호하기 위해 사용하는 방어책으로는 어떤 것이 있는가?
	일단 작은 단위로 수정을 하며 실행해봐야 한다고 생각된다. 기존 코드를 보호하기 위해서는 무엇보다 버전 관리에 유의하는 것이 좋다고 생각되며 코드 리뷰를 요청하는 방식이 좋을 것 같다.
3. 새 직원이 코드를 더 쉽게 이해할 수 있도록 하려면 어떻게 해야 하는가? 현재 프로젝트의 상황을 더 향상시키려면 지금 무엇을 해야 하는가?
	새 직원이 코드를 더 쉽게 이해할 수 있도록 하기 위해서는 전체적인 시스템을 이해할 수 있도록 문서화를 잘 해야한다고 생각한다. 그리고 현재 프로젝트 상황을 향상 시키기 위해서는 간단하고 사소한 버그부터 찾아내어 고치도록 해야하지 않을까 생각한다.
4. 이후의 코드 작업 기간에 따라 기존 코드를 알아가는 노력이나 태도가 달라지겠는가? 더 이상 유지 보수할 필요가 없으며 이후 다른 사람들이 작업해야 하는 코드에 대해, '빠르고 더럽게' 수정 작업을 수행하는가? 이는 적절한가?
	코드 작업 기간에 따라 기존 코드를 알아가는 노력이나 태도가 달라지는 것은 옳지 않다고 생각된다. 책의 앞부분에도 나왔듯이 프로의 마인드를 갖고 임해야한다고 생각하며 지속적인 노력과 경험이 결국 좋은 태도에 가깝도록 만든다고 생각한다. 유지 보수할 필요가 없다고 하더라도 태도를 지키는 것이 중요하다. 이유는 노력해서 얻은 태도이기 때문에 빠르고 더럽게 코드를 작성하면서 태도를 망가트릴 필요는 없다고 생각한다.
## Ch07 똥통에서 뒹굴기
**똥통 코드 다루기**  
코드 수정은 천천히, 신중하게 하며 한 번에 하나씩 수정하자. 기능을 변경하면서 레이아웃을 바꾸지 말자. 꼭 필요한 경우 레이아웃을 변경하자.

시간을 지혜롭게 사용해야 한다. 코드를 별로라고 생각할 수도 있지만 별다른 수정 없이도 몇 년 동안 적절히 작동했다면, 지금 수정하는 것은 적절하지 않을 수 있다.

수정으로 인해 기존 기능에 문제가 생기지 않음을 보장할 수 있는 모든 수단을 사용하자. 신뢰할 만한 자동화도구를 사용하라. 그런 도구를 사용할 수 없다면 변경 사항들에 대해 충분히 세심하게 검토하고 검증해야 하며 다른 사람의 도움도 요청하자.

코드 변경을 잘할 수 있다는 용기를 가지자. 버전을 관리할 수 있는 안전망이 마련되어 있다. 코드를 변경할 기회를 즐기고 더 나은 품질을 실현하자. 수정하면서 자신의 태도를 확인하자. 원 저자보다 더 알고 있다고 생각할 수도 있지만 그렇지 않은 경우도 존재한다.


**생각해보기**  
1. 어째서 코드는 자주 똥 덩어리가 되는 것일까?
	아무래도 너무 바쁘거나 촉박하다면 사람의 심리 상 태도가 무너지게 되는 것이 아닐까 생각한다.
2. 어떻게 하면 작업을 시작하는 단계부터 이런 일을 방지할 수 있을까? 가능하기는 한가?
	사람들의 우선순위를 명확히 하고 일을 처리할 수 있는 근무환경을 적절하게 만들어야 하지 않을까 싶다. 그렇게 하더라도 언젠가 문제가 발생할 수 있으며 다시 경각심을 갖고 고쳐나가도록 해야한다.
3. 코드 레이아웃 변경과 코드 기능 변경을 분리하는 것의 장점은 무엇인가?
	버전 관리에 유용하다. 그리고 명확하게 수정을 할 수 있다.
4. 보기 싫은 코드에 얼마나 자주 맞닥뜨렸는가? 정말 그 코드가 심각했던 경우가 잦았는가? 아니면 그저 입맛에 안 맞았던 것은 아닌가?
	사실 보기 싫다고 여겨졌던 경우는 그렇게 많지 않았다. 내 눈이 좋은 코드와 안 좋은 코드에 대한 분별이 그렇게 명확하지 않았던 것도 있지만 좋은 팀원이나 사람들을 만나서 코드를 보고 많이 심각하다고 느낀 적이 많지 않았다. 오히려 스스로가 명확한 코드를 짜지 못했던 경우가 많이 있다고 생각되어 반성하게 되었다.

## Ch08 오류 무시하지 않기
**오류 다루기**  
코드에서 발생할 수 있는 모든 오류를 무시하지 말라. '더 늦기 전에' 오류 처리를 미루지 말라. 자꾸 미루다 보면 처리하기가 더 어려워진다.

반환 코드는 보편적인 오류 검출 방법이다. 0이 성공, 0이 아닌 것은 오류를 나타낸다. 혹은 함수의 실행 여부와 그에 따른 반환 값을 하나의 형에 집어넣는 'optional'형으로 반환하여 (C++의 boost\:\:optional 이나 C#의 Nullable\<T> 등) 표현력이 좋은 코드를 작성할 수 있다.

규칙에 맞춰서 예외를 잘 사용하자. 언어의 표현과 요구사항을 이해하는 것이 예외를 효과적으로 사용하는 방법이다.

오류를 무시하지 말라.


**생각해보기**  
1. 코드가 로우 레벨에 의해 보고된 오류를 무시하지 않았음을 어떻게 확실할 수 있는가? 코드 수준에서의 해결방법과 프로세스 수준에서의 기법에 대해 생각해보라.
	예외 처리를 명확히 하거나 항상 반환값을 확인해야 한다. 프로세스 수준에서의 기법은.. 잘모르겠다.
2. 예외는 반환 코드처럼 쉽게 무시할 수 없다. 예외가 오류를 보고하기에 더 안전한 방법이라는 것이 이유가 될 수 있는가?
	그렇다고 생각한다. 오류를 더 무시할 수 없게 보고하기 때문이다. 하지만 책에서 나왔듯이 catch (...) {} 방식으로 사용하면 오류를 무시할 수도 있기 때문에 명확하게 사용할 필요가 있다고 생각한다.
3. 오류와 예외가 섞인 코드를 다룰 때 어떠한 접근 방법이 요구되는가?
	명확한 경계를 설정할 필요가 있다고 생각한다.
4. 적절하지 못한 오류 처리로 실패하는 코드를 식별하는 데 어떤 테스트 기법이 도움되는가?
	예외 기반 테스트, Fault Injection 테스트, 경계값 분석 테스트와 같은 것들을 시도해보면 좋을 것 같다.