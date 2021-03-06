# 7장 기술적 실행 관례

- TDD
- Pair Programming
- eXtreme Programming

왜 이런 관례들에 관심을 가져야 하는지 이해해 보는 시간!

아직 위 내용이 뭔지 잘 모르거나 하면 한번 더 찾아보고 이해해 보면 좋을 것 같다.

나의 경우

- TDD는 2010년 쯤에 처음 접하고 적용해보려 했지만 실패함. TDD가 뭐하는건지 모르고 코드만 짜려고 했기 때문. 결국 설계가 안나오면 TDD가 안된다는 걸 알게 된 건 훨씬 이후인 2017년 쯤에 알게 됨

- Pair Programming은 대학 다니던 시절 그러니까 2002년 쯤에 책을 접해서 알게 됨. 동기 녀석들과 몇 번 해봤는데 지적질만 하게 되고 책에서 나온 내용대로 되지 않음. 이후 12년 후에 회사에서 팀원들과 한번 더 해보게 됨. 시간은 두배로 드는데 아웃풋이 두배가 나오지 않자 회의적인 시선을 가지게 됐음. 다만 모든 팀원이 다른 사람이 구현한 부분을 몰라서 못한다는 부분은 없었기에 인력 관리 측면에서는 괜찮다는 생각을 하게 됨. 이후로 억지로 pair programming이라고 하지 않고 자연스럽게 얘기하다가 키보드 마우스 뺐어서 능청스럽게 함.

- eXtreme Programming은 pair programming 하던 때와 동일하고 적용 시점도 동일함. 하지만 잘못된 애자일 적용으로 실패.

## 올바른 일 vs 올바른 실행

애자일 방법론이 소프트웨어 장인의 일부를 포함하고 있지만 소프트웨어 장인정신은 조금 더 기술적인 실행 관례에 집중하는 것이라 설명한다.

그레 올바른 일을 하고 있는지 알 수 있게 해준다.

여기서 설명하는 것만으로는 애자일 원칙을 지키고 코드 베이스의 품질 상태를 개발자가 숨기지 않는 것으로 생각할 수 있을 수 있다. 하지만 이 내용을 넘어 일을 올바르게 하는지 알 수 있는 질문에 대해 계속해서 내용을 읽어 나가야 이해가 된다.

## 상황 논리

우리 나라는 달라
우리 회사는 달라
우리 팀은 달라

와 같은 상황 논리는 그냥 변명일 뿐이다.

스크럼을 도입한다고 해도 소프트웨어 자체에 관심을 가지지 않는다면 그저 그런 보여주기식 애자일이 될 가능성이 높다.

우리의 상황에 대한 변명이 아닌 더 정확한 이해가 필요하다고 얘기한다. 나 역시도 여기에 동의한다. 애자일로 일하는 방식을 바꾸기 전에 우리가 어떤 상황인지 파악하는게 더 중요하기 때문이다.

## 익스트림 프로그래밍의 역사

켄트 벡.
워드 커닝핸
마틴 파울러, 체트 핸드릭슨, 돈 웰스

등의 흐름

하지만 XP의 실행 관례를 따르는 경우는 드문데, 우리나라도 2000년대 초반에 많은 번역서가 나왔으나 지금은 정말 실행하고 있는지 잘 모르겠다. 단지 애자일 중의 하나 정도로 취급하고 초창기 모델이라고 생각하는게 전부인 듯.

## 실행 관례와 가치

여기서 얘기하는 가치는 다음과 같이 이해된다.

> 실행 관례가 효율적이려면 반드시 모든 팀 구성원들에 의해서 그 가치가 납득되어야 한다.

나는 이 부분이 중요하다고 본다. 그냥 도입하면 잘 될거야를 떠나서 팀 모두가 그 가치에 대해 이해하고 실행해야 한다는 걸 설명하기 때문이다.

그리고 마지막에 그 가치를 이렇게 정리한다.

> 빠른 피드백 루프, 요구사항과 비용에 대한 더 나은 이해, 지식 공유, 줄어드는 버그, 전체적으로 자동화되고 릴리즈가 빨라지는 일들

이라고 한다.

음 좋은 얘기들만 나열한 것 같은데, 지식 공유는 경험해 본바 조금 공감이 되고 자동화되고 릴리즈가 빨라지는 것도 맞는 얘기로 보인다. 나머지는... 잘 모르겠다.

### 실행 관례를 통한 가치 창출

<익스트림 프로그래밍 소개>는 2005년에 <익스트림 프로그래밍>으로 번역되서 출간되었다. 읽어는 봤는데 구체적인 내용이 기억이 안난다 ㅜㅜ

다만 가장 기억에 많이 남는 건 가치와 원칙이었다. XP는 이 책으로 시작하는게 맞고, 그 당시 유행이었다. 하나 남긴게 있다면 애자일이라는 씨앗 정도인 것 같다.

### 자동화된 테스트

일단 테스트 코드를 작성해 놓은게 있어야 진정한 의미를 알 수 있다. 수십개의 테스트 코드가 단 몇 분만에 통과가 되는 걸 보고 있으면 뿌듯하다는 느낌도 드니까.

### 테스트 먼저

TDD의 순기능에 대해서 잘 설명해 주고 있다.

> 테스트 코드를 잘 정리된 요구사항의 역할도 하기 때문에 딱 필요한 만큼만 코딩하도록 유도하여 불필요하게 복잡해지거나 오버 엔지니어링을 하는 것을 줄여준다.

### 테스트 주도 개발

매우 중요한 문장이 하나 있다.

> TDD의 이름 자체에 '테스트'가 들어 있기는 있지만 사실 TDD는 설계에 대한 실행 관례다.

크아~ 설계에 대한 실행 관례인 것이다. 진짜 알아야 하는 부분이라고 본다. 이 사실을 간과하고 테스트 코드 먼저 짜는게 TDD겠지 하고 덤비다가 이도저도 아닌 상황을 겪에 될 것이다.

### 지속가능한 통합

지속적인 통합(CI)는 많이 들어봐서 알 것이다. 코드의 수정이 일어나도 항상 배포 가능한 상태를 만들어 유지하는 것이 포인트.

### 페어 프로그래밍

시간만 충분히 주어진다면, 그리고 팀원들이 페어 프로그래밍을 일로 받아들이지 않고 자연스럽게 대화 하듯이 하고 있다면 괜찮은 방법이다.

다만, 시간이 없다면 github의 pull reqeust로 온라인 리뷰를 하는게 시간을 좀 더 절약하는 방법이라고 보고, 페어 프로그래밍도 일로 받아들이면 영혼없이 하게 되고 의미없는 시간만 서로 보내는 부작용도 있으므로 주의해야 한다고 본다.

### 리팩토링

너무나도 유명한 단어가 되어서 굳이 언급해야 하거나 이해가 안가는 수준은 아니라고 본다.

핵심 포인트는 지속적으로 코드 리팩토링을 진행해야 한다는 것이다.

## 책임감

여태까지 얘기한 실행 관례들을 도입하지 않는 결정에도 책임감을 가져야 한다고 한다. 개발자 뿐 아니라 관리자 역시 그래야 한다고 한다.

그렇다는 것은 얼마나 쓸만한 관례인지 직접 경험해 보면 좋겠다는 생각이 들지 않을까?

## 실용주의

여기서는 인용하는 내용이 더 와닿을 것 같다.

> 실용주의는 소프트웨어 장인이 가져야 하는 최선의 역량 중 하나다. 누군가가 이야기했기 때문에. 또는 그 실행 관례 도입을 위한 도입을 해서는 안된다.

> ... 항상 우리가 무엇을 하고 있고 그것을 왜 하고 잇는지 질문해야 한다.

어떤 관계를 따라야 할 때 그게 우리 팀, 나의 프로젝트에 어떤 가치를 주는지 확인해 보고 검토해야 한다는게 중요한 포인트.

## 요약

어떤 실행관례를 도입하기 전에, 우리가 중요하게 생각하는 가치가 무엇인지 논의하는게 중요하다.

TDD가 필요 없다면 왜 필요 없는지 논의가 되어야 한다는 뜻이기도 하다.

중요한건 소프트웨어 장인에게는 최선의 방법, 실행 관례를 선택하는데 합리적인 판단을 해야 한다는 것이다.