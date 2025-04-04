논의내용
- 유비쿼터스 언어에 대한 중요성을 어느정도 생각하고 있으신가요?
- 도메인주도 설계 방식으로 개발한 사례가 있으신가요?

# 1장 도메인 주도 설계란 무엇인가?

도메인 주도 설계, 생소하다. 사전적 정의를 찾아보자

첫번째:도메인(domain)이란 단어는 영토, 분야, 영역, 범위를 뜻하는 단어(예를 들어 소유지, 토지 소유권(법률) 등)였으나, 인터넷 주소의 의미로 확장되었다.  
두번째: 어떤 전문 분야에 대해 얘기할 때 해당 도메인에 대한 지식이 필요하다와 같이 말하기도 한다.  
이 책에서 이야기하고자 도메인은 두번째다.  

우리 개발자는 코드작업 자체를 단순한 오브젝트와 메서드 관점에서 보는 시각이 있다.  
왜 개발을 해야 하는지 본질을 알지 못한다. 아니 알려고 하지 않는다.  
소프트웨어란 도메인으로부터 시작되고 떼려야 뗄 수 없는 관계를 가지고 있음을 바드시 이해해야 한다.

자동차생산에 대해 비유적으로 설명한 것이 있는데 자동차가 수많은 부품에 의해 만들어지는 과정 단순 조립품으로 볼 수도 있지만
그것은 자동차 이지 좋은 자동차는 아니다.

좋은 자동차는 비전으로 부터 출발하고 명세서로 기술,설계로 이어지며 계속해서 수정 보완을 거치며 문서상에서만 기술되지 않는 테스트, 검증 등의 과정을 거쳐 만들어지는 것이다.

소프트웨어 개발도 이와 유사하다.  
도메인에 대한 깊은 지식 없이 복잡한 소프트웨어를 만드는 것은 불가능하다.

복잡한 은행 소프트웨어를 만드는데 해당분야의 도메인지식이 있어야 만들 수 있다.  소프트웨어를 만들 때 소프트웨어가 어떤 도메인에 의해 동작하는지 집중해야 한다.  우리는 해당분야의 도메인 지식이 없을 수 있다. 이럴땐 해당분야의 도메인지식이 있는 전문가와 많은 이야기를 나누면서 도메인에 대해 많은 것을 배워야 한다. 이 과정에서 가공되지 않은 수많은 데이터들에 대해 들을 수 있다. 각자가 보는 청사진이 다르기에 초기엔 불완전 할 수 있다. 그러나 계속 이 과정을 반복하다 보면 점점더 명확해진다. 이러한 추상화 과정은 머릿속에만 있는 것이 아니라 같이 청사진을 그릴 필요가 있다. 이때 다이어그램으로 모델을 그리며 서로가 생각하는 부분에 대해 이야기 하는 것이다.

모델은 소프트웨어 개발에 필수적이다. 복잡한 개발을 하려면 모델은 필수적이다.
우리는 모델을 사용해서 도메인 전문가, 설계자와 개발자 들과 소통해야 한다.
우리는 혼자 일하는게 아니므로 정보공유가 필수적인데 서로간에 모호함 없이 정확한 지식정보를 공유해야 한다.
여러가지 방법이 있는데 다이어그램, 유스케이스, 그림, 사진 같은 시각적방법이 있다.  
다른방법은 글로 적는것이다.   

이 모든 행위는 우리가 개발을 함에 있어 모델로 의사소통을 해야할 필요가 있다는 것이다.

소프트웨어 개발 방법론은 여러가지가 있는데 폭포수설계방법론, 에자일방법론 등이 있다.
각각의 방법론은 장단점이 있는데 폭포수모델은 처음부터 완벽하게 일을 하려고 하기 때문에 분석마비 라는 현상이 있을 수 있고
또 애자일은 빠르게 피드백을 반영하여 개발하는 장점이 있지만 견고하게 설계하지 않고 잦은 리팩토링을 수행하여 개발한다면 스파게티코드를 양산할 우려가 있다.

이 모든 방법론은 우리가 양질의 소프트웨어를 만들기 위해 존재한다.
양질의 소프트웨어는 도메인 주도 설계 원칙아래 이루어 질 수 있다.

## 도메인 지식 쌓기
우리는 모든분야의 도메인 전문가가 아니다.  
해당 분야의 도메인 전문가로 부터 지식을 쌓는것이 중요하다.  
처음에는 추상적이고 모호했던 지식들이 도메인전문가와 토론을 통해 피드백을 듣고 다이어그램을 그리며 글로 적으며
점차 개발하고자 하는 방향으로 도달한다.