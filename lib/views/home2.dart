import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:publicidade/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:publicidade/data/Categorias.dart';
import 'package:publicidade/controller/categoria_provider.dart';
import 'package:publicidade/views/buil_freelancer.dart';
import 'package:publicidade/views/build_populares.dart';
import 'package:publicidade/views/builder_categorias.dart';
import 'package:publicidade/views/drawer.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  DateTime data = DateTime.now();
  String latitudeData = '';
  String longitudeData = '';
  String address = '';
  String address2 = '';

//pegando a localização do usuario
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _getCurrentLocation2();
  }

  _getCurrentLocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    var cordenada = Coordinates(geoposition.latitude, geoposition.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(cordenada);
    setState(() {
      latitudeData = '${geoposition.latitude}';
      longitudeData = '${geoposition.longitude}';
      address = addresses.first.addressLine;
    });
  }

  _getCurrentLocation2() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    var cordenada = Coordinates(geoposition.latitude, geoposition.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(cordenada);
    setState(() {
      latitudeData = '${geoposition.latitude}';
      longitudeData = '${geoposition.longitude}';
      address2 = addresses.first.subAdminArea;
    });
  }

  Widget build(BuildContext context) {
    //base de dados interna
    final CategoriaProvider categoria = Provider.of(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: CustomColors().getCustomGradient(),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.search, size: 26),
                  onPressed: () {},
                )
              ],
              floating: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: CustomColors().getCustomGradient(),
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 110, left: 35),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 32,
                              backgroundImage:
                                  AssetImage('assets/imagens/user.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 174,
                        left: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            address2,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Commissioner',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 195.0,
                        left: 30,
                      ),
                      child: Container(
                        width: 125,
                        height: 40,
                        child: Container(
                          child: Text(
                            DateFormat(" EEE dd MMM yyyy ", "pt_BR")
                                .format(data),
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 210.0, top: 195),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/imagens/gps.png'),
                          ),
                        ),
                        height: 20,
                        width: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 195.0,
                        left: 230,
                      ),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            address,
                            style: TextStyle(
                              fontSize: 8.0,
                              color: Colors.grey,
                              fontFamily: 'Commissioner',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 200.0,
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
                  height: 895,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 50,
                          width: 370,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'CATEGORIAS',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepPurple[900],
                                    fontFamily: 'Commissioner',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'TodasCategorias');
                                },
                                child: Container(
                                  child: Text(
                                    'Ver Tudo',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange,
                                      fontFamily: 'Commissioner',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Container(
                          color: Colors.white,
                          height: double.infinity,
                          width: double.maxFinite,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoria.count,
                            itemBuilder: (ctx, i) => BuildCategorias(
                              categoria.byIndex(i),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 290),
                        child: Container(
                          height: 50,
                          width: 370,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Populares',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepPurple[900],
                                    fontFamily: 'Commissioner',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'ListaPopulares');
                                },
                                child: Container(
                                  child: Text(
                                    'Ver Tudo',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange,
                                      fontFamily: 'Commissioner',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 330),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (ctx, i) => BuildPopulares(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 540),
                        child: Container(
                          height: 50,
                          width: 370,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Freelancer',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepPurple[900],
                                    fontFamily: 'Commissioner',
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, 'ListaFreelancer');
                                },
                                child: Container(
                                  child: Text(
                                    'Ver Tudo',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange,
                                      fontFamily: 'Commissioner',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 580),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) => BuildFreelancer(),
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
      drawer: Config(),
    );
  }
}
