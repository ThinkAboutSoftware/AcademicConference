#!/bin/bash

set -euo pipefail

REVIEWERS="TaeHyoungKwon,jongfeel,ymkim97,tttghost,dhlee3994,GeunJuLEE,benscookie,chichoon"
ASSIGNEE="@me"

PROJECT="2026 Academic Conference"

# 이부분을 수동으로 변경해서 사용
LABELS="2026,Software Architecture: The Hard Parts
소프트웨어 아키텍처: The Hard Parts, 분산 아키텍처를 위한 모던 트레이드오프 분석"
MILESTONE="Software Architecture: The Hard Parts"

# 사전 검증
check_prerequisites() {
    if ! command -v gh &> /dev/null; then
        echo "오류: GitHub CLI(gh)가 설치되어 있지 않습니다."
        echo "설치 방법: brew install gh"
        exit 1
    fi
    
    if ! git rev-parse --git-dir &> /dev/null; then
        echo "오류: Git 저장소가 아닙니다."
        exit 1
    fi
    
    if ! gh auth status &> /dev/null; then
        echo "오류: GitHub에 로그인되어 있지 않습니다."
        echo "로그인: gh auth login"
        exit 1
    fi
}

# PR 제목 입력 및 검증
get_title() {
    while true; do
        read -p "PR 제목을 입력하세요: " TITLE
        if [ -n "$TITLE" ]; then
            break
        fi
        echo "제목은 필수입니다. 다시 입력해주세요."
    done
}

# PR 본문 입력 (다중 라인 지원)
get_body() {
    echo "PR 본문을 입력하세요 (여러 줄 입력 가능, 입력 완료 후 Ctrl+D):"
    BODY=$(cat)
    
    if [ -z "$BODY" ]; then
        read -p "본문이 비어있습니다. 계속하시겠습니까? (y/N): " confirm
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            exit 0
        fi
    fi
}

# Issue 번호 입력 및 검증
get_issue_numbers() {
    read -p "연결할 Issue 번호를 입력하세요 (예: 123, 없으면 ENTER): " ISSUE_INPUT
    
    if [ -n "$ISSUE_INPUT" ]; then
        # 숫자만 허용
        if [[ "$ISSUE_INPUT" =~ ^[0-9]+$ ]]; then
            BODY="${BODY}\n\nCloses #${ISSUE_INPUT}"
        else
            echo "경고: 잘못된 형식입니다. Issue 번호는 숫자만 허용됩니다."
        fi
    fi
}

# Dry-run 미리보기
dry_run() {
    echo "=== PR 생성 미리보기 ==="
    echo "제목: $TITLE"
    echo "본문:"
    echo -e "$BODY"
    echo "리뷰어: $REVIEWERS"
    echo "담당자: $ASSIGNEE"
    echo "라벨: $LABELS"
    echo "프로젝트: $PROJECT"
    echo "마일스톤: $MILESTONE"
    echo "========================"
}

# 메인 실행
main() {
    check_prerequisites
    
    get_title
    get_body
    get_issue_numbers
    
    # Dry-run 확인
    read -p "PR을 생성하기 전에 미리보기를 보시겠습니까? (Y/n): " show_preview
    if [[ ! "$show_preview" =~ ^[Nn]$ ]]; then
        dry_run
        read -p "위 내용으로 PR을 생성하시겠습니까? (Y/n): " confirm
        if [[ "$confirm" =~ ^[Nn]$ ]]; then
            echo "PR 생성이 취소되었습니다."
            exit 0
        fi
    fi
    
    # PR 생성
    echo "PR을 생성하는 중..."
    if gh pr create \
        -t "$TITLE" \
        -b "$BODY" \
        -r "$REVIEWERS" \
        -a "$ASSIGNEE" \
        -l "$LABELS" \
        -m "$MILESTONE" \
        -p "$PROJECT"; then
        echo "✅ PR이 성공적으로 생성되었습니다."
    else
        echo "❌ PR 생성에 실패했습니다."
        exit 1
    fi
}

main
