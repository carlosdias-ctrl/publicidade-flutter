import 'package:flutter/material.dart';
import 'package:publicidade/constants/colors.dart';
import 'package:publicidade/controller/usuario_provider.dart';
import 'package:publicidade/models/usuario.dart';
import 'package:publicidade/views/build_usuarios.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    final usuario = ModalRoute.of(context).settings.arguments;
    print(usuario);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: CustomColors().getCustomGradient(),
              ),
              padding: EdgeInsets.only(top: 290),
              height: 835,
              width: double.infinity,
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  ),
                ),
                // child: Center(
                //   child: Container(
                //     color: Colors.grey,
                //     height: 350,
                //     width: 350,
                //   ),
                // ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/imagens/whats.png'),
                            ),
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 40,
                          width: 350,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/imagens/instagram.png'),
                            ),
                            color: Colors.purple[900],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 40,
                          width: 350,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/imagens/facebook.png'),
                            ),
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 40,
                          width: 350,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/imagens/envelope.png'),
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 35,
                          width: 350,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 135, left: 11),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imagens/elite.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 135,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130, left: 165),
              child: Card(
                color: Colors.transparent,
                elevation: 0.0,
                child: ListTile(
                  title: Text(
                    'Exemplo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'commissioner',
                    ),
                  ),
                  subtitle: Text(
                    '0.0 Km',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'commissioner',
                    ),
                  ),
                  trailing: Text(
                    '8.7',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'commissioner',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 210, left: 185),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 30,
                  width: 90,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'maps');
                    },
                    child: Text(
                      'ROTA',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'commissioner',
                          fontStyle: FontStyle.italic),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: RaisedButton(
                color: Colors.transparent,
                elevation: 0.0,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
