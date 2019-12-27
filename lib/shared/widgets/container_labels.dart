import 'package:flutter/material.dart';
import 'package:login_component/shared/constants/text_styles.dart';

class ContainerLabels extends StatelessWidget {
  final title;
  final subTitle;

  ContainerLabels({Key key, this.title, this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Styles.superTitleBaseColor,
        textAlign: TextAlign.center,
      ),
      subtitle: Text(subTitle,
          style: Styles.superTitleBaseColor,
          textAlign: TextAlign.center),
    );
  }
}
