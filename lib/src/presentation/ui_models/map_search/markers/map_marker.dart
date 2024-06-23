class MapMarker {
  final double? topPosition;
  final double? bottomPosition;
  final double? leftPosition;
  final double? rightPosition;
  final String title;

  const MapMarker({
    required this.title,
    this.topPosition,
    this.bottomPosition,
    this.leftPosition,
    this.rightPosition,
  });
}
