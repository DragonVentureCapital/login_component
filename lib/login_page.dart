import 'package:login_component/login_component.dart';
import 'package:flutter/material.dart';
import 'package:login_component/widgets/card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_classes/custom_base_page.dart';
import 'container_labels.dart';
import 'login_bloc.dart';
import 'resources/colors.dart';


class LoginPage extends CustomBasePage {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> with BasicPage, TickerProviderStateMixin {
  final _loginBloc = LoginBloc();

  Animation<Offset> animation;
  AnimationController animationController;
  bool opacityForCard;

  @override
  void initState() {
    super.initState();
    _animationModule();
    _startModule();
  }

  _animationModule(){
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    animation = Tween<Offset>(begin: Offset(0, -1.2), end: Offset(0, 0))
        .animate(animationController)
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed)
          setState(() {
            opacityForCard = true;
          });
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: COLOR_BASE,
      body: SingleChildScrollView(child: _pageViewModule()),
    );
  }

  _startModule() {
    SharedPreferences.getInstance().then((prefs) {
      print(prefs.getString("token"));
    });
    _loginBloc.outState.listen((state) {});
  }

  _loginView() {
    return AnimatedOpacity(
      opacity: opacityForCard == true ? 1 : 0,
      curve: Curves.ease,
      duration: Duration(milliseconds: 400),
     child: _cardModule(LoginView()) ,
    );
  }

  _cardModule(page) {
    return CardWidget(color: COLOR_CUSTOM_WHITE, child: Column(
      children: <Widget>[
        _containerLabelsModule(),
        page
      ],
    ));
  }

  _pageViewModule() {
    return Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.10),
          child: Column(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional(0, 0.7),
                child: SlideTransition(
                  position: animation,
                  child: Image.asset('assets/andy_logo.png',
                      alignment: Alignment.center, height: size.height * 0.24),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _loginView()
            ],
          ),
        ));
  }

  _containerLabelsModule() {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: ContainerLabels(
        title: "Aproveite seu tempo",
        subTitle: "Aproveite a experiencia",
      ),
    );
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
