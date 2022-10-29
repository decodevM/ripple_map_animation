class PlaceModel {
  int id;
  String name;
  double distance;
  int rating;
  String image;

  PlaceModel({
    required this.id,
    required this.image,
    required this.name,
    required this.distance,
    this.rating = 0,
  });
}
