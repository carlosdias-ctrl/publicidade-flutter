import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:publicidade/constants/colors.dart';
import 'package:publicidade/controller/usuario_provider.dart';
import 'package:publicidade/models/usuario.dart';
import 'package:url_launcher/url_launcher.dart';

class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsuarioProvider usuario = Provider.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: CustomColors().getCustomGradient(),
            ),
            accountName: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                  fontFamily: 'Commissioner',
                ),
              ),
            ),
            // accountEmail: Text(
            //   "user@mail.com",
            //   style: TextStyle(
            //     fontFamily: 'Commissioner',
            //   ),
            // ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/imagens/user.png'),
              backgroundColor: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.amp_stories_rounded,
              color: Colors.deepPurple[900],
            ),
            title: Text(
              "Publicar",
              style: TextStyle(
                fontFamily: 'Commissioner',
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'publicar');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.edit,
              color: Colors.deepPurple[900],
            ),
            title: Text(
              "Edita Publicacão",
              style: TextStyle(
                fontFamily: 'Commissioner',
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'publicar',
                arguments: usuario,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.deepPurple[900],
            ),
            title: Text(
              "Editar Perfil",
              style: TextStyle(
                fontFamily: 'Commissioner',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.credit_card_rounded,
              color: Colors.deepPurple[900],
            ),
            title: Text(
              "Cancelar Assinatura",
              style: TextStyle(
                fontFamily: 'Commissioner',
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.map_sharp,
              color: Colors.deepPurple[900],
            ),
            title: Text(
              "Ir para o google maps",
              style: TextStyle(
                fontFamily: 'Commissioner',
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'maps');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.deepPurple[900]),
            title: Text(
              "Sair",
              style: TextStyle(
                fontFamily: 'Commissioner',
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
