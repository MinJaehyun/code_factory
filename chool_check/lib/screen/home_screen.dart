import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static final LatLng latLng = LatLng(37.5233273, 126.921252); // latitude, longitude
  static final Circle circle = Circle(
    circleId: CircleId('chooCheckCircle'),
    center: latLng,
    fillColor: Colors.blue.withOpacity(0.5),
    radius: 100,
    strokeColor: Colors.blue,
    strokeWidth: 1,
  );
  static final Marker maker = Marker(
    markerId: MarkerId('companyMaker'),
    // latLng 는 초기화 되지 않으면 사용할 수 없으므로 static 지정함
    position: latLng,
  );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: renderAppBar(),
        body: FutureBuilder<Object>(
            future: _determinePosition(),
            builder: (context, AsyncSnapshot snapshot) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(target: latLng, zoom: 16),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set.from([maker]),
                circles: Set.from([circle]),
                // cloudMapId: ,
              );
            }),
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      title: Text('출/퇴근 서비스'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.gps_fixed_sharp),
        ),
      ],
    );
  }
}
