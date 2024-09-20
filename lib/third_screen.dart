import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polyline, Markers, Range, and Zoom Controls')),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(35.681236, 139.767125), // 東京駅の座標
              zoom: 12.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      LatLng(35.681236, 139.767125), // 東京駅
                      LatLng(35.6895, 139.6917),     // 新宿
                      LatLng(35.6762, 139.6503),     // 渋谷
                    ],
                    strokeWidth: 4.0,
                    color: Colors.blue,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(35.681236, 139.767125), // 東京駅
                    builder: (ctx) => Container(
                      child: Icon(Icons.location_on, color: Colors.red, size: 30),
                    ),
                  ),
                  Marker(
                    point: LatLng(35.6895, 139.6917),     // 新宿
                    builder: (ctx) => Container(
                      child: Icon(Icons.location_on, color: Colors.green, size: 30),
                    ),
                  ),
                  Marker(
                    point: LatLng(35.6762, 139.6503),     // 渋谷
                    builder: (ctx) => Container(
                      child: Icon(Icons.location_on, color: Colors.blue, size: 30),
                    ),
                  ),
                ],
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: LatLng(35.681236, 139.767125), // 東京駅
                    radius: 500, // 半径（メートル）
                    color: Colors.blue.withOpacity(0.3),
                    borderStrokeWidth: 2,
                    borderColor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _mapController.move(_mapController.center, _mapController.zoom + 1);
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    _mapController.move(_mapController.center, _mapController.zoom - 1);
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ThirdScreen()));
}
