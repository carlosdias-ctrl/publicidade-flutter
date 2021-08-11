import 'package:flutter/material.dart';
import 'package:publicidade/constants/colors.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassWord = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 95),
        decoration: BoxDecoration(color: Colors.grey[400]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastre-se',
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
                  children: <Widget>[
                    TextFormField(
                      controller: _nameInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
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
                      controller: _mailInputController,
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
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      style: TextStyle(color: Colors.white),
                      obscureText: (this.showPassWord == true) ? false : true,
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
                    ),
                    TextFormField(
                      controller: _confirmInputController,
                      style: TextStyle(color: Colors.white),
                      obscureText: (this.showPassWord == true) ? false : true,
                      decoration: InputDecoration(
                        labelText: "Confirmar Senha",
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
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassWord,
                          onChanged: (bool newValue) {
                            setState(
                              () {
                                this.showPassWord = newValue;
                              },
                            );
                          },
                        ),
                        Text(
                          'Mostrar Senha',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    //_doSingUP();
                    Navigator.pop(context);
                  },
                  child: Text('Cadastrar'),
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
