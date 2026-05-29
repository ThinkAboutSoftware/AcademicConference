## Summary

- https://github.com/jongfeel/BookReview/issues/1661

## Review

- https://github.com/jongfeel/BookReview/issues/1661#issuecomment-4163338568

### 논의 주제

SOLID 원칙에 대한 비판의 내용은 저한테는 상당히 신선했습니다.
너무 많은 자료에서 SOLID 원칙은 신성불가침의 영역이라고 생각했었는데, 그걸 비판한 글을 출판할 수 있다는 점은
무비판 적으로 수용하는 태도를 경계하는게 좋겠다의 생각도 들게 합니다.

저자가 주장하는 SOLID 원칙의 비판 내용 중에서 공감이 되거나 아니라고 하는 부분이 있으면 얘기해 보면 재미있을 것 같습니다.

### 3.3.1 미래를 향한 경주

이 소주제의 제목이 아주 마음에 든다.
왜냐하면 나도 그렇게 느끼기 때문이다. 오래된 특정 버전, 특히 LTS에 안주하고 변화를 거부하는 건 내 성향상 맞지 않다.
미래에 더 좋은 게 나온다면 그걸 받아들이고 조금씩 업데이트를 진행해 미래가 현재가 됐을 때 동참하는게 좋은 방향이라고 본다.
한 때 "최신 버전 성애자" 라는 별명이 있었는데, 지금도 유효하다.

## 아래는 SOLID 원칙에 대해 저자의 비판적인 시각을 담은 글이다.
오랫동안 SOLID 원칙을 이해하고 있는 나에게는 확실하고 근거있는 주장 처럼 들리지는 않는다.

예) 인터페이스 분리 원칙은 사실 오래 개발해보고 단순한 설계를 지향하다 보면 이해가 되는 원칙인데 비판을 하면서도 설계 요구사항에 근거해야 한다는 이해할 수 없는 말을 하고 있다.

핵심은 이해하되 무비판적인 수용은 금물이라는 측면에서는 읽어 볼만 하고, 다소 신선한 주장으로 여겨진다.
분명 로버트 마틴의 빠돌(빠순)이 들에게 있어서는 오히려 비판적인 시각이 생기기도 할 것이다.

### On SOLID principles

There is a famous acronym, SOLID, that stands for five principles of object-oriented programming.
The problem is that SOLID feels like it was invented to make a meaningful word rather than to make us better programmers. 
I don’t think all its principles carry the same importance, and some may not matter at all.
I strongly oppose embracing a set of principles without being convinced of their value.

The single-responsibility principle, the S of SOLID, says a class should be responsible for one thing only as opposed to one class doing multiple things, aka God classes.
That’s a bit vague because it’s we who define what one thing entails. Can we say a class with two methods is still responsible for one thing anymore?
Even a God class is responsible for one thing at a certain level: being a God class.
I’d replace this with the clear-name principle: the name of a class should explain its function with as little vagueness as possible.
If the name is too long or too vague, the class needs to be split into multiple classes.

The open-closed principle states that a class should be open for extension but closed for modification.
It means that we should design our classes so that their behavior can be modified externally.
This is, again, very vague and can even be unnecessarily time consuming.
Extensibility is a design decision and may not be desirable, practical, or even safe at times. It feels like the advice to “use the racing tires” of programming. 
I would instead say, “Treat extensibility as a feature.”

The Liskov substitution principle, coined by Barbara Liskov, states that a program’s behavior shouldn’t change if one of the classes used is replaced with a derived class.
Although the advice is sound, I don’t think it matters in daily programming work.
It feels like the advice “Don’t have bugs” to me.
If you break an interface’s contract, the program will have bugs.
If you design a bad interface, the program will also have bugs.
That’s the natural order of things.
Perhaps this can be turned into simpler and more actionable advice like “Stick to the contract.”

The interface segregation principle favors smaller and goal-specific interfaces over generalized, broadly scoped interfaces.
This is unnecessarily complicated and vague, if not just plain wrong, advice.
There could be cases where broadly scoped interfaces are more suitable for the job, and overly granular interfaces can create too much overhead.
Splitting interfaces shouldn’t be based on scope, but on the actual requirements of the design.
If a single interface isn’t suitable for the job, feel free to split it, not to satisfy some granularity criteria.

The dependency inversion principle is the final one.
Again, it’s not a very good name.
Just call it depend on abstractions.
Yes, depending on concrete implementations creates tight coupling, and we’ve already seen its undesirable effects.
But that doesn’t mean you should start creating interfaces for every dependency you have.
I say the opposite: prefer depending on abstractions when you prefer flexibility and you see value in it, and depend on the concrete implementation in cases where it just doesn’t matter.
Your code should adapt to your design, not the other way around.
Feel free to experiment with different models.