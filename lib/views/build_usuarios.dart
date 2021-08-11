import 'package:flutter/material.dart';
import 'package:publicidade/models/usuario.dart';
import 'package:url_launcher/url_launcher.dart';

class Usuarios extends StatefulWidget {
  final UsuarioDb usuario;
  const Usuarios(this.usuario);
  @override
  _UsuariosState createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  int _stars = 0;
  _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        color: _stars >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void avaliar() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text('Avaliar'),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildStar(1),
                _buildStar(2),
                _buildStar(3),
                _buildStar(4),
                _buildStar(5),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCELAR'),
                onPressed: Navigator.of(context).pop,
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(_stars);
                },
              )
            ],
          );
        },
      );
    }

    final String telef = widget.usuario.telefone;
    _abrirInstagram() async {
      var instagramUrl = widget.usuario.instagram;

      if (await canLaunch(instagramUrl)) {
        await launch(instagramUrl);
      } else {
        throw 'Inserir Instagram $instagramUrl ';
      }
    }

    _abrirWats() async {
      var whatsapp = widget.usuario.whats;
      var watsappUrl =
          "https://api.whatsapp.com/send?phone=55${whatsapp}&text=sua%20mensagem.";

      if (await canLaunch(watsappUrl)) {
        await launch(watsappUrl);
      } else {
        throw 'Insira Whatsapp DDD $watsappUrl ';
      }
    }

    _abrirFacebook() async {
      var facebookUrl = widget.usuario.facebook;

      if (await canLaunch(facebookUrl)) {
        await launch(facebookUrl);
      } else {
        throw 'Inserir Seu facebook $facebookUrl ';
      }
    }

    _chamadaTelefonica() async {
      String url = 'tel:$telef';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 28.0,
      ),
      child: Container(
        //color: Colors.brown,
        height: 130.0,
        width: 40.0,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'info');
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.usuario.urlFoto),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                height: 250,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 17.0,
                left: 160.0,
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 55),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'info',
                              arguments: widget.usuario.urlFoto);
                        },
                        child: Text(
                          widget.usuario.name,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple[900],
                            fontFamily: 'commissioner',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 80,
                      ),
                      child: Text(
                        '00.0 KM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'commissioner',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 20),
                      child: Text(
                        widget.usuario.mail,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: 'commissioner',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 108.0, left: 320.0),
              child: Container(
                width: 100.0,
                child: FlatButton(
                  onPressed: () => _chamadaTelefonica(),
                  child: Image(
                    image: AssetImage('assets/imagens/ligar.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 105.0, left: 250),
              child: Container(
                width: 70.0,
                child: FlatButton(
                  onPressed: () {
                    _abrirWats();
                  },
                  child: Image(
                    image: AssetImage('assets/imagens/whats.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 320.0),
              child: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_control_rounded,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, 'avaliar');
                    avaliar();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
