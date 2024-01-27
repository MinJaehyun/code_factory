# digital_random_dice

## 흐름 
![스크린샷 2024-01-26 오후 9.32.13.png](asset%2Fimg%2F%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202024-01-26%20%EC%98%A4%ED%9B%84%209.32.13.png)

## 문제점 및 해결 
    1. 문제점: TabBar 와 TabVarView api는 존재하는데, TabVarView를 다른 것과 연결하는 자료가 많지 않다.
    - 탭바와 탭바뷰를 연결하려면 DefalutController 내에 탭바와 탭바뷰를 넣어 설정하거나, TabController를 두 곳에 설정하여 연결하면 된다.
    - 그러나 탭바뷰를 다른 것(예: bottomNavigation)과 연결하려면, TabController를 두 곳에 설정하여 index를 연결해야 한다.

    2. https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
    - 내용보면 TabVar 사용하지 않고, setState로 index 변경하여 화면 띄울 수 있다.


## 개선할 점:
- [x] stf, stl 구조 확인
- [x] const 붙이기
- [ ] todo 해결

### 실행 화면
핸드폰으로 민감도 조절하여 흔들어서 주사위 변경하는 모습 
blog: https://blog.naver.com/krism01/223335420222


### 진행 상황
~~TAB 1 대신 세로로 주사위 이미지 1, 행운의 숫자, 1을 나타내기 (정적)~~
~~TAB 2는 Slider() 구현하기~~
~~1. 흔들기 설정하기 - 패키지 설치, 사용법 확인, 초기 한번 실행하기(어디에? state위치), dispose로 끄기~~
~~2. slider의 민감도 설정하기~~