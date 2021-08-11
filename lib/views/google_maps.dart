import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  double lat = -8.8389272;
  double long = -48.51268281808;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.search,
              size: 25,
              color: Colors.deepPurple[900],
            ),
          ),
        ],
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.deepPurple[900],
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: TextFormField(
          decoration: InputDecoration(
            hintText: 'Pesquisar',
            border: InputBorder.none,
          ),
          onFieldSubmitted: (val) {
            lat = -8.8411724;
            long = -48.51252571725;
            LatLng position = LatLng(lat, long);
            mapController.moveCamera(CameraUpdate.newLatLng(position));

            final Marker marker = Marker(
              markerId: MarkerId("123456"),
              position: position,
              infoWindow: InfoWindow(
                title: "Linepix",
                snippet: "Linepix.work",
              ),
            );
            setState(() {
              markers.add(marker);
            });
          },
        ),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {
            print(data);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, long),
            zoom: 16.0,
          ),
          markers: markers,
        ),
      ),
    );
  }
}
