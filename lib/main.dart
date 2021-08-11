import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:publicidade/controller/categoria_provider.dart';
import 'package:publicidade/controller/usuario_provider.dart';
import 'package:publicidade/views/Login.dart';
import 'package:publicidade/views/Populares_all.dart';
import 'package:publicidade/views/cadastro_usuario.dart';
import 'package:publicidade/views/categoria_screen.dart';
import 'package:publicidade/views/categorias_all.dart';
import 'package:publicidade/views/drawer.dart';
import 'package:publicidade/views/freelancer_all.dart';
import 'package:publicidade/views/google_maps.dart';
import 'package:publicidade/views/publicar.dart';
import 'package:publicidade/views/splashScreen.dart';
import 'package:publicidade/views/usuario_info.dart';
import 'constants/rating_bar.dart';
main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoriaProvider>(
          create: (ctx) => CategoriaProvider(),
        ),
        ChangeNotifierProvider<UsuarioProvider>(
          create: (ctx) => UsuarioProvider(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('pt', 'BR'),
        ],
        title: 'Fainde',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          'cadastro': (context) => Cadastro(),
          'drawer': (context) => Config(),
          'categorias': (context) => AllUsuarios(),
          'login': (context) => Login(),
          'publicar': (context) => Publicar(),
          'info': (context) => UserInfo(),
          'maps': (context) => GoogleMaps(),
          'TodasCategorias': (context) => ListCategorias(),
          'ListaPopulares': (context) => ListPopulares(),
          "ListaFreelancer": (context) => ListFreelancer(),
          "avaliar": (context) => RatingDialog(),
        },
      ),
    );
  }
}
