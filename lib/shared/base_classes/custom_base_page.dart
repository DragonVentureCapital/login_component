import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_component/shared/constants/colors.dart';
import 'package:login_component/shared/helpers/decorations-helper.dart';

abstract class CustomBasePage extends StatefulWidget {
  CustomBasePage({Key key}) : super(key: key);
}

abstract class BaseState<Page extends CustomBasePage> extends State<Page> {}

mixin BasicPage<Page extends CustomBasePage> on BaseState<Page> {
  @override
  void initState() {
    super.initState();
  }

  Size size;

  showLoader() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(COLOR_BASE),
      ),
    );
  }

  showModalFullsceeen(Widget _widget) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _widget;
      },
    );
  }

  showErrorDialog(_bloc, context, message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.error,
                size: 30,
                color: Colors.red,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Atenção", textAlign: TextAlign.center),
            ],
          ),
          titleTextStyle: setTextStyle(FontWeight.bold, 20, COLOR_CUSTOM_BLACK),
          content: new Text(_bloc.errorMessage ?? "Ocorreu um erro",
              textAlign: TextAlign.left),
          contentTextStyle:
              setTextStyle(FontWeight.normal, 16, COLOR_CUSTOM_RED),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  navigateToMaterialStyle(pageThatToGo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => pageThatToGo,
        // todo - testando
        settings: RouteSettings(name: pageThatToGo.toString()),
      ),
    );
  }

  navigateToCupertinoStyle(pageThatToGo) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => pageThatToGo,
        settings: RouteSettings(name: pageThatToGo.toString()),
      ),
    );
  }

  replaceToRootPage(pageThatToGo) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => pageThatToGo),
    );
  }

  showAlertDialog(String title, String content, List<Widget> buttons) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: new Text(title),
            content: new Text(content),
            actions: buttons);
      },
    );
  }
}
