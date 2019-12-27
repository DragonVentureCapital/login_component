import 'package:flutter/material.dart';
import 'package:login_component/shared/base_classes/custom_base_page.dart';
import 'package:login_component/shared/constants/colors.dart';
import 'package:login_component/shared/enums/request-state.dart';
import 'package:login_component/shared/widgets/card_widget.dart';
import 'package:login_component/shared/widgets/container_labels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app_module.dart';
import '../login_view_module.dart';
import 'login_page_bloc.dart';


class LoginPage extends CustomBasePage {
  final logo;
  final color;
  LoginPage(this.logo, this.color);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage>
    with BasicPage, TickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController animationController;
  bool opacityForCard;
  final _loginBloc = AppModule.to.getBloc<LoginPageBloc>();

  @override
  void initState() {
    _loginBloc.outState.listen((state){
      if(state == RequestState.SUCCESS) {
        //TODO: Trazer o retorno aqui
      }
    });

    _animationModule();
    _startModule();
    super.initState();
  }

  _animationModule() {
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
      backgroundColor: widget.color,
      body: SingleChildScrollView(child: _pageViewModule()),
    );
  }

  _startModule() {
    SharedPreferences.getInstance().then((prefs) {
      print(prefs.getString("token"));
    });
  }

  _loginView() {
    return AnimatedOpacity(
      opacity: opacityForCard == true ? 1 : 0,
      curve: Curves.ease,
      duration: Duration(milliseconds: 400),
      child: _cardModule(LoginViewModule(widget.color)),
    );
  }

  _cardModule(page) {
    return CardWidget(
        color: COLOR_CUSTOM_WHITE,
        child: Column(
          children: <Widget>[_containerLabelsModule(), page],
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
                  child: widget.logo,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
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
