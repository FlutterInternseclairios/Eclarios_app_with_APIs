import 'package:flutter/material.dart';

class MedicineModel {
  final String image;
  final String medicinename;
  final String? subname;
  final String description;
  final String price;

  MedicineModel(
      {required this.image,
      required this.medicinename,
      this.subname,
      required this.description,
      required this.price});
}

List<MedicineModel> medicineList = [
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Group-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Group-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
  MedicineModel(
      image: "assets/images/Rectangle-removebg-preview.png",
      medicinename: 'Laglin M',
      subname: "5/500",
      description: "100 Tablets in one box",
      price: "988.00/-"),
];
