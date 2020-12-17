import 'package:flutter/material.dart';
import 'Login.dart';
import 'Register.dart';
import 'color_hex.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
              height: 90.0,
            ),
            Image(
              image: AssetImage('assets/logo.png'),
              width: 300,
              height: 200,
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, //elemanların hem arasında hemde diğer taraflarında ayarlı boşluklar oluşturuyor.

                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius:
                                18.0, //yükseldikçe değer fluluk azalıyor.
                            color: Colors.black,
                            offset: Offset(2.0, 4.0), //(sağa , alta)
                          ),
                        ],
                        fontSize: 20.0,
                        color: FlutterColor("#000000"),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius:
                                20.0, //yükseldikçe değer fluluk azalıyor.
                            color: Colors.black,
                            offset: Offset(2.0, 4.0), //(sağa , alta)
                          ),
                        ],
                        fontSize: 20.0,
                        color: FlutterColor(
                            "#000000"), //color: Color(0xFFFFF8E1 şeklinde de oluyor.
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, //elemanların hem arasında hemde diğer taraflarında ayarlı boşluklar oluşturuyor.
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      size: 40.0,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      size: 40.0,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      FontAwesomeIcons.twitter,
                      size: 40.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*child: Text(
          "Leyo Planner",
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              color: Colors.white60),
        ),*/
