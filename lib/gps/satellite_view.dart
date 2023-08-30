import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:radagast/widgets/field_container.dart';
// import 'package:lat_lon_grid_plugin/lat_lon_grid_plugin.dart';
import 'package:latlong2/latlong.dart';

//TODO: Import satellite version of this and make plots on the front layer
// There's maybe something in Bing Maps we can use:
// https://www.syncfusion.com/blogs/post/easily-visualize-openstreetmaps-and-bing-maps-in-flutter.aspx
class SimpleMap extends StatefulWidget {
  const SimpleMap({Key? key}) : super(key: key);

  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  final List<LatLng> _exampleList = [
    LatLng(-21.9721271, -47.4924293),
    LatLng(-21.9721271, -47.4924293),
    LatLng(-21.9721271, -47.4924293),
    LatLng(-21.9735693, -47.492954),
    LatLng(-21.9735693, -47.492954),
    LatLng(-21.9749673, -47.500527),
  ];
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      title: "GPS",
      child: FlutterMap(
          options: MapOptions(
            zoom: 2.0,
            center: LatLng(-23.5744816, -46.7381793),
            // plugins: [
            //   MapPluginLatLonGrid(),
            // ],
          ),
          layers: [
            TileLayerOptions(
                urlTemplate: "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                backgroundColor: Colors.transparent),
            MarkerLayerOptions(markers: [
              Marker(
                  point: _exampleList[0],
                  builder: (_) => Icon(Icons.circle, color: Colors.red)),
              Marker(
                  point: _exampleList[5],
                  builder: (_) => Icon(Icons.circle, color: Colors.red))
            ]),
            PolylineLayerOptions(polylineCulling: true, polylines: [
              Polyline(points: _exampleList, color: Colors.red, strokeWidth: 3)
            ])
            // MapPluginLatLonGridOptions(
            //   lineWidth: 0.5,
            //   // apply alpha for grid lines
            //   lineColor: Colors.black,
            //   textColor: Colors.white,
            //   textBackgroundColor: Colors.black,
            //   showCardinalDirections: true,
            //   showCardinalDirectionsAsPrefix: false,
            //   textSize: 12.0,
            //   showLabels: true,
            //   rotateLonLabels: true,
            //   placeLabelsOnLines: true,
            //   offsetLonTextBottom: 20.0,
            //   offsetLatTextLeft: 20.0,
            // ),
          ]),
    );
  }
}
