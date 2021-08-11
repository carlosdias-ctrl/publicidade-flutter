import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:publicidade/constants/colors.dart';
import 'package:publicidade/controller/usuario_provider.dart';
import 'package:publicidade/views/build_usuarios.dart';

class AllUsuarios extends StatefulWidget {
  @override
  _AllUsuariosState createState() => _AllUsuariosState();
}

class _AllUsuariosState extends State<AllUsuarios> {
  @override
  Widget build(BuildContext context) {
    // List<int> categoria = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 80, 90];
    final UsuarioProvider usuario = Provider.of(context);

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: CustomColors().getCustomGradient(),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              actions: [
                IconButton(icon: Icon(Icons.search, size: 26), onPressed: () {})
              ],
              floating: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: CustomColors().getCustomGradient(),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 135.0,
                        left: 43.0,
                      ),
                      child: Container(
                        width: 160.0,
                        height: 40.0,
                        child: Container(
                          child: Text(
                            'exemplo',
                            style: TextStyle(
                              fontSize: 33.0,
                              color: Colors.white,
                              fontFamily: 'Commissioner',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 175.0,
                        left: 40.0,
                      ),
                      child: Container(
                        width: 125.0,
                        height: 40.0,
                        child: Container(
                          child: Text(
                            '',
                            // '${categoria.length} Itens',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey,
                              fontFamily: 'commissioner',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 170.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    ),
                  ),
                  //color: Colors.white,
                  width: 30,
                  height: 640.0,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: 400.0,
                          height: 590.0,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: usuario.count,
                            itemBuilder: (ctx, i) => Usuarios(
                              usuario.byIndex(i),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
