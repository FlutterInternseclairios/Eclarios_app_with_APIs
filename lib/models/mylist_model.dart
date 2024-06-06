class MyListModel {
  final String name;
  final String specialist;
  final String gender;
  final String backgroundImage;

  MyListModel(
      {required this.name,
      required this.specialist,
      required this.gender,
      required this.backgroundImage});
}

List<MyListModel> mylistmodel = [
  MyListModel(
      name: "DR.Ram Kumar Yadav",
      specialist: "Orthopedics",
      gender: "Male",
      backgroundImage: "assets/images/profiledoctor.jpg"),
  MyListModel(
      name: "DR.Shilza Sharma",
      specialist: "Cardiac",
      gender: "Female",
      backgroundImage: "assets/images/femaledoctorpicture.png"),
  MyListModel(
      name: "DR.Ram Kumar Yadav",
      specialist: "ORthopedics",
      gender: "Male",
      backgroundImage: "assets/images/profiledoctor.jpg"),
  MyListModel(
      name: "DR.Shilza Sharma",
      specialist: "Cardiac",
      gender: "Female",
      backgroundImage: "assets/images/femaledoctorpicture.png")
];
