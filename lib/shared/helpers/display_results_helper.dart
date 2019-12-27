import 'package:flutter/material.dart';

class DisplayResultsHelper {
  // Necessario passar o snapshot e o onSuccess
  // ignore: avoid_init_to_null
  static Widget showError({AsyncSnapshot snapshot: null}) {
    if (snapshot == null) {
      return Container(
        height: 100,
        child: Text("Use o helper corretamente."),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/andy_face.png"),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Opa, ocorreu um erro, tente novamente.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      );
    }
  }


  static Widget showEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            child: Image.asset("assets/andy_face.png"),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Text(
              "Não ha nada para popular a lista.",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),);
    }
}
