## Chapter 8 Before the Project

## Discussions

저는 topic 48의 The Essensce of Agility를 읽고 감동의 눈물을 흘렸습니다.
작년에 태형님, 우현님과 함께 애자일에 대한 책을 읽고 이야기를 많이 했었는데요.
현 시점에서도 각자 생각하는 애자일과 실제 실천하고 있는 좋은 모범 사례가 있다면 얘기해 보면 좋겠습니다.

저는 현재 실천하고 있는 건 아래와 같습니다.

- 정말 고객이 원하는 게 뭔지 계속 탐색하고 동료와 얘기하고 변화를 주고 있음.
- 작은 단위의 개발을 지향하고 함께 일하는 동료도 거기에 동의해서 진행
- 간결한 코드를 짜고 테스트가 통과하는 코드를 작성함
- 해야 할 일에 대한 스토리를 미루지 않고 능동적으로 처리하고 결과를 공유함

등입니다.

### Topic 45 The Requirements Pit

요구 사항이 땅 위에 놓여 있는 경우는 드물다. 보통은 가정과 오해, 정치 politics 의 지층 속 깊숙이 묻혀 있다. 심지어 아예 존재하지 않을 때도 있다.

> Tip 75 No One Knows Exactly What They Want

#### THE REQUIREMENTS MYTH

진짜 세상은 엉망이고 갈등이 넘쳐나며 알 수 없는 점도 많다. 무엇을 다루든 정확한 명세란 것은 거의 불가능하다고 볼 수 있다.
그래서 프로그래머는 사람들이 자신이 원하는 바를 깨닫도록 돕는 것이다.

> Tip 76 Programmers Help People Understand What They Want

#### PROGRAMMING AS THERAPY

최초의 요청 사항은 궁극적인 요구 사항이 아니다. 의뢰인은 인식하지 못할 수도 있지만, 의뢰인의 요청 사항은 사실 함께 탐험을 떠나 자는 초대장이다.

#### REQUIREMENTS ARE A PROCESS

프로그래머의 임무는 의뢰인에게 그들이 제시한 요구 사항의 여파를 깨우쳐 주는 것이다. 피드백을 주고 의뢰인은 피드백을 바탕으로 자기 생각을 더 가다듬는다.

> Tip 77 Requirements Are Learned in a Feedback Loop

사실 개발자가 하는 모든 일은 일종의 모형을 만드는 것이다. 프로젝트가 막바지에 이르러서도 의뢰인이 원하는 것을 계속 해석해야 한다.

실용주의 프로그래머는 프로젝트 전체를 요구 사항 수집 과정으로 보아야 한다. 그래서 짧은 주기로 반복하는 것을 선호한다. 반복 주기가 끝날 때마다 직접 의뢰인에게 피드백을 받는다.

#### WALK IN YOUR CLIENT’S SHOES

고객 상담을 위한 시스템을 작성하고 있는가? 경험 많은 고객 상담원을 며칠 간 관찰하라. 수작업 재고 관리 시스템을 자동화하고 있는가? 창고에서 일주일만 일해 보라.

> Tip 78 Work with a User to Think Like a User

#### REQUIREMENTS VS. POLICY

사업 정책인가, 요구 사항인가? 그 차이는 비교적 미묘하다.

"인사팀에서만 직원 기록을 열람할 수 있다."
"권한이 있는 사용자만이 직원 기록에 접근할 수 있다."
권한 관리를 할 수 있게 시스템을 구현해 놓으면 정책이 바뀔 때(실제로 바뀐다) 시스템의 메타데이터(Metadata) 만 업데이트하면 된다.

> Tip 79 Policy Is Metadata

#### REQUIREMENTS VS. REALITY

도구가 성공하려면 사용하는 사람의 손에 적응할 수 있어야 한다는 우리의 믿음을 잘 보여 준다. 이 점도 염두에 두어야 성공적으로 요구 사항을 수집할 수 있다. 그래서 프로토타입이나 예광탄을 이용한 빠른 피드백으로 의뢰인으로부터 "네. 이것이 원하는 것이 맞긴 한데 제가 원하는 방식은 아니네요."라는 반응을 얻어야 하는 것이다.

#### DOCUMENTING REQUIREMENTS

문서는 구현 과정에서 안내 역할을 하는 이정표일 뿐이다.

##### Requirements Documents Are Not for Clients

요구사항 문서를 처음부터 상세하게 만든 것은 두 가지 면에서 틀렸다.
첫째는 의뢰인은 자신이 원하는 것을 처음에는 잘 모른다.
두번째는 의뢰인은 절대 그걸 읽지 않는다.

##### Requirements Documents Are for Planning

애플리케이션의 작은 일부가 그 기능을 쓰는 사용자 관점에서 어떻게 작동해야 하는지를 적는 사용자 스토리를 만든다

#### OVERSPECIFICATION

좋은 요구 사항은 추상적이다. 요구 사항을 기술할 때는 사업에 필요한 사항을 정확히 반영하는 가장 간단한 표현이 최고다.
요구 사항은 필요를 표현하는 것이다.

#### JUST ONE MORE WAFER-THIN MINT...

요구 사항이 슬금슬금 추가되는 것을 어떻게 막을 수 있을까?
해답은 다시 한번 피드백이다. 반복 주기를 거치며 의뢰인과 정기적으로 피드백을 주고받는다면, "딱 한 기능만 더"란 요청이 미치는 영향을 의뢰인이 직접 체험할 것이다.
피드백은 서로 주고 받는 것이다

#### MAINTAIN A GLOSSARY

프로젝트에서 사용하는 모든 용어와 어휘를 모아 놓은 단 하나의 장소여야 한다.
용어 사전에 여러 사람이 접근하기 쉬워야 한다. 따라서 온라인 문서가 적합하다.

> Tip 80 Use a Project Glossary

#### EXERCISES

##### Exercise 33

Which of the following are probably genuine requirements?
Restate those that are not to make them more useful (if possible).

1. The response time must be less than ~500ms.
2. Modal windows will have a gray background.
3. The application will be organized as a number of front-end processes and a back-end server.
4. If a user enters non-numeric characters in a numeric field, the system will flash the field background and not accept them.
5. The code and data for this embedded application must fit within 32Mb.

```
답변)
1. 특정 페이지의 응답 속도라는 수식이 필요함, 그러면 요구사항이 됨
2. 나중에 회색이 아닐 경우에 요구사항이 추가되면 쉽게 처리할 방법이 필요
3. Front-end 프로세스가 갯수가 바뀌게 될 경우가 있음
4. 만약 잘못된 입력이라면 에러 메시지를 출력해야 할 필요 있음
5. 32Mb 안에 맞춰야 하므로 요구사항인듯
```

#### CHALLENGES

- Can you use the software you are writing? Is it possible to have a good feel for requirements without being able to use the software yourself?

```
답변)
직접 사용할 수 있는 소프트웨어다. 사용자 요구사항이 아닌 시스템 요구사항의 경우에도 요구사항을 정할 수 있긴 하다.
```

- Pick a non-computer-related problem you currently need to solve. Generate requirements for a noncomputer solution.

```
생각해 본 적이 없는 도전과제인데, 막연히 어렵게 느껴진다. 못할 듯 ㅜㅜ
```

### Topic 46 Solving Impossible Puzzles

어떤 제약 조건은 절대적이지만, 다른 것들은 단순한 지레짐작에 불과하다. 절대적 제약 조건은 그것이 아무리 불쾌하거나 어리석어 보여도 꼭 따라야 한다.
반면에 알렉산더가 증명했듯이 그럴싸해 보이는 제약 조건이 사실은 전혀 제약 조건이 아닐 수도 있다.

#### DEGREES OF FREEDOM

어떤 퍼즐이든 그것을 해결하는 열쇠는 제약을 인식하는 것과 더불어 주어진 자유도(degree of freedom)를 파악하는 것이다. 퍼즐의 해답은 그 자유도 안에서 발견된다.

> Tip 81 Don’t Think Outside the Box—Find the Box

제약을 범주 별로 나누고 우선순위를 매겨라. 목공에서는 작업에 필요한 목재를 재단할 때 가장 긴 조각을 먼저 자르고, 남은 나무에서 작은 조각들을 잘라낸다. 비슷한 방식으로 제일 구속이 심한 제약부터 파악해 내고 나머지 제약을 그 안에서 맞춰 보아야 한다.

#### GET OUT OF YOUR OWN WAY!

혹시 문제를 잠시도 손에서 놓고 싶지 않다면, 다음으로 좋을 만한 방법은 문제를 놓고 이야기할 사람을 찾는 것이다. 그저 문제에 대해 이야기하는 것으로 주의를 돌리기만 해도 깨달음을 얻을 때가 있다.

#### FORTUNE FAVORS THE PREPARED MIND

문제 해결에 필요한 원료는 바로 해답에 도움이 될 수 있는 경험이다.
뇌에 경험을 주입하는 가장 좋은 방법은 일상적인 작업을 할 때 무엇은 잘되고 무엇은 안되는지 피드백을 주는 것이다.

#### CHALLENGES

- Take a hard look at whatever difficult problem you are embroiled in today. Can you cut the Gordian knot? Do you have to do it this way? Do you have to do it at all?

```
답변)
아마 다른 방법이 있고 그걸 시도해 보는 것도 맞다고 본다
```

- Were you handed a set of constraints when you signed on to your current project? Are they all still applicable, and is the
interpretation of them still valid?

```
답변)
현재 프로젝트는 특별한 제안서 없이 시작하는 내부 프로젝트이다. 따라서 제약조건이 명기되어 있는 문서는 없다. 다만 진행하면서 만들어 나갈 것이므로 크게 문제가 될 것이라는 생각은 안 해봤다
```

### Topic 47 Working Together

페어 프로그래밍이나 몹 프로그래밍 방식은 함께 일하는 아주 강력한 방법이다. 끝없는 회의나 제안서보다, 그리고 유용 성보다 무게를 더 중시하는 법률 문서스러운 문서 뭉치보다 훨씬 낫다.
함께 일한다는 것은 실제로 코딩을 하는 와중에 질문을 하고 토론을 하는 것이다.

콘웨이의 법칙
의사소통은 조직 구조대로 진행된다는 이론
만약 코드를 분리해서 개발해야 한다면 그렇게 조직 구조를 만드는 것도 방법이다
특히 고객이 개발팀의 일원이라면 조직 구조에 속해 있으므로 고객의 존재가 드러나게 되어 있다. 왜냐하면 조직 구조대로 의사소통이 진행될 것이기 때문이다.

#### PAIR PROGRAMMING

사람들은 모두 다르므로 다른 배경과 경험을 가지고 있고, 문제를 푸는 데도 다른 기법과 접근 방법을 사용 한다.

두 번째 사람의 존재로 인해 생기는 사회적인 압력은 변수 이름을 foo로 짓는 것 같은 나쁜 습관이나 약점으로부터 우리를 지켜준다. 다른 사람이 지켜 보고 있으면 민망할 수도 있는 꼼수를 덜 쓰게 되고, 결과적으로 소프트웨어의 품질이 좋아진다.

#### MOB PROGRAMMING

몹 프로그래밍은 셋 이상의 사람이 참여하는 짝 프로그래밍의 확장판이다.
그리고 '실시간 코딩을 곁들인 밀접한 협업'이다 

#### WHAT SHOULD I DO?

인간적인 측면에서 팁

- 코드를 짜는 거지 자아 ego 를 쌓는 게 아니다. 누가 가장 똑똑한지 겨루는 것이 아니다. 우리 모두는 각자 뛰어난 부분이나 장단점이 있다.
- 소규모로 시작하라. 네다섯 명과 몹을 만들어 보거나, 짝 프로그래밍을 짧게 몇 번 해 보는 것으로 시작하라.
- 코드만 비판하고 사람을 비판하지 말라. “넌 틀렸어.”보다는 “이 부분을 한번 볼까요?”가 훨씬 듣기 좋다.
- 다른 사람의 관점을 듣고 이해하려고 노력하라. 다른 것은 틀린 것이 아니다.
- 자주 회고를 하라. 그래서 다음번에 시도하거나 개선할 점을 찾아라.

> Tip 82 Don’t Go into the Code Alone

### Topic 48 The Essence of Agility

애자일은 일하는 방식이다.

> Tip 83 Agile Is Not a Noun; Agile Is How You Do Things

Back to the Basics
애자일 선언문을 기억해야 한다

- Individuals and interactions over processes and tools
- Working software over comprehensive documentation
- Customer collaboration over contract negotiation
- Responding to change over following a plan

#### THERE CAN NEVER BE AN AGILE PROCESS

소프트웨어를 개발할 때 따라야 할 단 한 가지 계획이란 없다. 애자일 선언의 네 가지 가치 중 세 가지가 이를 언급하고 있다. 온통 피드백을 수집하고 그에 대응하라는 것 뿐이다.

#### SO WHAT DO WE DO?

모든 것은 결국 불확실성을 어떻게 다룰 것인가 하는 문제에 달렸다. 애자일 선언은 피드백을 모으고 그에 맞게 행동함으로써 불확실성을 헤쳐 나가라고 제안한다.

애자일하게 일하는 방법

1. 여러분이 어디에 있는지 알아내라.
2. 도달하고 싶은 곳을 향하여 의미 있는 발걸음을 가능한 한 작게 옮겨라.
3. 어디에 도착했는지 평가하고, 망가트린 것이 있으면 고쳐라.

지속적으로 프로세스를 실험하지 않는 팀은 애자일 팀이 아니다.

```
의견)
여기서 애자일하게 일한다는 것의 정수가 나온 것 같다.
어디에 있는지를 알아내라는 얘기는 어디까지 왔고 (count sprint) 얼마나 더 할 게 있는지 (backlog)를 파악하라는 얘기 같고
의미 있는 발걸음을 작게 옮기라는 것도 backlog의 스토리를 작은 단위 적어도 이틀이 넘지 않는 작업 단위로 하라는 의미이며
어디에 도착했는지 평가하는 것은 회고를 진행하고 피드백을 주고 받으라는 의미이며
망가뜨린 것이 있으면 고쳐라 역시 부족한 부분 우선순위를 높여서 바로잡아야 하는 부분을 빠르게 진행하라는 의미로 해석된다.

마지막 말에서 깨달음을 얻을 수 있다.
애자일은 프로세스일 수 있지만, 정해져 있는 프로세스는 아니다.
구성원들이 더 잘할 수 있는 방법이 있고 그게 합의가 이루어진다면 그게 바로 애자일하게 일하는 방법이라는 걸 또 일깨워 준다.
정해진 틀에 갇혀 보여주기식으로 진행하는 건 절대 애자일이라고 할 수 없다.
```

#### AND THIS DRIVES DESIGN

애자일이 전반적으로 작동하게 하려면 좋은 설계를 만들어야 한다. 좋은 설계는 무언가를 바꾸기 쉽게 하기 때문이다. 바꾸기 쉽다면 모든 층위에서 아무런 주저 없이 문제를 바로잡을 수 있을 것이다.
이것이 애자일이다.

#### CHALLENGES

The simple feedback loop isn’t just for software. Think of other decisions you’ve made recently. Could any of them have been
improved by thinking about how you might be able to undo them if things didn’t take you in the direction you were going?
Can you think of ways you can improve what you do by gathering and acting on feedback?

```
답변)
책을 읽고 나서의 도전과제는 애자일 하게 일하는 걸 꼭 개발이 아니더라도 할 수 있지 않을까?를 일깨워 주는 것 같다
약간의 계획이 틀어지면 조금씩 바로 잡고 계속 나아가는 것으로 개선의 여지를 만들 수 있다고 생각한다.
```