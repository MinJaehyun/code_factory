# my_table_calendar

## 문제점 및 해결
    1. 프로젝트명칭과 플러그인 명칭이 같은 경우 에러 발생하므로 프로젝트 삭제 후, 재 설치함

## todo
- [ ] 추후, analysis_options.yaml 주석 풀고 const 작성하기

# 구조
lib/const/color.dart - 주색상 구성
main.dart
 ㄴ screen/home_screen.dart - 한 페이지로 구성된 화면
  ㄴ lib/component/MainCalendar - 상단 달력
  ㄴ lib/component/TodayBanner - 달력 밑에 오늘 날짜와 todolist 개수 나타내는 배너
  ㄴ lib/component/ScheduleCard - 중단 todolist
  ㄴ lib/component/ScheduleBottomSheet - 우측 하단 add todo btn
