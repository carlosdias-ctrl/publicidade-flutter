import 'package:flutter/material.dart';
import 'package:publicidade/constants/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _mailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
        decoration: BoxDecoration(color: Colors.grey[500]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                ),
                child: Image.asset(
                  "assets/imagens/login.png",
                  height: 130,
                ),
              ),
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mailController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _senhaController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Recuperar Senha',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              RaisedButton(
                onPressed: () {
                  //_doLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: CustomColors().getActivePrimaryButtomColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 55,
                    width: 60,
                    child: RaisedButton(
                      onPressed: () {
                        //_doLogin();
                      },
                      child: Image(
                          image: AssetImage('assets/imagens/facebook.png')),
                      color: CustomColors().getActivePrimaryButtomColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 60,
                    child: RaisedButton(
                      onPressed: () {},
                      child:
                          Image(image: AssetImage('assets/imagens/google.png')),
                      color: CustomColors().getActiveSecondaryButtomColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "cadastro");
                  },
                  child: Text('Cadastre-se'),
                  color: CustomColors().getActiveSecondaryButtomColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
