## 04장 웹 프레젠테이션

웹 브라우저 기반 UI는 클라이언트 소프트웨어를 설치할 필요가 없고, 공통 UI를 제공하며, 사용하기 쉬운 범용 접근을 제공하는 등 장점이 많다. 다양한 환경에서 웹 앱을 구축할 수 있는 것도 장점이다.

웹 앱은 서버 소프트웨어를 구성하는 것부터 시작한다. 웹 서버의 역할은 요청을 받으면 URL을 해석하고 웹 서버 프로그램으로 제어권을 넘겨주는 것이다. 웹 서버 프로그램 구성은 스크립트와 서버 페이지라는 두 가지 주요 형식이 있다.

스크립트는 HTTP 호출을 처리하는 함수나 메서들드를 포함하는 프로그램으로 CGI 스크립트와 자바 서블릿을 예로 들 수 있다. 펄(Perl)은 이 기능에 기반을 두는 CGI 스크립트로 큰 인기를 얻었다. 자바 서블릿은 프로그래머 대신 이런 구문 분석을 수행하고 키워드 인터페이스를 통해 요청 정보에 접근할 수 있다. 웹 서버의 출력은 응답(response)이라는 문자열이고 스크립트가 일반 출력 스트림 작업을 통해 출력할 수 있다.

스트림으로 HTML 응답을 작성하는 일이 불편한 작업이고 HTML 페이지 작성에만 익숙한 웹 개발자는 불가능한 작업이다. 그래서 반환되는 텍스트 페이지와 함께 프로그램 코드를 구성하는 서버 페이지(server page)라는 아이디어가 나왔다. 반환하는 페이지는 HTML로 작성하고 특정 시점에 HTML 스크립트릿(scriptlet)으로 삽입해서 코드를 실행한다. PHP, ASP, JSP가 유명하다.

스크립트는 요청을 해석하고, 서버 페이지는 응답을 포맷팅하는데 썼으므로 이런 방식이 자연스럽게 받아들여졌다. 이런 분리 방법은 `모델 뷰 컨트롤러` 패턴으로 처음 모습을 드러낸 오래된 아이디어다.

`모델 뷰 컨트롤러`(그림 4.1)는 잘못 이해하는 경우가 많다. 이런 혼동의 원인으로 "컨트롤러" 라는 용어에서 유발됐다. 문맥에 맞는 용어로 하자면 입력 컨트롤러(input controller)가 적절하다.

`모델 뷰 컨트롤러`를 적용하는 첫 번째 이유이자 가장 중요한 이유는 모델을 웹 프레젠테이션으로부터 완전히 분리하기 위해서이다. 그러면 프레젠테이션 수정 및 다른 프레젠테이션 추가가 쉽다. 별도의 트랜잭션 스크립트나 도메인 모델 객체에서 수행한다면 테스트도 수월하다. 서버 페이지를 뷰로 사용하는 경우에는 별도의 객체에서 수행하는 것이 특히 중요하다.

![image](https://github.com/jongfeel/BookReview/assets/17442457/2d703569-5aae-4ab6-a603-61901fae6b91)

두 번째 의미의 컨트롤러는 여러 사용자 인터페이스 설계에서 프레젠테이션 객체를 도메인 객체로부터 분리하기 위해 `애플리케이션 컨트롤러` 객체라는 중간 객체를 사용한다. `애플리케이션 컨트롤러`는 애플리케이션의 흐름을 처리하고 어떤 화면을 어떤 순서로 표시할지 결정하는 역할을 한다. 프레젠테이션과 독립적으로 만들 수 있으며, 그러면 프레젠테이션 간에 재사용이 가능하다.

모든 시스템에 애플리케이션 컨트롤러가 필요하진 않다. 이는 시스템에 화면 순서와 화면 간 이동과 관련된 논리가 많은 경우에 유용하며, 페이지와 도메인 작업 간에 간단한 매핑이 없는 경우에도 유용하다. 화면을 순서에 관계 없이 볼 수 있다면 필요하지 않을 수 있다. 화면 흐름을 컴퓨터가 제어한다면 `애플리케이션 컨트롤러`가 필요하고 사용자가 제어한다면 필요하지 않다.

### 뷰 패턴

뷰는 `변환 뷰`, `템플릿 뷰`, `2단계 뷰`라는 세 가지 패턴을 고려해야 한다.

템플릿 뷰를 사용하면 페이지의 구조 안에 프레젠테이션을 작성하고 페이지에 표식을 삽입해 동적 컨텐츠를 넣을 위치를 지정할 수 있다. 페이지에서 완전한 프로그래밍 언어를 사용할 수 잇게 해주는 서버 페이지 기술(ASP, JSP, PHP)이 이 패턴에 기반을 둔다. 강력하고 유연하지만, 관리하기 어려운 복잡한 코드로 이어질 가능성이 높다. 서버 페이지 기술을 사용하는 경우 페이지 구조에서 프로그래밍 논리를 철저하게 배제하도록 노력해야 한다.

변환 뷰는 변환 스타일의 프로그램을 사용한다. XSLT가 그 예이다. 이 패턴은 사용할 도메인 데이터가 XML 형식일 때 아주 효과적이다.

절차형 스크립트를 뷰로 사용하는 경우 변환 뷰나 템플릿 뷰 중 하나를 선택하거나 둘을 혼합한 스타일로 코드를 작성할 수 있다.

그 다음은 1단계 뷰(그림 4.2)와 2단계 뷰 중 어떤 것을 사용할지 결정해야 한다. 1단계 뷰는 애플리케이션 화면 당 뷰 컴포넌트 하나를 사용한다. 서로 비슷한 화면이 뷰를 공유하는 경우는 있지만 이 경우에도 화면당 뷰 하나가 사용된다고 간주한다.

2단계 뷰(그림 4.3)는 이 과정을 도메인 데이터로부터 논리적 화면을 생성한 다음에 이를 HTML로 렌더링 하는 두 단계로 나눈다. 첫째 단계 뷰는 각 화면마다 하나씩이고 두 번째 단계 뷰는 전체 애플리케이션에 하나만 있다.

2단계 뷰의 장점은 THML에 대한 결정을 한 곳에 모을 수 있다는 것이다. 한 객체만 변경하면 사이트의 모든 화면을 변경할 수 있으므로 HTML 전체를 쉽게 변경할 수 있다. 이렇게 하려면 논리적 프레젠테이션이 동일하게 유지돼야 하므로 여러 홤녀이 동일한 기본 레이아웃을 사용하는 사이트에 가장 적합하다.

**Figure 4.2. A Single-stage view.**
![image](https://github.com/jongfeel/BookReview/assets/17442457/4b273b0c-19a6-4c15-865e-8cb232ed2f31)

![image](https://github.com/jongfeel/BookReview/assets/17442457/edf9d30f-0b3f-4274-a282-633ae9a23c43)

### 입력 컨트롤러 패턴

일반적인 패턴은 웹 사이트의 모든 페이지마다 입력 컨트롤러 객체를 만드는 것이다. `페이지 컨트롤러`가 뷰와 입력 컨트롤러의 역할을 결합한 서버 페이지 하나가 예이다. 페이지 컨트롤러와 뷰 간에 1:1 관계가 성립하지 않은 경우도 있는데, 정확한 관점은 버튼이나 링크와 같은 작업당 페이지 컨트롤러 하나가 연결된다고 보는 것이다. 대부분 동작은 페이지와 연결되지만 조건에 따라 다른 페이지로 연결되는 링크와 같이 1:1 관계가 아닌 경우도 있다.

입력 컨트롤러는 HTTP 요청을 처리하고 수행할 작업을 결정하는 두 역할을 하므로 두 역할을 분리하는 것이 더 적절할 수 있다. 서버 페이지는 요청 처리 및 도우미 객체에 수행할 작업을 결정하도록 위임할 수 있다. `프런트 컨트롤러`는 이 분리를 한 단계 더 발전시켜서 한 객체가 모든 요청을 처리하게 한다. 이는 URL을 해석해서 요청의 유형을 파악한 후 이를 처리할 별도의 객체를 생성한다. 이 방법을 통해 HTTP 처리를 단일 객체로 집중 간으하며 사이트 작업 구조를 변경할 때마다 웹 서버를 다시 구성할 필요가 없게 된다.

### 참고 자료

[Brown et al.]의 9장은 자바 웹 설계에 대한 훌륭한 내용을 담고 있다.
[Alur et al.]은 추가적인 패턴에 대한 좋은 참고자료이며 자바 외의 환경에서도 활용 가능하다.
[Knight and Dai]에서 입력 컨트롤러와 애플리케이션 컨트롤러의 용어를 구분하는 아이디어를 얻었다.