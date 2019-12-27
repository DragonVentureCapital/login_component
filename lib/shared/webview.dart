import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/text_styles.dart';


class WebView extends StatefulWidget {
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  var _stackIdx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_BASE,
        title: Text(
          'Andy - Termos e Condições',
          style: Styles.title,
        ),
      ),
      body: _webView(),
    );
  }

  _webView() {
    return IndexedStack(
      index: _stackIdx,
      children: <Widget>[
        Column(
          children: <Widget>[
//            Expanded(
//              child: WebView(
//                initialUrl: url,
//                javascriptMode: JavascriptMode.unrestricted,
//                onPageFinished: _onPageFinished,
//              ),
//            )
          ],
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(COLOR_BASE),
            ),
          ),
        )
      ],
    );
  }

}
