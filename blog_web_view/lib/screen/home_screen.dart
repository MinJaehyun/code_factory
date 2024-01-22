import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isWebView = false;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            // CircularProgressIndicator();
          },
          // onPageStarted: (String url) {},
          // onPageFinished: (String url) {},
          // onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'blog web view',
          style: TextStyle(color: Colors.white),
        ),
        // centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // 웹뷰 작동
                // isWebView = false; 를 home 버튼 클리하면 true로 변경하기
                setState(
                  () {
                    isWebView = true;
                  },
                );
              },
              icon: Icon(Icons.home_filled),
              color: Colors.white),
          IconButton(onPressed: (){
            // 뒤로 가려면?
            controller.goBack();// canGoBack();
          }, icon: Icon(Icons.arrow_back)),
          IconButton(onPressed: (){
            // 앞으로 가려면?
            controller.goForward();
          }, icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: isWebView == true
          ? WebViewWidget(controller: controller)
          : Center(
              child: Text(
                'home screen',
                style: TextStyle(fontSize: 30),
              ),
            ),
    );
  }
}
