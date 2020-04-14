/* Class Data */

import 'package:flutter/material.dart';

List<String> countries = [
  "Vietnam",
  "Cambodia",
  "Laos",
  "Thailand",
  "Myanmar",
  "Malaysia",
  "Singapore",
  "Indonesia",
  "Brunei",
  "Philippines",
  "Japan"
];

class Datas {
  String name;
  double prince;
  String image;
  bool favorite;
  Datas({this.name, this.prince, this.image, this.favorite});
}

List<Datas> family = [
  Datas(
    name: "10 PIECE MEAL",
    prince: 16.24,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/10PC-Meal-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "15 PIECE MEAL",
    prince: 18.40,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/15PC-Meal-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "20 PIECE MEAL",
    prince: 12.50,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/20PC-Meal-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
];

List<Datas> sides = [
  Datas(
    name: "FRIED OKRA",
    prince: 10.00,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Fried-Okra-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "FRIES",
    prince: 12.00,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Fried-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "BAKED MAC & CHEESE",
    prince: 12.50,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Baked-Mac-_-Cheese-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "COLE SLAW",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Cole-Slaw-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "MASHED POTATOES",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Mashed-Potatoes-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "HONEY-BUTTER BISCUIT™",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Honey-Butter-Biscuit%E2%84%A2-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "JALAPEÑO PEPPERS",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Jalapeno-Peppers-aspect-ratio-4x3.jpg",
    favorite: false,
  ),
  Datas(
    name: "APPLE PIE",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Apple-Pie-aspect-ratio-4x3-2.jpg",
    favorite: false,
  ),
  Datas(
    name: "CORN",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Corn-aspect-ratio-4x3-1.jpg",
    favorite: false,
  ),
  Datas(
    name: "JALAPEÑO CHEESE BOMBERS®",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Jalapeno-Cheese-Bombersr-aspect-ratio-4x3-1.jpg",
    favorite: false,
  ),
];

List<Datas> drinks = [
  Datas(
    name: "COKE®",
    prince: 10.00,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Coke-aspect-ratio-4x3-1.jpg",
    favorite: false,
  ),
  Datas(
    name: "DIET COKE®",
    prince: 12.00,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Diet-Coke-aspect-ratio-4x3-2.jpg",
    favorite: false,
  ),
  Datas(
    name: "SPRITE®",
    prince: 12.50,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Sprite-aspect-ratio-4x3-1.jpg",
    favorite: false,
  ),
  Datas(
    name: "DR. PEPPER®",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Dr-Pepper-aspect-ratio-4x3-2.jpg",
    favorite: false,
  ),
  Datas(
    name: "FANTA® STRAWBERRY",
    prince: 10.00,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Fanta-aspect-ratio-4x3-1.jpg",
    favorite: false,
  ),
  Datas(
    name: "HI-C® FRUIT PUNCH",
    prince: 12.00,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Hi_C_group-1.jpg",
    favorite: false,
  ),
  Datas(
    name: "CHURCH'S SOUTHERN SWEET TEA®",
    prince: 12.50,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Tea-Half-Gallon.jpg",
    favorite: false,
  ),
  Datas(
    name: "MINUTE MAID® LEMONADE",
    prince: 14.000,
    image:
        "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Minute-Maid-Half-Gallon.jpg",
    favorite: false,
  ),
];

List<Datas> combos = [
  Datas(
    name: "2 PIECE MIXED",
    prince: 10.00,
    image:
        'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/2PC-Mixed-aspect-ratio-4x3.jpg',
    favorite: false,
  ),
  Datas(
    name: "3 PIECE MIXED",
    prince: 12.00,
    image:
        'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/3PC-Mixed-aspect-ratio-4x3.jpg',
    favorite: false,
  ),
  Datas(
    name: "3 PIECE MIXED TENDER",
    prince: 12.50,
    image:
        'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/3PC-Tender-Strips®-aspect-ratio-4x3.jpg',
    favorite: false,
  ),
  Datas(
    name: "4 PIECE MIXED",
    prince: 14.000,
    image:
        'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/4PC-Tender-Strips®-aspect-ratio-4x3.jpg',
    favorite: false,
  ),
];
