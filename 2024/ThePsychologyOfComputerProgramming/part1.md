* Preface
    * Executive들이 프로그래머들을 제거하려는 노력이 실패했다는 부분을 염세적으로 표현한다. 그럼과 동시에 프로그래머들이 그 아이디어를 배워야한다고 하는데, 이에 대해서 동의하는 생각을 가지고 있다. 실은 엔지니어로서도 하는 일이 자동화고, 사람요소를 최대한 배재하거나 적게 만들고, 자동화하는게 해결하는 방식의 핵심이다. 물론 100% 제거하는 데에는 힘이 들겠지만, 적절한 절충안을 찾고, 그 해결책을 구현하는게 개발자로서 핵심 역량이 아닐까하는 생각이 든다.
* Part 1. Programming as Human Performance
    * Reading Programs
        * Note
            * 연구하는 방식으로서 프로그램을 읽는 것에 대한 정리로 이해했다.
        * Sub
            * Why each line implemented in that way?
                * Machine limitation
                    * 예제. 예전에 천공카드를 1000글자만 읽을 수 있었던 메모리 제약.
                * Language/Library limitation
                    * 본문에서는 Language feature에 대한 제약을 이야기했지만, SUM builtin function에 대해서도 다르기 때문에, library에 대한 제약도 되는 것 같다.
                    * 예제. SUM built-in function이 float-point summation만 지원하기 때문에, 이로 인해서 연산 결과에 오차가 발생할 수 있다. 그래서 for-loop로 직접 덧셈을 함으로서 이를 해결했다.
                * Programmer limitation	
                    * 개인의 숙련도나, 가지고 지식의 양의 다름으로 인해서 발생하는 현상
                * Historical Trace
                    * 역사적으로 코드가 어떻게 발전했는지를 통해 Humna dynamic를 이해할 수 있다?
                    * 시간에 따라 코드의 의미가 바뀔 수 있다. 여기서는 SUM 함수가 기존에는 float-point였는데, 나중에는 Generic으로 구현이 바껴서 for-loop로 구현을 안해도 되지만, 여러 이유로(maintenance cost) 그대로 남아있는 경우가 있다.
                * Specification
                    * 코드를 통해 우리는 현재 Specification에 대한 Engineer의 이해를 알 수 있다. 하지만 경계해야할 것 은 이게 실제 Specification이 아니라는 것이다.
                    * Specifications evolve together with programs and programmers. Writing a program is a process of learning—both for the programmer and the person who commissions the program.
            * Q. For-loop로 구현한 summation이나, 'A'를 1로 치환하는 예제 경우처럼 의도를 알아차리기 어려운 코드 들이있다. 어떻게 하면 이를 보완할 수 있을까? 나중에 독자를 위해 도움이 되게 할 수 있을까? 팀에서 이를 위해 실제로 실천하는 방안이 있나요?
    * What Makes a Good Program?
        * Note
            * 어떤 프로그램이 좋은 프로그램인가? Specification을 지키고, 일정 안에 Deliver할 수 있으면서, 쉽게 변황 맞게 수정하기 쉬워야하고, 효율적으로 문제를 푸는 프로그램.
                * 이 세상에 존재하지 않는다.
            * 사용자가 돈을 주고 사용하는 프로그램이 좋은 프로그램의 정의가 아닐까? 그러면 어떤 프로그램을 돈을 주고 살 정도로 만족할까?
                * 사용자에게 돈을 주고 살 가치를 주는 프로그램
        * Specification
            * 정확성이 중요하다.
                * Requirement에 정확성이 중요하지 않을 수 있다.
                * C. 정확성의 정의가 뭘까? 요구사항을 정확하게 맞춘다는 의미일까?
            * C. 가끔은 Specification이 서로 모순되는 경우가 있다. 이럴 때 어떻게 trade-off를 맞춰야할까?
            * "If a program doesn't work, measures of efficiency, of adaptability, or of cost of production have no meaning."
                * C. Efficiency, cost of production도 비슷하게 적용되지 않나... 요구사항은 맞추는데 너무 속도가 느리면? 너무 비용이 많이 들면?
        * Schedule
            * 일정은 언제나 중요하다. 기회의 창.
        * Adaptability
            * ChatGPT가 설명하는 Fisher's Fundamental Theorem
                * 자연선택은 유전적 변이성이 있는 특성에 대해 평균 적합도(생존 및 번식 성공)를 증가시킨다
                * C. 책의 설명 적응도를 떨어트린다는 해석은 조금 비약.. 일 수 있을 것 같다는 생각이 듭니다.
            * C. Generalization vs Specialization의 차이를 이야기 하는 챕터로 보인다.
        * Efficiency
            * Efficiency가 여러가지 의미로 해석 될 수 있는 부분을 강조하는 듯 하다.
            * Q. 절대적인 척도가 없다는 것에는 동의하지만, 실제 저희가 푸는 문제에 대해서는 비교할 때 사용할 수 있는 척도가 존재한다고 생각합니다. 다들 어떻게 생각하시나요? 책에서는 이건 아니다 저건 아니다 이런 표현들이 많아서 오히려 반감이 들 때도 있네요.
    * How Can We Study Programming?
        * Introspection
            * 한글 번역본에서는 내성법이라고 언급했지만, 난 자기 성찰이라는 표현이 더 적절하다고 생각한다.
            * ChatGPT가 설명하는 introspection
                * 심리학에서의 "introspection(내성 검토)"은 인간의 내부 경험, 생각, 감정 및 인식 과정을 주관적으로 관찰하고 기록하는 과학적 방법 또는 기술을 가리키는 용어입니다. 
            * 방향을 잡기위해 쓰는 것
        * Observation
            * Introspection이 방향을 바탕으로 해당 이론이나, 법칙이 어디까지 적용될 수 있는 것인가 검증하고, 확인하기 위해 관찰이 필요하다.
            * 원문
                * One way to follow up introspection is by observation of what people actually do, as opposed to what they think they do.
            * 하지만 여러가지 어려움이 있다.
                * One of the problems with observation, however, is that it tells us what people do, but not necessarily what they can do.
                    * 사람들이 어떤걸 하는지만 알 수 있지, 어떤 선택지가 있는지 알려주지 않는다. 	(e.g. 6중첩 괄호를 사용할 수 있는지)
                * A second problem with observation is deciding just what it is we are observing.
                    * 무엇을 관찰할지 결정하는 것. 관찰하려는 상황의 context에 따라서 Observation으로 도출할 수 있는 결론의 범위와 의미가 달라진다.
                * A third problem with observation is the problem of interference of the observer with the subject being observed—a kind of Uncertainty Principle.
                    * Hawthorne Effect
                        * "Hawthorne Effect(호손 효과)"는 사회과학 및 경영학 분야에서 사용되는 용어로, 연구 대상자나 직원들이 연구나 감시를 받을 때 그들의 행동이 개선되거나 변화하는 현상을 가리킵니다. 이러한 효과는 대상자가 자신을 관찰하거나 주목받는다는 인식하면, 그들이 더 나은 성과를 내려고 노력하거나 더 긍정적으로 나타날 가능성이 높아진다는 가정에 근거합니다.
        * Experiment
            * 관찰에서 발생하는 데이터의 처리 비용을 줄이기 위해 실험을 이용할 수 있다.
            * C. 뭔가 어떻게 실험을 하면 안된다라는 의미가 대부분이라 머리속에 들어오진 않는다.
        * Psychology measurement
            * 뭔가 심리학에서 사용하는 척도를 그대로 사용할 수 없다. 라는 내용으로 읽힙니다.
        * Using behavioral science data
            * 기본의 데이터가 맞는건 없지만, 인류학 정도가 적용될 수 있을 것 같다?
        * C. 이번 챕터는 전반적으로 앞부분 빼고 뒷부분은 이래서 어렵다 저래서 어렵다라고 하는 넋두리 느낌이 들었습니다. 뭔가 방향성을 제안하는 부분이 적어보여서 아쉽네요.