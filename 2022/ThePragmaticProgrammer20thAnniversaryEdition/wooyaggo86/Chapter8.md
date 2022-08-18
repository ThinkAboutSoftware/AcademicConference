# Chapter 8. Before the Project

의논하고 싶은 사항
* 다른 분들의 여태까지 가장 어려운 문제(Impossible Puzzles)는 어떤 거였나요?

## Topic 45. The Requirements Pit
프로젝트 시작 전에 무엇을 해야할까?
Requirement를 학습해야한다.
그냥 사용자가 말하는걸 그대로 듣기만 해서는 안된다.

흥미로운 과거 이야기.
예전에는 컴퓨터를 사용하는 비용이 비쌌기 때문에, Requirement를 명확하게 하는게 비용효율적이였다. 지금은? 컴퓨터가 너무 저렴해졌다.

프로그래머로서의 우리의 직업은 사용자들이 무엇을 원하는지 이해하게 도와주는 것.
Requirement는 미리 정해져 있는게 아니라, Feedback loop를 통해 발견하고 수정해 가는 것.
사용자의 Need를 파악하자. 그러기 위해선 User의 입장에서 문제를 바라볼 수 있어야 한다.
해당 Specification이 Requirement인지, 바뀔 수 있는 Policy인지 파악하자.

예제가 너무 설명을 잘 한다.
Shipping should be free on all orders costing $50 or more.
얼마나 많은 질문을 할 수 있을까?

문서에 관한 의논.
문서는 고객이 아닌 개발자들을 위한거다. 개발자들이 자신들이 무엇을 하는지 이해하기 위한 정리.
First, as we've discussed, the client doesn't really know what they want up front.
Second, Client never read the document.

하지만 피해야 할 것. Overspecification.

Maintain a glossary.
모든 사람이 사용하는 용어에 대한 정의를 명확하게 하자.

- No One Knows Exactly What They Want.
- Programmers Help People Understand What They Want
- Requirements are learned in a Feedback Loop
- Work with a User to Think Like a User
- Policy is Metadata.
- Use Project Glossary

## Topic 46. Solving Impossible Puzzles.
어려운 문제를 풀 때 어떻게 접근해야할까?

Constraint 에 대한 이해를 강조.
엔지니어로서 바로 해법을 생각하고 싶은 유혹이 강하게 든다.
하지만, 어려운 문제일 수록. 어떤게 가능하고 어떤게 불가능한지.
"Degrees of Freedom"을 파악하는게 중요하다.

Don't Think Outside the Box - Find the box

Categorize and prioritize your contraint.
C. 여기에 추가로 문제에서 유추할 수 있는 속성이 어떤게 있는지 생각해보자.

Get Out of Your Own Way!
Sometimes you will ifnd your self working on a problem that seems much harder than you thought it should be.

feed plenty of raw material + allow time to digest the materials.

Have them ask you questions such as:
* Why are you solving this problem?
* What's the benefit of solving it?
* Are the problems you're having related to edge cases? Can you eliminate them?
* Is there a simpler, related problem you can solve?

## Topic 47. Working together
사용자와 항상 함께 일하자. + 동료화 함께 일하자.

Conway's Law
Organization which design system are constrainted to produce designs which are copies of the communication structrues of these organizations.

Mob programming tips
* Build the code, not your ego. It's not about who's brightest; we all have our moments, good and bad.
* Start small. Mob with only 4-5 people, or start with just a few pairs, in short sessions.
* Criticize the code, not the person. "Let's look at this block" sounds much better than "you're wrong."
* Listen and try to understand others' viewpoints. Different isn't wrong.
* Conduct frequent retrospectives to try and improve for next time.

Don't Go into the Code alone.

## Topic 48. The Essence of Agility
"애자일 프로세스"가 아닌 "애자일"하게 문제를 해결하자.

Agile Is Not a Noun; Agile is How You Do Things.

Remeber the values from the manifesto:
We are uncovering better ways of devloping software by doing it and helping others do it. Through this work we have com to value:
* Individuals and interactions over processes and tools
* Working software over comprehensive documentation
* Customer collaboration over contract negotiation
* Responding to change over following a plan

So what Do We Do?
1. Work out where you are
2. Make the smallest meaningful step towards where you want to be.
3. Evaluate where you end up, and fix anything you broke.
