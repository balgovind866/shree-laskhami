import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import the loader package // Assuming your Loaders widget is in a separate file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final WebViewController controller;
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Optionally update loading progress
            setState(() {
              isLoading = progress < 100; // Show loader if progress < 100
            });
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true; // Show loader when page starts loading
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false; // Hide loader when page finishes loading
            });
          },
          onHttpError: (HttpResponseError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent; // Prevent certain URLs from loading
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://shreesamrajyalakshmifoundation.org'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            WebViewWidget(controller: controller), // The WebView
            if (isLoading)
              Center(
                child: SpinKitFadingFour(

                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.grey : Colors.black,
                      ),
                    );
                  },
                ),// Show the loader while loading
              ),
          ],
        ),
      ),
    );
  }
}

