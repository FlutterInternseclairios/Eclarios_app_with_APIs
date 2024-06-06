class SmallContainerModel {
  final String image;
  final String medicinename;
  final String? subname;
  final String description;
  final String price;

  SmallContainerModel(
      {required this.image,
      required this.medicinename,
      required this.subname,
      required this.description,
      required this.price});
}

List<SmallContainerModel> smallContainerModel = [
  SmallContainerModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: "Laglin M",
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  SmallContainerModel(
      image: "assets/images/Group-removebg-preview.png",
      medicinename: "Laglin M",
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  SmallContainerModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: "Laglin M",
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
];
