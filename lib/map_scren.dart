import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CameraPosition routeCameraPosition = const CameraPosition(
    target: LatLng(29.992017, 31.314806),
    zoom: 15,
  );

  Set<Marker> myMarker = {
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(29.992017, 31.314806),
      infoWindow: InfoWindow(title: "User's Location"),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(29.986353, 31.321824),
    ),
    const Marker(
      markerId: MarkerId('3'),
      position: LatLng(29.994066, 31.313061),
    ),
    const Marker(
      markerId: MarkerId('4'),
      position: LatLng(29.994861, 31.315796),
    ),
  };

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyA_rwYvuT-LZGEDM8gVJzgtn6yrobRttnI";

  @override
  void initState() {
    //setMarkerCustomImage();
    getPolyline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: routeCameraPosition,
      markers: myMarker,
      mapType: MapType.normal,
      polylines: Set<Polyline>.of(polylines.values),
    );
  }

  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        width: 2,
        polylineId: id,
        color: const Color(0xffC40915),
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  getPolyline() async {
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //     googleAPiKey,
    //     PointLatLng(29.992017, 31.314806),
    //     PointLatLng(29.986353, 31.321824),
    //     travelMode: TravelMode.driving,
    //     );
    // if (result.points.isNotEmpty) {
    //   result.points.forEach((PointLatLng point) {
    polylineCoordinates.add(const LatLng(29.994066, 31.313061));
    polylineCoordinates.add(const LatLng(29.992017, 31.314806));
    polylineCoordinates.add(const LatLng(29.986353, 31.321824));
    polylineCoordinates.add(const LatLng(29.994861, 31.315796));

    // });
    //}
    addPolyLine();
  }
}
