#!/bin/bash

REVIEWERS="wooyaggo86,TaeHyoungKwon,jongfeel,jintaeyeong,hemil0102,ymkim97,aquamagic9,fkdl0048,tttghost,dhlee3994"
ASSIGNEE="@me"

# 수동으로 변경해서 사용해도 되고, 이부분을 날짜에 맞게 자동으로 수정되도록, 추후에 변경해도 됨
LABELS="2025,타입으로 견고하게 다형성으로 유연하게
탄탄한 개발을 위한 씨줄과 날줄"
MILESTONE="타입으로 견고하게 다형성으로 유연하게"

read -p "PR 제목을 입력하세요: " TITLE
read -p "PR 본문을 입력하세요: " BODY

gh pr create \
    -t "$TITLE" \
    -b "$BODY" \
    -r "$REVIEWERS" \
    -a "$ASSIGNEE" \
    -l "$LABELS" \
    -m "$MILESTONE"

if [ $? -eq 0 ]; then
    echo "PR이 성공적으로 생성되었습니다."
else
    echo "PR 생성에 실패했습니다."
fi
