## CHAPTER 9 기초

```
논의내용)
분산 컴퓨팅의 오류 8가지는 흥미롭게 봤는데 왜냐하면 조금 당연한 이야기인것 같은데 호들갑 떠는 게 아닌가(?) 하는 생각이 들었습니다. 그나마 오류 8 네트워크는 균일하다 부분만 조금 오해를 할 여지가 있는데, 패킷이 유실되는 경우가 그렇게 많을까? 라는 생각이 들긴 했습니다.
다른 분들은 어떤 오해를 오해가 아닌 것으로 생각하고 계셨는지 얘기해 보면 좋을 것 같습니다.
```

아키텍처 스타일은 아키텍처 패턴이라고도 부르며, 다양한 아키텍처 특성을 다루는 컴포넌트의 명명된 관계named relationship를 기술한다.

### 9.1 기초 패턴

레이어는 기능에 따라 서로 다른 관심사를 분리하는 개념으로, 소프트웨어 자체만큼이나 오래됐다.

#### 9.1.1 진흙잡탕

진흙잡탕Big Ball of Mud은 브라이언 푸트Brian Foote와 조지프 요더Joseph Yoder가 1997년 발표한 논문에 처음 사용한 안티패턴의 이름에서 유래한다.

> 아키텍처 마인드를 조금이라도 갖고 있는 프로그래머라면 고생길을 자처할 이유가 없다.
실패한 둑의 구멍을 메우는 일상적인 허드렛일을 하면서 관성에 빠진 사람들만이 그럭저럭 만족하며 일하고 있을 것이다.

```
의견)
더 나아지려는 고민을 안하고 공부를 안하는 개발자는 하던 것만 하려고 하고 도태되는 개발자가 될 것이라 생각한다. 1997년에 논문에 적힌 내용은 2023년에도 여전히 유효할 것이며 앞으로도 그럴 것이다.
```

진흙잡탕은 데이터베이스를 직접 호출하는 이벤트 핸들러를 가진 단순한 스크립팅 애플리케이션을 가리킨다. 점점 규모가 커지면 처치 곤란한 상태가 된다.

일부러 진흙잡탕을 만드는 아키텍트는 없겠지만, 많은 프로젝트가 코드 품질 및 구조에 관한 거버넌스가 결여된 탓에 본의 아니게 그렇게 된다.

#### 9.1.2 유니터리 아키텍처

유니터리unitary(단일, 통일) 시스템은 임베디드 시스템과 그 밖에 매우 제약이 많은 극소수 환경을 제외하면 거의 쓰이지 않는다. 소프트웨어 시스템은 시간이 지날수록 점점 기능이 늘어나므로 성능, 확장 등의 운영 아키텍처 특성을 유지하려면 관심사를 분리해야 한다.

#### 9.1.3 클라이언트/서버

프런트엔드와 백엔드로 기술적으로 기능을 분리한 2티어 또는 클라이언트/서버 아키텍처는 대표적인 기본 아키텍처 스타일이다.

**데스크톱 + 데이터베이스 서버**

초창기 PC 아키텍처는 윈도우 UI를 기반으로 한 리치 데스크톱 애플리케이션을 개발하였고, 데이터는 별도의 데이터베이스 서버로 분리했다.
이 아키텍처는 스탠드얼론 데이터베이스 서버와 잘 맞아서 프레젠테이션 로직은 데스크톱에 두고 계산량이 많은 액션은 사양이 탄탄한 데이터베이스 서버에서 실행한다.

**브라우저 + 웹 서버**

웹 브라우저가 웹 서버에 접속하는 형태로 분리하는 것이 일반화 되었다. 데이터베이스는 웹 서버와 분리되어 있지만 두 서버 모두 운영 센터 내부의 동급 머신에서 운용되고 유저 인터페이스는 브라우저에서 실행되므로 여전히 이 구조를 2티어 아키텍처로 바라보는 아키텍트도 있다.

**3티어**

고성능 데이터베이스 서버를 사용하는 데이터베이스 티어
애플리케이션 서버가 관리하는 애플리케이션 티어
온갖 자바스크립트 코드로 가득 찬 프런트엔드 티어

분산 아키텍처에 적합한 공통 객체 요청 브로커 아키텍처COmmon Object Request Broker Architecture(CORBA),
분산 컴포넌트 객체 모델Distributed COmponent Object Model(DCOM) 같은 네트워크 수준의 프로토콜과 잘 맞았다.
오늘날에 메시지 큐 같은 도구 또는 이벤트 기반 아키텍처 등의 아키텍처 패턴에 존재한다.

**3티어, 언어 설계, 그리고 장기적인 전망**

3티어 컴퓨팅이 대세였고 자바에는 직렬화를 지원하는 정해진 인터페이스를 구현하도록 했다.
소프트웨어는 설계 결정의 영향을 장기적으로 내다보는 건 항상 어려운 일이다.
단순하게 설계하라는 조언 역시 미래의 결과에 대해 방어하라는 의미가 크다.

#### 9.2 모놀리식 대 분산 아키텍처

전체 코드를 단일 단위로 배포하는 모놀리식

- 레이어드
- 파이프라인
- 마이크로커널

원격 액세스 프로토콜을 통해 여러 단위로 배포하는 분산형

- 서비스 기반
- 이벤트 기반
- 공간 기반
- 서비스 지향
- 마이크로서비스

분산 아키텍처 스타일은 모놀리식 아키텍처 스타일에 비해 성능, 확장성, 가용성 측면에서 훨씬 강력하지만, 결코 모시할 수 없는 트레이드 오프가 수반된다.
1994년 L. 피터 도이치 및 선마이크로시스템즈에서 일했던 동료들이 'the fallacies of distributed computin: 분산 컴퓨팅의 오류' 라는 글에서 최초로 거론되었다. 오류fallacy는 옳다고 믿거나 가정하지만 실은 틀린 것을 말한다. 분산 아키텍처에도 이 8가지 오류가 적용된다.

#### 9.2.1 오류 1: 네트워크는 믿을 수 있다

<img width="477" alt="image" src="https://user-images.githubusercontent.com/17442457/235454038-57220d99-487c-402c-bbf6-6241483c2e53.png">

네트워크 문제로 서비스 A와 B가 요청과 응답을 못하는 문제. 타임아웃timeout 같은 장치나 서비스 사이에 회로 차단기circuit breaker를 두는 것이다.
마이크로서비스 아키텍처처럼 시스템이 네트워크에 더 의존할수록 시스템의 신뢰도는 잠재적으로 떨어질 가능성이 있다.

#### 9.2.2 오류 2: 레이턴시는 0이다

<img width="479" alt="image" src="https://user-images.githubusercontent.com/17442457/235454240-9a651782-adf8-41a8-a76e-a23c10c7e5f6.png">

로컬 호출의 소요 시간t_local은 나노 초 내지 밀리초 단위로 측정되지만, 동일한 호출을 원격 액세스 프로토콜을 통해서 수행하면 서비스 액세스 시간t_remote이 밀리초 단위로 측정된다. 따라서 t_remote 는 항상 t_local보다 클 수밖에 없고 모든 분산 아키텍처에서 레이턴시는 0이 아니다.

아키텍트는 어떤 분산 아키텍처를 구축하든지 간에 평균 레이턴시는 반드시 알아야 한다. 이것이 분산 아키텍처가 실현 가능한지 판단하는 유일한 방법이다. 긴 꼬리long tail 레이턴시가 분산 아키텍처의 성능을 저해하는 주범이 된다. 긴 꼬리 레이턴시: 평균 레이턴시가 60밀리초여도 95번째 백분위가 400밀리초일 경우를 뜻함.

#### 9.2.3 오류 3: 대역폭은 무한하다

<img width="478" alt="image" src="https://user-images.githubusercontent.com/17442457/235454718-7ff295d1-df82-4dff-ac9a-703ffbfccd6c.png">

마이크로서비스 분산 아키텍처에서 서비스들 간에 주고받는 통신이 대역폭을 상당히 점유하여 네트워크가 느려지고 레이턴시와 신뢰성에도 영향을 미친다.

서비스 A가 서비스 B를 호출해 고객 이름을 가져온다고 했을 때 고객 프로필 서비스는 총 500KB에 달하는 45개 속성을 위시 리스트 서비스에 반환하는데, 이 중 필요한 정보는 200 byte 밖에 안 되는 고객 이름 뿐이다. 이런 형태의 커플링을 스탬프 커플링stamp coupling이라고 한다.

스탬프 커플링은 분산 아키텍처에서 상당히 많은 대역폭을 차지하므로 다음과 같은 방법으로 해결 방안을 찾아야 한다.

- 프라이빗 REST API 엔드포인트
- 계약에 필드 셀렉터field selector를 사용
- GraphQL로 계약을 분리
- 컨슈머 주도 계약consumer-driven contract(CDC)과 값 주도 계약value-driven contract(VBC)을 병용한다
- 내부 메시징 엔드포인트를 사용한다.

어떤 기법을 적용하든, 분산 아키텍처 서비스 또는 시스템 간의 최소한의 데이터만 주고받도록 하는 것이 중요하다.

#### 9.2.4 오류 4: 네트워크는 안전하다

<img width="477" alt="image" src="https://user-images.githubusercontent.com/17442457/235455473-97beefbd-3028-45bb-aa63-ee61e2ce144d.png">

네트워크가 안전하지 않다는 사실을 망각하는 경향이 있다. 분산 배포된 각 엔드포인트는 알려지지 않은, 악의적인 요청이 해당 서비스로 유입되지 않게 철저한 보안 대책을 강구해야 한다. 모든 엔드포인트와 서비스간 통신에도 보안이 적용돼야 하므로 고도로 분산된 동기 아키텍처에서는 당연히 성능이 떨어질 수밖에 없다.

#### 9.2.5 오류 5: 토폴로지는 절대 안 바뀐다

<img width="475" alt="image" src="https://user-images.githubusercontent.com/17442457/235455490-1778822e-80fe-4c73-9a10-c114b7d55b4d.png">

네트워크를 구성하는 모든 라우터, 허브, 스위치, 방화벽, 네트워크, 어플라이언스 등 전체 네트워크 토폴로지는 당연히 변한다.
아키텍트는 운영자, 네트워크 관리자와 항시 소통을 하면서 무엇이, 언제 변경되는지 알고 있어야 한다.

#### 9.2.6 오류 6: 관리자는 한 사람뿐이다

<img width="481" alt="image" src="https://user-images.githubusercontent.com/17442457/235455649-78b50eeb-7213-4399-ab80-ede2f0355d2c.png">

아키텍트는 언제나 한 사람의 관리자와만 협의하고 소통하면 된다는 오류에 빠지는데, 분산 아키텍처 특성상 정상 궤도에 올려놓기 위해 많은 조율 과정이 불가피하다.

#### 9.2.7 오류 7: 운송비는 0이다

<img width="488" alt="image" src="https://user-images.githubusercontent.com/17442457/235455791-d5fe34e1-f23b-4c57-883f-ade4c5b5f931.png">

운송비는 단순한 REST 호출을 하는데 소요되는 진짜 비용actual cost이다. 분산 아키텍처는 하드웨어, 서버, 게이트웨이, 방화벽, 신규 서브넷, 프록시 등 리소스가 더 많이 동원되므로 모놀리식 아키텍처보다 비용이 훨씬 더 든다.

#### 9.2.8 오류 8 네트워크는 균일하다

<img width="471" alt="image" src="https://user-images.githubusercontent.com/17442457/235456003-b6dea429-f9b1-4286-83b4-5cfb853f466c.png">

실제 많은 회사의 인프라는 여러 업체의 네트워크 하드웨어 제품들이 얽히고 설켜 있다. 온갖 종류의 하드웨어가 서로 다 잘 맞물려 동작하는 것은 아니다. 네트워크 표준은 오랜 세월 발전을 해와서 문제가 안 될 수 있지만, 모든 상황과 부하, 환경에서 100% 완벽하게 테스트를 마친 것은 아니므로 실제 네트워크 패킷이 유실되는 사고도 일어나기도 한다.

#### 9.2.9 다른 분산 아키텍처 고려 사항

그외 분산 아키텍처를 설계할 때 맞닥뜨리게 될 이슈 및 해결해야 할 난제들이 있다.

**분산 로깅**

분산 아키텍처는 로그 종류만 해도 수백 가지에 달하고 위치도 제각각, 포맷도 제각각이라서 문제를 집어내기가 어렵다.
스플렁크splunk 같은 로깅 통합 도구를 사용하면 다양한 소스와 시스템에서 통합된 로그 및 콘솔로 데이터를 취합할 수 있지만 복잡한 분산 로그를 확인하기에는 역부족일 수 있다.

**분산 트랜잭션**

분산 아키텍처는 최종 일관성eventual consistency이라는 개념을 바탕으로 별도로 분리된 배포 단위에서 처리된 데이터를 미리 알 수 없는 어느 시점에 모두 일관된 상태로 동기화한다. 확장성, 성능, 가용성을 얻는 대가로 데이터 일관성과 무결성을 희생하는 트레이드오프이다.

분산 트랜잭션을 관리하는 한 가지 방법으로 트랜잭셔널 사가transactional saga가 있다. 보상을 위해 이벤트를 소싱하거나 트랜잭션 상태를 관리하기 위해 유한 상태 기계finite state machine를 활용한다.
사가 외에 BASE 트랜잭션도 사용한다. (BA)sic availability(기본 가용성), (S)oft state(소프트 상태), (E)ventual consitency(최종 일관성)의 약자로 소프트웨어 조각이 아닌 일종의 기법이다. 소프트 상태는 소스->타깃으로의 데이터 전달과 데이터 소스 간 비일관성을 말한다.

**계약 관리 및 버저닝**

계약 생성, 유지보수, 버저닝 역시 분산 아키텍처에서 다소 까다롭다. 계약은 클라이언트와 서비스 모드 합의한 행위와 데이터인데, 분리된 서비스와 시스템을 제각기 다른 팀과 부서가 소유하기 때문에 계약 유지보수가 특히 어렵다. 버전 구식화deprecation에 필요한 통신 모델을 더 더욱 복잡하다.