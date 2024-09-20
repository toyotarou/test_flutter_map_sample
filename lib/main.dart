import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Map with Bounds',
      home: MapWithBounds(),
    );
  }
}

class MapWithBounds extends StatefulWidget {
  const MapWithBounds({super.key});

  @override
  _MapWithBoundsState createState() => _MapWithBoundsState();
}

class _MapWithBoundsState extends State<MapWithBounds> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();

    // 初期化時に地図の範囲を設定
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fitMapToBounds();
    });
  }

  void fitMapToBounds() {
    // 表示したい範囲を定義 (東京から大阪)
    LatLngBounds bounds = LatLngBounds(
      LatLng(34.6937, 135.5023), // 大阪 (南西)
      LatLng(35.6895, 139.6917), // 東京 (北東)
    );

    // 地図を指定した範囲にフィット
    _mapController.fitBounds(
      bounds,
      options: const FitBoundsOptions(
        padding: EdgeInsets.all(50.0), // パディングを設定
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Map with Bounds'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(35.0, 137.0), // 中央の初期位置
          zoom: 5.0, // 初期ズームレベル
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}


/*
地図の中央座標を割り出す方法としては、指定した2点（南西端と北東端）の緯度・経度の平均を計算することで中央の位置を求めることができます。

中央座標の計算方法
緯度（latitude）の中央値:
南西端の緯度と北東端の緯度の平均を取る

中央緯度
=
南西端の緯度
+
北東端の緯度
2
中央緯度=
2
南西端の緯度+北東端の緯度
​

経度（longitude）の中央値:
同様に、南西端の経度と北東端の経度の平均を取ります

中央経度
=
南西端の経度
+
北東端の経度
2
中央経度=
2
南西端の経度+北東端の経度
​

例: 東京と大阪の中央座標を計算
大阪（南西端）の座標:
緯度 = 34.6937, 経度 = 135.5023
東京（北東端）の座標:
緯度 = 35.6895, 経度 = 139.6917
これらを使って計算します。

中央緯度
34.6937
+
35.6895
2
=
35.1916
2
34.6937+35.6895
​
 =35.1916
中央経度
135.5023
+
139.6917
2
=
137.597
2
135.5023+139.6917
​
 =137.597
結果
東京と大阪の中央座標は、緯度が 35.1916、経度が 137.597 となります。このようにして中央位置を計算し、centerの座標として使用します。

地図の中央を手動で指定する場合、この方法で2つの地点の間の中心を簡単に割り出すことが可能です。

*/

