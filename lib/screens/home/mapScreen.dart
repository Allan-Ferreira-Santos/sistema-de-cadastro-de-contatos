import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocode/geocode.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  final markers;
  const MapScreen({Key? key, this.markers}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  GeoCode geoCode = GeoCode();

  @override
  void initState() {
    initialSetup();
    super.initState();
  }

  /*
  * Initial setup
  * @author  Allan F Santos
  * @version 1.0 - 20230121 - initial release
  * @return  void
  */

  Future<void> initialSetup() async {
    markers = widget.markers;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return getMap();
  }

  getMap() {
    return FlutterMap(
      options: MapOptions(
        keepAlive: true,
        center: LatLng(-25.4875, -49.25548),
        //bounds: LatLngBounds( LatLng(-25.4875, -49.25548)),
        zoom: 9.2,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'Stadia Maps © OpenMapTiles © OpenStreetMap contributors',
          onSourceTapped: () async {},
        )
      ],
      children: [
        TileLayer(
          urlTemplate:
              'https://tiles.stadiamaps.com/tiles/osm_bright/{z}/{x}/{y}{r}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(markers: markers),
      ],
    );
  }
}
