# digital_random_dice

## 흐름 
![스크린샷 2024-01-26 오후 9.32.13.png](asset%2Fimg%2F%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202024-01-26%20%EC%98%A4%ED%9B%84%209.32.13.png)

##  
    1. 문제점: TabBar 와 TabVarView api는 존재하는데, TabVarView를 다른 것과 연결하는 자료가 많지 않다.
    - 탭바와 탭바뷰를 연결하려면 DefalutController 내에 탭바와 탭바뷰를 넣어 설정하거나, TabController를 두 곳에 설정하여 연결하면 된다.
    - 그러나 탭바뷰를 다른 것(예: bottomNavigation)과 연결하려면, TabController를 두 곳에 설정하여 index를 연결해야 한다.

    2. https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
    - 내용보면 TabVar 사용하지 않고, setState로 index 변경하여 화면 띄울 수 있다.


## 개선할 점:
- [ ] stf, stl 구조 확인하기
- [ ] const 붙이기
- [ ] todo 해결하기
