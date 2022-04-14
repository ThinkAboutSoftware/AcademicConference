## 1. A Pragmatic Philosophy

## Discussions

Topic 3 Software Entropy의 내용이 인상적이었는데요 흔히 얘기하는 기술 부채 얘기를 넘어 깨진 창문에 대한 이야기가 나옵니다. 혹시 업무 진행하면서 **'깨진 창문' 같은 코드를 보고 책에 나온 내용과 비슷한 생각을 가져본 적이 있는지 궁금합니다.**

**또, 그런 '깨진 창문' 코드를 보고 대처를 어떻게 하셨는지 솔직한 얘기도 듣고 싶군요 ㅎㅎ**

의견)  
저의 경우는 반반입니다. 깨진 창문 코드를 보면

- '에이 언젠가 다시 잘 바꿔 놓겠지' 하고 두는 경우도 있고
- '어 이거 그냥 두면 안되겠는데?' 하고 코드 작성한 사람을 찾아가 같이 다른 방법으로 바꾸자고 제안하고 페어 프로그래밍도 하고 그렇습니다.

제일 중요한 건 시간 배분을 하는 것이라고 보는데요. 타이트한 일정에 피쳐 개발하는데 시간이 할당된 개발자에게 리팩토링, 구조 개선, 페어 프로그래밍 할 시간은 아주 사치스러운 시간으로 여겨지는 경우가 많은 것 같습니다.

즉, 저는 여유 시간이 있으면 깨진 창문을 복구하려고 하고, 시간이 없으면 그냥 두고 지나가는 이중적인 성격을 가지고 있는 것 같습니다.

## How to read

Topic 별로 내용 정리를 했습니다.  
중간 중간에 Tip에 대한 내용은 영어 문장으로 넣었습니다.  
도전해 볼 것에 대한 질문은 책의 내용을 가져오면 안될 것 같아 영문 문장으로 넣고 답변을 한글로 적었습니다.  
마지막으로 내용에 대한 의견은 `의견)` 이라고 적고 그 밑에 제 생각을 적었습니다.

### Topic 1. It’s Your Life

> Tip3. You Have Agency

추천사에 나온 agency의 해석
"the ability to take action or to choose what actions to take"
주체적으로 원하는 행동을 고르고 행할 수 있는 능력

회사에서 뭔가 해주지 않는 걸 불평하지 말고
주도적으로 얘기해서 변화를 가져와 보자.

### Topic 2. The Cat Ate My Source Code

프로페셔널한 태도를 가져야 한다. 실수를 인정하고, 정직하고 솔직해야 한다.

#### Team trust

신뢰를 얻으려면 팀에 신뢰를 주는 행동을 해야 한다.

#### Take responsibility

책임감을 갖고 해결책을 찾아내야 한다. 그리고 위험이 감지되면 대책을 세워야 한다.
토픽의 주제와 같이 고양이 핑계를 대봐야 도움이 되지 않는다.

> Tip4. Provide Options, Don’t Make Lame Excuses(변병)

변명보다는 대안이나 해결책을 제시하고 실천할 수 있도록 하자.
부탁을 어려워하지 말고 도움이 필요하다는 사실을 인정하자.

#### CHALLENGES

- How do you react when someone—such as a bank teller, an auto mechanic, or a clerk—comes to you with a lame excuse? What do you think of them and their company as a result?
  - 솔직히 들어줄 이유도 없고, 그런 얘기를 할 필요가 없다. 즉 반대로 생각해 보면 topic 2에서 하고자 하는 의미가 어떤 건지 더 명확하게 이해가 된다. 그런 변명을 하는 사람의 얘기를 들으면 신뢰가 가지 않는 다는 것도 자연스럽게 떠올릴 수 있다.

- When you find yourself saying, “I don’t know,” be sure to follow it up with “—but I’ll find out.” It’s a great way to admit what you don’t know, but then take responsibility like a pro.
  - 이런 식으로 얘기하는지 생각해 봤는데, 조금 다른 접근법으로 누구라도 "안되는데요 (어쩌라고)" 와 같은 생각이 들기 때문에 대안 제시는 반드시 필수라고 생각한다. 중요: **볼드체 I'll find out**

###  Topic 3. Software Entropy

소프트웨어 개발이 어디로 향할지 모르는 상황에서 기술 부채는 위험하다.
그리고 그 부채가 관여하는 요소는 많은데, 심리학적 혹은 문화적 요소다.
깨진 창문의 법칙에 의해 한번 깨진 창문은 방치되고 아무것도 고치려 하지 않는다는 개념.

> Tip 5. Don’t Live with Broken Windows

일단 깨진 창문(나쁜 설계, 잘못된 결정, 형편없는 코드)을 그냥 두지 말고, 발견하면 바로 고치자.
바로 고칠 시간이 없으면, 판자로 덮어 두기라도 하자.
뭔가 손길이 가고 관리가 되고 있음을 보여줘야 한다.

#### FIRST, DO NO HARM

깨진 창문이 꽤 있는 프로젝트에서 일할 때는 '나머지 코드가 전부 쓰레기니까 나도 그렇게 하지 뭐.' 라는 사고에 빠지기 너무 쉽다.
깨진 창문은 없어야 한다.

#### CHALLENGES

- Help strengthen your team by surveying your project neighborhood. Choose two or three broken windows and discuss with your colleagues what the problems are and what could be done to fix them.
  - 해볼만 하다. 물론 모두가 바빠서 할 시간이 없다 생각이 자연스럽게 나온다거나, 이런 깨진 창문을 만든 사람에게 지적질 하는 것 처럼 느껴지는 개발 문화가 아니라면 말이다.
- Can you tell when a window first gets broken? What is your reaction? If it was the result of someone else’s decision, or a management edict, what can you do about it?
  - 나의 위치상으로는 말할 수 있다. 조심스럽게 반응해야 하고 바로 해야 하는 일이 아닌 애자일 스크럼상 다음 백로그에 등록하고 검토할 시간을 줘야 할 것이다. 경영진의 얘기라면 들어줄 수는 있지만 팩트는 얘기해줘야 한다고 생각한다. 

### Topic 4. Stone Soup and Boiled Frogs

맛있는 수프를 만들기 위해 마을 사람들에게 동기 부여를 해서 재료를 구하게 하고 수프를 먹게 되었다는 이야기.
여기서 어떤 일을 시작할 때(시작 피로) 사람들한테 일처럼 시키면 안되고, 마치 중요하지 않은 것처럼 가장해서라도 어떤 일을 하면 나아질 수 있겠다 라고 하는 방식이 좋다.
미래를 살짝이라도 보여 주면 사람들은 도와주기 위해 모여들 것이다. => "허락을 얻는 것보다 용서를 구하는 것이 더 쉽다"

> Tip 6. Be a Catalyst for Change

#### THE VILLAGERS’ SIDE

마을 사람들의 경우에는 돌멩이에 대해 생각하느라 다른 세상의 일들에 대해 잊어 버린 케이스.
프로젝트는 우리가 모르는 사이에 서서히 악화되다가 어느 순간 사람들의 의욕을 꺾고 팀을 파괴한다.

> Tip 7. Remember the Big Picture

개구리를 찬물이 있는 냄비에 넣어 두고 서서히 끓이면 삶아질 때 까지 그대로 있을 것이기 떄문에
우리도 개구리 처럼 되지 않으려면 큰 그림에 늘 주의를 기울여야 한다.
당장 급한 것에만 매몰되지 말고 가끔 주변 상황을 살피면서 프로젝트가 나아갈 수 있게 일을 해야 한다.

#### CHALLENGES

- While reviewing a draft of the first edition, John Lakos raised the following issue: The soldiers progressively deceive the villagers, but the change they catalyze does them all good. However, by progressively deceiving the frog, you’re doing it harm. Can you determine whether you’re making stone soup or frog soup when you try to catalyze change? Is the decision subjective or objective?
  - 판단을 혼자 하는 게 아니라 팀, 고객, 경영진 등 모두가 함께 한다면 조금이라도 더 객관적인 시선으로 볼 수 있지 않을까 하는게 내 생각
- Quick, without looking, how many lights are in the ceiling above you? How many exits in the room? How many people? Is there anything out of context, anything that looks like it doesn’t belong? This is an exercise in situational awareness, a technique practiced by folks ranging from Boy and Girl Scouts to Navy SEALs. Get in the habit of really looking and noticing your surroundings. Then do the same for your project.
  - 천장에 전등 1개, 출구 1개, 사람 1명(아내)가 있다. 나의 경우 주변 상황 인식을 잘 하려는 편이고, 일을 계획한대로 하고 있는지도 잘 판단하려고 하기에. 음 이런 훈련은 하는 것이 좋다고 생각한다.

### Topic 5. Good-Enough Software

완벽한 걸 만들 수 없고 시간, 기술, 기질 같은 것이 버그 없는 소프트웨어를 만드는데 방해를 한다.
그러므로 적당히 괜찮은, 하지만 형편없는 코드를 의미하지 않는 작업을 하는 것이 좋다. => 마음의 평화 유지, 더 생산적이라는 믿음, 사용자가 행복해 할 것이라는 점

#### INVOLVE YOUR USERS IN THE TRADE-OFF

심장 박동 조율기, 자동 항법 장치, 널리 배포될 저수준 라이브러리는 요구 사항이 훨씬 엄격하다.
아주 새로운 제품이라면 제약 조건이 조금 다르므로, 새 기능 추가나 코드 한번 더 다듬기 위해서 사용자의 요구 사항을 무시한다면 전문가 답지 못하다.
시스템의 범위와 품질은 요구 사항 중 하나로 논의되어야 한다.

> Tip 8. Make Quality a Requirements Issue

사용자에게 직접 만져볼 수 있는 것을 일찍 준다면, 피드백을 통해 더 나은 해결책에 도달할 수 있다.

#### KNOW WHEN TO STOP

완벽하게 훌륭한 프로그램을 과도하게 장식하거나 지나칠 정도로 다듬느라 망치지 말라.
완벽하지 않아도 그냥 두자, 완벽은 없다.

#### CHALLENGES

- Look at the software tools and operating systems that you use regularly. Can you find any evidence that these organizations
and/or developers are comfortable shipping software they know is not perfect? As a user, would you rather (1) wait for them to get all the bugs out, (2) have complex software and accept some bugs, or (3) opt for simpler software with fewer defects?
  - (3) 번이 이상적인 답변 같다. 하지만 일상적으로 쓰는 도구나 운영체제는 simple software가 아니므로 (2)번을 선택하는게 오히려 나을 수 있다. 복잡한 소프트웨어지만 약간의 버그는 감수해야 하는 것. 실제로 쓰는 많은 소프트웨어 툴들이 그렇게 릴리즈가 되어서 쓰고 있고 버그도 리포팅 하고 있다. 이게 완벽에 가까운 소프트웨어를 출시하기가 불가능한 이유를 설명해 준다고 생각한다.
- Consider the effect of modularization on the delivery of software. Will it take more or less time to get a tightly coupled monolithic block of software to the required quality compared with a system designed as very loosely coupled modules or microservices? What are the advantages or disadvantages of each approach?
   - loosely coupled modules or microservices가 더 오래걸릴 것으로 예상하는데, 이유는 각각의 interface에 대한 의사소통에 대한  비용 그리고 처리 결과를 각 모듈에서 체크해야 하므로 그렇다. 하지만 장단점으로 놓고 봤을 때는 microservice가 오래 걸리기는 해도 장기적으로는 좋은데 문제가 생기는 모듈들에 대한 수정이 이루어지고 인터페이스의 변화가 없다면 monolithic 보다는 빠른 수정, 빠른 배포, 빠른 서비스 재개가 가능하기 때문이다. 개발 하는 속도는 monolithic 이 빠를 수는 있어도 릴리즈 이후는 microservice 식이 더 장점이 있다고 생각한다.
- Can you think of popular software that suffers from feature bloat? That is, software containing far more features than you would ever use, each feature introducing more opportunity for bugs and security vulnerabilities, and making the features you do use harder to find and manage. Are you in danger of falling into this trap yourself?
  - 아무래도 유명한 소프트웨어라면 windows 운영체제를 떠올릴 수 있다. 실제로 windows 11 insider program을 쓰고 있는데 평균 1주일에 한번 씩 업데이트를 진행한다. 다행히 내가 개발하는 소프트웨어는 그 정도로 유명하지도 않고 취약점이 많을 정도로 기능이 많지도 않다.

### Topic 6. Your Knowledge Portfolio

지식의 가치는 떨어지고, 새로운 개발 지식이 개발되기에 우리의 지식 가치가 떨어져서 몸값의 가치가 떨어질 수 있음을 알고 예방을 해야 한다.
그러므로 새로운 것을 배우는 능력이 중요한 전략 자산이기에 배우는 방법을 배워야 한다.

#### YOUR KNOWLEDGE PORTFOLIO

투자 포트폴리오 관리 방식처럼 지식도 지식 포트폴리오에 투자하고 관리해야 한다.

#### BUILDING YOUR PORTFOLIO

- _Invest regularly_
- _Diversify_
- _Manage risk_
- _Buy low, sell high_
- _Review and rebalance_

> Tip 9. Invest Regularly in Your Knowledge Portfolio

#### GOALS

- Learn at least one new language every year
- Read a technical book each month
- Read nontechnical books, too
- Take classes
- Participate in local user groups and meetups
- Experiment with diferent environments
- Stay current

투자를 통해서 학습이 일어나고, 학습을 통해서 사고가 확장된다.
이로 인해 새로운 가능성이 열리고 문제를 해결하는 새로운 방법이 떠오른다.
새롭게 배운 교훈을 현재 프로젝트에 적용해 보려고 노력하자.

#### OPPORTUNITIES FOR LEARNING

모르는 것에 대해 질문을 받으면, 거기서 멈추지 말고 답을 바로 찾아보자. 
독서와 연구는 시간이 걸리고, 시간은 늘 부족한 자원이므로 미리 계획해야만 한다.
비는 시간을 잘 활용해서 읽을 거리를 준비하고 ebook을 읽자.

#### CRITICAL THINKING

비판적 생각을 가져야 한다. 모든 문제의 답이라고 주장하는 광신도를 조심하자.
그게 프로젝트 맞을 수도 있지만, 맞지 않을 수도 있다.

> Tip 10. Critically Analyze What You Read and Hear

- Ask the “Five Whys”
- Who does this benefit?
- What’s the context?
- When or Where would this work?
- Why is this a problem?

#### CHALLENGES

- Start learning a new language this week. Always programmed in the same old language? Try Clojure, Elixir, Elm, F#, Go, Haskell, Python, R, ReasonML, Ruby, Rust, Scala, Swift, TypeScript, or anything else that appeals and/or looks as if you might like it.
  - 배울 동기를 만드는 것도 중요할 것 같다. 아무래도 수학 문제 푸는 것을 다시 시작하고 여러 언어로 풀어내는 걸 다시 시작해야 할 것 같다.
- Start reading a new book (but finish this one first!). If you are doing very detailed implementation and coding, read a book on design and architecture. If you are doing high-level design, read a book on coding techniques.
  - 매달 새 책을 읽어 나가는 것을 습관으로 하고 있다.
- Get out and talk technology with people who aren’t involved in your current project, or who don’t work for the same company. Network in your company cafeteria, or maybe seek out fellow enthusiasts at a local meetup.
  - 간혹 GDG 모임에서 Flutter나 머신러닝에 대해 발표도 듣고 참여도 하는 편이다. 

### Topic 7. Communicate!

의사소통에 사용하는 언어도 또 다른 프로그래밍 언어일 뿐이라 여겨라.
사람을 위한 글을 쓰는 것도 코드를 쓰는 것과 똑같다.

의견)
상당히 동의하는 바이고 맞는 말이라고 생각한다. 개발자 들 중에 한 가지 이해가 안 되는 점 중에 하나는 코드는 그렇게 잘 짜서 실력 있는 사람이 되고 싶어하면서 왜 문서 작업은 하기 싫어하는 것일까? 문서 작성을 잘 해서 발표도 하고 실력 있는 개발자라는 걸 보여주는 것도 좋은 표현 방법 중에 하나라고 생각한다.

> Tip 11. English is Just Another Programming Language

#### KNOW YOUR AUDIENCE

듣는 사람의 요구와 관심, 능력을 이해할 필요가 있다.

의견)
이 것도 상당히 동의하는 바이다. 특히 경력이 많고 아는 게 많아질 수록 듣는 사람의 수준이 자신과 같다는 착각에 잘 이해가 안되면 화를 내거나 무시하는 사람이 있는데, 이런 자세 역시 소통하는 능력이 부족하다고 생각하고 싶다.

#### KNOW WHAT YOU WANT TO SAY

무엇을 말할지 미리 계획하라. 개요를 작성하라. 그리고 자문하라.
'이렇게 하면 내가 표현하고 싶은 것을 듣는 사람에게 통하는 방법으로 잘 전달할 수 있나?' 그렇게 될 때까지 다듬어라

#### CHOOSE YOUR MOMENT

가끔 '...에 대해 이야기할 좋은 떄일까? 라는 간단한 질문을 해 보는 것만으로도 충분하다.

#### CHOOSE A STYLE

전달하는 스타일을 청중에게 어울리도록 조정하라.
다만, 짧은 설명에 대한 요청이 실제로는 짧게 설명이 안된다면 사실대로 얘기하자.

#### MAKE IT LOOK GOOD

멋지게 전달할 수단을 준비해야 한다.
개발자들이 문서를 만들 때 내용에 집중한다. 우리 생각에 이것은 실수다.

의견)
뜨끔하다 ㅎㅎㅎ 사실 나 역시도 문서 내용에 많이 집중하는 편이긴 하다. 발표용이면 조금 다르게 만들 긴 할텐데 그냥 보고 얘기할 문서까지 잘 만들어야 하는 생각은 든다.

중요한 것 하나. 맞춤법을 확인하라. 자동으로 확인 이후, 눈으로 직접 확인하자. 검사기가 잡아내지 못하는 맞춤법 실수도 있다.

#### INVOLVE YOUR AUDIENCE

문서 초안에 참여시킨다. 피드백을 받고 그들의 머릿속을 도용하라.
독자와 더 좋은 관계를 형성하고, 더 나은 문서를 만들 수 있다.

#### BE A LISTENER

다른 사람들이 내가 하는 말을 경청해 주길 바란다면, 그들의 말을 경청하는 것이다.

#### GET BACK TO PEOPLE

이메일을 잊지 않고 회신 보내자.

> Tip 12. It’s Both What You Say and the Way You Say It

#### DOCUMENTATION

실용주의 프로그래머는 문서화를 전체 개발 프로세스의 필요 불가결한 부분으로 받아들인다.

> Tip 13. Build Documentation In, Don’t Bolt It On (문서를 애초부터 포함하고, 나중에 집어넣으려고 하지 말라)

소스코드에 주석 달기
모듈의 외부 인터페이스에 주석 달기.
주석 달기 주의점

- 왜 이렇게 되어 있는지 코드의 용도와 목적을 논의해야 한다.
- 어떻게 동작하는지는 코드가 이미 보여 주기 때문에 사족에 가깝다. 이것은 DRY 원칙 위반이다

소스코드에 주석을 달면 기술적인 절칭점, 어떤 결정의 이유, 폐기한 대른 대안 등을 기술한다.

#### SUMMARY

- Know what you want to say.
- Know your audience.
- Choose your moment.
- Choose a style.
- Make it look good.
- Involve your audience.
- Be a listener.
- Get back to people.
- Keep code and documentation together.

#### CHALLENGES

- There are several good books that contain sections on communications within teams, including The Mythical Man-
Month: Essays on Software Engineering [Bro96] and Peopleware: Productive Projects and Teams [DL13]. Make it a point to try to read these over the next 18 months. In addition, Dinosaur Brains: Dealing with All Those Impossible People at Work [BR89] discusses the emotional baggage we all bring to the work environment.
  - 이 책은 이미 읽은 책들이지만... academic conference에서 읽자는 제안이 오면 기꺼이 다시 읽을 생각이 있다. 또 Dinosaur Brain의 경우는 번역본이 없고 심지어 1996 출판본이라 구할 수 있을지 의문이다. http://aladin.kr/p/QFECy
- The next time you have to give a presentation, or write a memo advocating some position, try working through the advice in this section before you start. Explicitly identify the audience and what you need to communicate. If appropriate, talk to your audience afterward and see how accurate your assessment of their needs was.
  - 다음 발표자료 만들 때 충분히 고려해 볼만 하다고 생각한다. 가끔 만들면서 이렇게 전달하면 이해를 할 수 있을까? 전달하려는 메시지에 벗어나지 않을까? 라는 고민은 좀 하는 편인데 괜찮은 가이드 같다.