## 3. The Basic Tools

## Discussions

사실 이번 챕터는 개발하시는 분들이라면 다 겪어 보고 경험해서 아는 내용이 좀 많은 챕터라고 생각합니다.

저는 여기서 특히 디버깅에 대한 얘기를 해보고 싶습니다.

언젠가 블로그 글에서 어떤 시니어 개발자 분이 이런 얘기를 했던게 기억이 납니다.

"대학에서 컴퓨터에 관한 기초 지식은 잘 가르치면서, 왜 디버깅 하는 방법에 대해서는 소홀히 하는가?"

였습니다.

저는 다행히 학교 다닐때 좋은 교수님을 만나서 디버깅 하는 방법에 대해 조금 익힐 수 있었고, 실무에서도 디버깅 하는 걸 어려워 하지는 않았습니다.

다들 자신만의 디버깅 방식이 있을 텐데요.
print해서 하는 디버깅 외에 **내가 즐겨서 하는 디버깅 방법이 있고 이건 좋은 방법이라서 알려줄 수 있다!** 하시는 게 있으면 공유해 보면 좋겠습니다.

저는 C, C++ 할 떄 부터 익혔던 방법인데 디버깅 중에 변수의 값을 바꿔서 원하는 방식으로 다음 코드를 실행할 수 있는 기법이 있어서 매우 유용하게 사용합니다.

---

많은 신참 프로그래머가 예컨대 특정 통합 개발 환경IDE 같은 강력한 도구 하나만 고집하는 실수를 저지르고, 그 익숙한 인터페이스에서 떠날 생각을 하지 않는다. 정말로 안타깝다.

### Topic 16 The Power of Plain Text

일반 텍스트는 데이터 그 자체만으로 의미가 드러나는 데이터를 만들 수 있다.
즉, 데이터가 데이터를 만드는 애플리케이션에 독립적이다.

#### WHAT IS PLAIN TEXT?

우리가 만드는 일반 텍스트는 사람이 **이해할 수 있어야** 한다.

> Tip 25 Keep Knowledge in Plain Text

#### THE POWER OF TEXT

##### Insurance Against Obsolescence

**사람이 읽을 수 있는 것**과 **사람이 이해할 수 있는 것**의 차이

< FIELD10 >011-123-4567< /FIELD10 >

휴대 전화번호의 형식만 파악하면 자료 추출 가능

<휴대전화번호>011-123-4567</휴대전화번호>

이런 형태라면 자료를 만들어낸 애초의 프로젝트 보다 훨씬 더 오래 살아남을 것.

##### Leverage (기존 도구의 활용)

diff나 fc 같은 파일 비교 도구를 통해 변경 사항 확인
sum으로는 체크섬을 생성해서 파일이 악의적으로 변경되지는 않는지 감시 가능

```
확인)
fc에 대해서 찾아보니 fix command의 약자로 unix 시스템에서 최근 입력한 명령어가 뭔지 보여주는 명령어이다.
fc -l 하면 최근 16개를 보여줌
```

![image](https://user-images.githubusercontent.com/17442457/165288104-00e6df20-06c6-4213-9dbe-0d8ae76f8315.png)

##### Easier Testing

시스템 테스트에 사용할 합성 데이터를 일반 텍스트로 표현하면 **특별한 도구를 만들 필요 없이** 간단하게 테스트 데이터를 추가하거나 수정할 수 있다.

#### LOWEST COMMON DENOMINATOR (최소 공통 분모)

다양한 시스템이 섞인 환경에서는 일반 텍스트의 장점이 다른 모든 단점을 보상하고도 남는다.

#### CHALLENGES

- Design a small address book database (name, phone number, and so on) using a straightforward binary representation in your language of choice. Do this before reading the rest of this challenge.

```
답변)
이미 문제를 다 봐버려서... 일반적으로 json으로 표현할 것 같고 다음과 같이 적을 수 있을 것이다.
```

``` json
{
    "users": [
        { "name": "Jongfeel", "PhoneNumber": "010-2057-5582" },
        { "name": "Joseph-Cha", "PhoneNumber": "010-xxxx-xxxx" }
    ]
}
```
  - Translate that format into a plain-text format using XML or JSON.

```
답변)
이미 json으로 표현함.
```

  - For each version, add a new, variable-length field called directions in which you might enter directions to each person’s house.

``` json
{
    "users": [
        { "name": "Jongfeel", "phoneNumber": "010-2057-5582", "Directions": "공항철도 청라국제도시역에서 701번 버스 탑승 후 청라호수공원역에서 하차" },
        { "name": "Joseph-Cha", "phoneNumber": "010-xxxx-xxxx", "Directions": "안드로메다에서 개념을 찾고, 우주의 원리를 깨달은 후에 눈을 뜸" }
    ]
}
```

What issues come up regarding versioning and extensibility? Which form was easier to modify? What about converting existing data?

```
답변)
json 포맷이 이런 데이터를 표현하는데 어려움이 없으므로 확장성 문제는 없다.
json 포맷이 익숙하므로 json 포맷이 수정이 용이하다.
기존 데이터 변환 역시 쉬운 편이다.
```

### Topic 17 Shell Games

CUI는 텍스트를 가지고 노는데 훌륭한 도구이다.
GUI 환경의 기능은 일반적으로 설계자가 의도한 범위를 넘어설 수 없다

> Tip 26 Use the Power of Command Shells

#### A SHELL OF YOUR OWN

터미널 프로그램의 설정 바꾸기

- 색깔 조합 설정
- 프롬프트 설정
- 별칭(alias)과 셸 함수
- 명령어 자동 완성

#### CHALLENGES

- Are there things that you’re currently doing manually in a GUI? Do you ever pass instructions to colleagues that involve a number of individual “click this button,” “select this item” steps? Could these be automated?

```
답변)
일반적으로는 그런 방식으로 얘기해 주는데 맞다. 하지만 빌드 스크립트나 cui에서 할 수 있는 거라면 그렇게 알려지기도 한다. 대표적인 예가 GitHub cli인 gh 명령이 있다
```

- Whenever you move to a new environment, make a point of finding out what shells are available. See if you can bring your current shell with you.

```
답변)
내가 개발하는 환경은 유니티를 제외 하고는 거의 shell 환경에서 작업이 가능하다
```

- Investigate alternatives to your current shell. If you come across a problem your shell can’t address, see if an alternative shell would cope better.

```
답변)
Windows의 경우는 WSL2(Windows Subsystem for Linux)도 있고 power shell도 있어서 대안이 있긴 하다
```

### Topic 18 Power Editing

에디터에 유창해지는 것의 가장 큰 이점은 더는 에디터 사용 방법을 생각하지 않아도 된다는 것이다

> Tip 27 Achieve Editor Fluency

#### WHAT DOES "FLUENT" MEAN?

답변)
12개 중에 8개를 하고 있다. 아주 유창하지는 않지만 아주 못쓰는 것도 아닌 그런 상태인 것 같다.
그리고 마우스 안쓰고 에디터 쓰는 건 가능하지만 작업 효율성이 매우 높지는 않을 것 같다

#### MOVING TOWARD FLUENCY

에디터를 쓰면서 같은 작업을 반복해서 하고 있다면 더 나은 방법이 있는지 찾고 익숙해지자.

##### Growing Your Editor

에디터에서 확장 기능을 사용할 수 있는 방법을 찾고 적용해보기.

#### CHALLENGES

- No more autorepeat.
Everyone does it: you need to delete the last word you typed, so you press down on backspace and wait for autorepeat to kick in. In fact, we bet that your brain has done this so much that you can judge pretty much exactly when to release the key. So turn off autorepeat, and instead learn the key sequences to move, select, and delete by characters, words, lines, and blocks.

```
답변)
Ctrl키를 누르면서 단어 단위로 이동 하는 기능은 유용하게 사용중이다 
```

- This one is going to hurt.
Lose the mouse/trackpad. For one whole week, edit using just the keyboard. You’ll discover a bunch of stuff that you can’t do without pointing and clicking, so now’s the time to learn. Keep notes (we recommend going old-school and using pencil and paper) of the key sequences you learn.
You’ll take a productivity hit for a few days. But, as you learn to do stuff without moving your hands away from the home position, you’ll find that your editing becomes faster and more fluent than it ever was in the past.

```
답변)
우분투 서버에서 CLI만 사용해야 하는 환경이라면 모를까 상당히 불편함이 느껴질 것 같다
```

- Look for integrations. While writing this chapter, Dave wondered if he could preview the final layout (a PDF file) in an editor buffer. One download later, the layout is sitting alongside the original text, all in the editor. Keep a list of things you’d like to bring into your editor, then look for them.

```
답변)
미리보기 기능 같은 건데 markdown 문서 작성할 때 미리보기 사용 중이긴 하다
```

- Somewhat more ambitiously, if you can’t find a plugin or extension that does what you want, write one. Andy is fond of making custom, local file-based Wiki plugins for his favorite editors. If you can’t find it, build it!

```
답변)
이렇게 하고 싶다는 생각은 있지만 실천하기는 쉽지 않아 보인다
은퇴 후 취미로 한다면 할 수 있을 것도 같다
```

### Topic 19 Version Control

버전관리 시스템은 일종의 거대한 실행 취소 키와 같다

#### IT STARTS AT THE SOURCE

버전 관리 시스템이 있으면 **소프트웨어의 이전 버전으로 언제든지 되돌아갈 수 있다.**

> Tip 28 Always Use Version Control

#### BRANCHING OUT

브랜치가 팀의 프로젝트 업무 흐름에서 핵심이 되는 경우가 많다. 문제가 생기면 해결책을 찾아보자.

#### VERSION CONTROL AS A PROJECT HUB

특정 브랜치에 push 하면 시스템을 빌드하고, 테스트를 수행한 다음, 테스트가 성공하면 새로운 코드를 서비스에 배포한다.

#### CHALLENGES

- Knowing you can roll back to any previous state using the VCS is one thing, but can you actually do it? Do you know the commands to do it properly? Learn them now, not when disaster strikes and you’re under pressure.

```
답변)
사실 롤백 하는 명령은 아는데 많이 사용할 일은 없다.
그래서 안전하게 롤백하는 명령에 대해서는 정확하게 인식하지는 못한다. (git reset --hard 명령어가 아닌 것만 안다)
나의 경우는 롤백 조차도 commit을 만들어서 롤백 그 차체로 commit log를 만드는 방법을 선호하기에, 롤백 명령을 실제 많이 쓰지 않는다.
```

- Spend some time thinking about recovering your own laptop environment in case of a disaster. What would you need to recover? Many of the things you need are just text files. If they’re not in a VCS (hosted off your laptop), find a way to add them. Then think about the other stuff: installed applications, system configuration, and so on. How can you express all that stuff in text files so it, too, can be saved?
An interesting experiment, once you’ve made some progress, is to find an old computer you no longer use and see if your new system can be used to set it up.

```
답변)
사실 일반적인 파일 관리는 버전 관리 툴을 쓰는 것 보다는 cloud drive를 사용하는 것이 더 좋다고 생각한다.
내가 개발하는 툴의 경우 설치 하는 방법을 알고 있고 필요할 때 마다 설치가 가능하다.
```

- Consciously explore the features of your current VCS and hosting provider that you’re not using. If your team isn’t using feature branches, experiment with introducing them. The same with pull/merge requests. Continuous integration. Build pipelines. Even continuous deployment. Look into the team communication tools, too: wikis, Kanban boards, and the like.
You don’t have to use any of it. But you do need to know what it does so you can make that decision.

```
답변)
여기 나열된 도구와 의미를 잘 알고 있고 사용도 해보기도 했다.
```

- Use version control for nonproject things, too.

```
답변)
좁은 의미의 프로젝트가 소프트웨어 개발 프로젝트라면
책 읽고 정리하는 프로젝트 역시 github를 쓰고 문서만 관리하고 있으므로
마지막 도전 과제는 달성한 성과라고 볼 수 있다.
```

### Topic 20 Debugging

소프트웨어 결함은 요구 사항을 오해하는 것부터 코딩 오류에 이르기까지 여러 모습으로 나타난다.
아무도 완벽한 소프트웨어를 작성하지 못하므로 하루 대부분을 디버깅으로 보낼 것이라는 건 기정사실이다.

#### PSYCHOLOGY OF DEBUGGING

디버깅은 단지 **문제 풀이**일 뿐이라는 사실을 받아들이고, 그런 마음으로 공략하라.

> Tip 29 Fix the Problem, Not the Blame

#### A DEBUGGING MINDSET

Tip 30의 디버깅의 제1법칙을 기억하자

> Tip 30 Don’t Panic

버그라고 생각하는 증상의 원인이 무엇일지 진짜로 **생각**해 보는 것이 정말 중요하다.
겉으로 보이는 특정한 증상만 고치려고 하지 말고, 항상 문제의 근본 원인을 찾으려고 노력하라.

#### WHERE TO START (실마리 찾기)

버그를 **살펴보기 전에** 일단 작업 중인 코드가 경고 없이 깨끗하게 빌드되는지 부터 확인하라.
어떤 문제건 해결을 하려면 관련 자료를 모두 모아야 한다.

#### DEBUGGING STRATEGIES

##### Reproducing Bugs

버그를 재현할 수 없다면 어떻게 그 버그를 고쳤다는 것을 확인할 수 있겠는가?

> Tip 31 Failing Test Before Fixing Code

버그가 발생하는 상황을 다른 것들로 부터 분리하다 보면 어떻게 고쳐야 할지에 대한 통찰을 얻기도 한다.
테스트를 작성하는 행위가 해결책을 알려주는 것이다.

#### CODER IN A STRANGE LAND

문제가 무엇인지를 봐야 한다. Tip32를 주목하자.

> Tip 32 Read the Damn Error Message

##### Bad Results

결과가 이상한 상황이라면, 디버거를 붙여서 실패하는 테스트를 이용하여 문제를 재현하라.

##### Sensitivity to Input Values

입력 데이터 세트에서 부터 시작해서 프로그램이 죽는다면, 이진 분할을 활용해서 어떤 입력값이 범인인지 찾아내자.

##### Regressions Across Releases (릴리스 사이에서 발생한 문제)

어떤 변경 사항으로 인해 버그가 발생했는지 알아낼 수 있다면? 이진분할을 해봐야 함

#### THE BINARY CHOP (이진 분할)

활용 방안

- 거대한 스택 트레이스
- 특정 데이터 세트
- 현재 릴리스와 예전 릴리스 사이의 버그 찾기

##### Logging and/or Tracing

디버거는 일반적으로 프로그램의 **현재** 상태에 주목한다.
트레이싱(tracing) 구문은 작은 진단용(diagnostic) 메시지로, 디버거가 진단할 수 없는 몇 가지 종류의 오류를 진단하는 데에는 매우 효과적이다.

##### Rubber Ducking

누군가에게 문제를 설명하게 되면 혼자 코드를 살펴볼 때는 당연히 여기고 지나갈 것을 명시적으로 이야기해야 한다.
이런 가정 몇 가지를 입 밖에 내면, 문제에 대한 새로운 통찰을 불현듯이 얻을 수도 있다.

##### Process of Elimination (소거법)

OS나 컴파일러, 외부 제품의 문제라기 보다는
개발하고 있는 애플리케이션 코드에 버그가 존재할 가능성이 훨씬 더 크다.

한 고참 개발자의 select 시스템 콜 탓을 했던 일화.
결국 시스템 문제가 아니라 사용했던 사람의 잘못
그 이후로 그 사건을 떠올리도록 'select가 망가졌어' 라는 표현을 사용한다.
(여기까지 Tip 33이 의미하는 바를 설명하기 위함)

> Tip 33 "select" Isn’t Broken

#### THE ELEMENT OF SURPRISE

버그와 관련된 루틴이나 코드가 제대로 작동하는 걸 '안다'고 해서 대충 얼버무리고 지나치지 말라. 그것을 증명하라.
**이 맥락** 안에서, **이 데이터**로, **이 경계 조건**하에서 증명하라.

> Tip 34 Don’t Assume It - Prove It

**어떤 일이 일어났든지 간에** 똑같은 일이 다시 발생하면 그 사실을 알 수 있도록 하라.
이 버그를 고치는 데 시간이 오래 걸린다면 왜 그런지 자문하라.
버그가 누군가의 잘못된 가정으로 발생했다면 이 문제를 전체 팀과 함께 토론하라. 한 사람이 오해했다면 다른 사람들도 그럴 수 있다.

#### DEBUGGING CHECKLIST

- 보고된 문제가 내재하는 버그의 직접적 결과인가 아니면 단순히 증상일 뿐인가?
- 버그가 정말로 여러분이 사용하는 프레임워크에 있나? OS에? 아니면 여러분 코드에 있나?
- 의신 가는 코드가 단위 테스트를 통과한다면 테스트는 충분히 갖춰진 것인가? **이 데이터**로 테스트를 돌리면 무슨 일이 생기는가?
- 이 버그를 야기한 조건이 시스템의 다른 곳에도 존재하는가? 다른 버그가 유충 단계에서 성충이 될 날만 기다리고 있는 것은 아닌가?

#### CHALLENGES

Debugging is challenge enough.

```
답변)
감사합니다!
```

### Topic 21 Text Manipulation

> Tip 35 Learn a Text Manipulation Language

이 책을 쓰기 위해 만든 루비와 파이썬 프로그램들.

- _Building the Book_
  - 빌드 시스템을 루비로 작성
- _Code inclusion and highlighting_
  - 루비로 소스 파일의 지정된 부분을 발췌하고, 구문 강조를 거친 다음, 조판 언어로 변환
- _Website update_
  - 책을 일부만 빌드해서, 목차를 추출한 다음, 웹사이트에 있는 해당 책 페이지에 업로드 
- _Including equations_
  - LaTex markup을 수식으로 바꾸는 파이썬 스크립트
- _Index generation_
  - 루비 스크립트로 찾아보기 목록 생성

#### EXERCISES

##### Exercise 11

You’re rewriting an application that used to use YAML as a configuration language. Your company has now standardized on
JSON, so you have a bunch of .yaml files that need to be turned into .json. Write a script that takes a directory and converts each .yaml file into a corresponding .json file (so database.yaml becomes database.json, and the contents are valid JSON).

```
답변)
parse 스크립트를 한번 짜 보는 것도 재미있을 것 같긴 한데,
검색해 보니까 변환 툴이 있다!
https://onlineyamltools.com/convert-yaml-to-json
```

##### Exercise 12

Your team initially chose to use camelCase names for variables, but then changed their collective mind and switched to
snake_case. Write a script that scans all the source files for camelCase names and reports on them.

```
답변)
이것도 왠지 정규식 사용하면 금방 될 거 같긴 한데,
검색해 보니까 이것도 역시 변환 툴이 있다!
https://appdevtools.com/case-converter
```

##### Exercise 13

Following on from the previous exercise, add the ability to change those variable names automatically in one or more files.
Remember to keep a backup of the originals in case something goes horribly, horribly wrong.

```
답변)
그런데 여러 파일에 동시에 적용하려면 IDE 편집 툴 써야 할 것 같다.
그러면 금방 변환 가능할 듯.
그리고 검색하면 stack overflow에 답변이 있다!
https://stackoverflow.com/questions/43768435/all-text-from-camelcase-to-snake-case
```

### Topic 22 Engineering Daybooks

일지를 쓰면 좋은 점 세가지

- 기억보다 더 믿을 만하다
- 진행 중인 작업과 직접적인 관계가 없는 발상을 일단 쌓아 놓을 수 있는 곳이 생긴다
- 무언가를 쓰기 위해 하던 일을 멈추면 뇌도 기어를 바꾼다.

파일이나 위키말고 종이를 사용하라. 글씨를 쓰는 것은 키보드를 두드리는 것과는 다른 무언가 특별한 것이 있다. 일단 한 달만 써 보고 어떤 이득을 얻었는지 살펴보라.