# vid_player

## 흐름(위젯)
1. HomeScreen 위젯은 두 개의 위젯을 조건에 따라 하나의 화면에 나타낸다

## 문제 및 해결
1.

## 진행 상황
* 첫화면
~~1. Column 내 Image 와 Text 나타내기~~

* 두번째 화면
~~* 첫번째 화면에서 영상 선택하면, 두번째 화면에서 임시 위젯(추후 영상) 나타내기~~
* 영상 터치하면 중단에는 Stack() 내 Positioned()로 뒤로 3초가기,재생/일시정지, 앞으로 3초가기를 띄운다
* 영상 우측 상단 동영상 선택하기 아이콘을 띄운다
* 영상 하단에는 Slider() 띄운다

### 개선할 점
- [ ]

### 배운점 및 실습할 것: 여기까지 image_picker로 영상 선택하고, 클릭한 영상을 video_player 사용하여 띄우는 과정 
1. home screen 에서 body: video == null ? renderEmpty() : renderVideo(), 처리하고 Widget renderEmpty() {} 으로 가져오는 방식 배움 
2. Image 가져올 때, 기기마다 사이즈 다르므로 MediaQuery.of(context).size.width, 처리하여 넓힘
3. textStyle을 변수에 담아 가져와 사용할 수 있고, textStyle.copyWith() 사용하여 변경하고 사용할 수도 있다.
4. 그라데이션 설정 방법 배움 (메서드 또는 함수 가져올 때 명칭 앞에 get 붙이면 가독성 좋다)
5. *** STF 파일은 분리해서 사용해라.. CustomVideoPlayer 처럼 super.initState 사용하는 경우 여러 초기화 겹치면 가독성 떨어진다.
6. onTap 사용 시,  void Function() 대신 GestureTapCallback 이 가독성 더 좋다
7. 규칙 정하기: 멤버 변수 다음에 생성자 오도록!
8. note: 초깃값 설정 안하면 late null 에러 발생 하는데, 값 이렇게 설정해 괜찮은지?
   1. late VideoPlayerController _controller = VideoPlayerController.file(File(widget.video!.path));
   2. VideoPlayerController? _controller; // 이렇게 사용해라
9. 
====================================================================================