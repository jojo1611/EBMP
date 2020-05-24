import 'package:fluster/fluster.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

class MapMarker extends Clusterable {
  final String id;
  final LatLng origin;
  BitmapDescriptor icon;

  MapMarker({
    @required this.id,
    @required this.origin,
    this.icon,
    isCluster = false,
    clusterId,
    pointsSize,
    childMarkerId,
  }) : super(
    markerId: id,
    latitude: origin.latitude,
    longitude: origin.longitude,
    isCluster: isCluster,
    clusterId: clusterId,
    pointsSize: pointsSize,
    childMarkerId: childMarkerId,
  );

  Marker toMarker() => Marker(
    markerId: MarkerId(isCluster ? 'cl_$id' : id),
    position: LatLng(
      origin.latitude,
      origin.longitude,
    ),
    icon: icon,
  );
}