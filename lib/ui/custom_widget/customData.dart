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

List<Datas> cartList = [];

class Datas {
  String name;
  double prince;
  String image;
  String calories;
  String description;
  bool favorite;
  int amount;
  Datas({
    this.name,
    this.prince,
    this.image,
    this.favorite,
    this.calories,
    this.description,
  });
}

List<Datas> family = [
  Datas(
      name: "10 PIECE MEAL",
      prince: 16.24,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/10PC-Meal-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "710 - 1340 per serving",
      description:
          "Served with your choice of any 2 large sides and 4 scratch made Honey-Butter Biscuits™ Legs & Thighs, Tender Strips® or Mixed Serves 4"),
  Datas(
      name: "15 PIECE MEAL",
      prince: 18.40,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/15PC-Meal-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "720 - 1360 per serving",
      description:
          "Served with your choice of any 3 large sides and 6 scratch made Honey-Butter Biscuits™\nLegs & Thighs, Tender Strips® or Mixed\nServes 6"),
  Datas(
      name: "20 PIECE MEAL",
      prince: 12.50,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/20PC-Meal-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "710 - 1370 per serving",
      description:
          "Served with your choice of any 4 large sides and 8 scratch made Honey-Butter Biscuits™\nLegs & Thighs, Tender Strips® or Mixed\nServes 8"),
];

List<Datas> sides = [
  Datas(
      name: "FRIED OKRA",
      prince: 10.00,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Fried-Okra-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "R 260 | L 740",
      description:
          "Fried okra is a passion – and hard to get just right. Ours is cut into delicious bite-sized bits, then fried to the perfect level of crisp. So perfect, most other joints won’t even try."),
  Datas(
      name: "FRIES",
      prince: 12.00,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Fried-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "R 210 | L 570",
      description:
          "We fry things. It’s what we do. So of course we have the best fries. Crinkle cut and crisp, they are perfect with our chicken. But good enough alone, too."),
  Datas(
      name: "BAKED MAC & CHEESE",
      prince: 12.50,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Baked-Mac-_-Cheese-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "R 210 | L 640",
      description:
          "We take mac & cheese, sprinkle shredded cheddar cheese on top, then bake it to golden perfection. A fork never had it so good."),
  Datas(
      name: "COLE SLAW",
      prince: 14.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Cole-Slaw-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "R 170 | L 500",
      description:
          "Creamy, tangy and delicious. It’s the perfect way to cool down your mouth after taking a bite of our spicy chicken."),
  Datas(
      name: "MASHED POTATOES",
      prince: 14.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Mashed-Potatoes-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "R 110 | L 320",
      description:
          "Before you get to the potatoes, let’s talk about our savory, rich gravy. OK, now that we’ve done that, imagine it over a generous portion of delicious mashed potatoes. Now that's perfection."),
  Datas(
      name: "HONEY-BUTTER BISCUIT™",
      prince: 14.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Honey-Butter-Biscuit%E2%84%A2-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "230 per biscuit",
      description:
          "We serve millions of biscuits every year because people are head-over-heels in love with them. Scratch-made in small batches all day long, and drizzled with honey butter, they don’t just “sell like hotcakes.” They sell like our Honey-Butter Biscuits™, which is better."),
  Datas(
      name: "JALAPEÑO PEPPERS",
      prince: 14.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Jalapeno-Peppers-aspect-ratio-4x3.jpg",
      favorite: false,
      calories: "5 per pepper",
      description:
          "Old-school Church's® guests have been doing it for decades. But they don’t run around telling everyone about it, so we’re telling you. Order a side of jalapeño peppers and squeeze the juice onto your chicken. In-the-know Church's® eaters have been rolling like that since 1952."),
  Datas(
      name: "APPLE PIE",
      prince: 14.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Apple-Pie-aspect-ratio-4x3-2.jpg",
      favorite: false,
      calories: "270 per pie",
      description:
          "Satisfy your sweet tooth with our apple pie. Juicy apple slices sprinkled with cinnamon and wrapped in a flaky crust. Can’t ask for more than that. Except for another bite."),
  Datas(
      name: "CORN",
      prince: 14.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Corn-aspect-ratio-4x3-1.jpg",
      favorite: false,
      calories: "R 190 | L 370",
      description:
          "Sweet, buttery and bursting with flavor. Our corn is like the dessert of the vegetable world."),
  Datas(
      name: "JALAPEÑO CHEESE BOMBERS®",
      prince: 14.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Jalapeno-Cheese-Bombersr-aspect-ratio-4x3-1.jpg",
      favorite: false,
      calories: "R 220 | L 440",
      description:
          "Fried spicy jalapeño bits and creamy cheddar cheese. More than just a burst of spice, it’s a delicious explosion of flavors. Crispy, then smooth, with a buttery kick of spice in every bite."),
];

List<Datas> drinks = [
  Datas(
      name: "COKE®",
      prince: 2.00,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Coke-aspect-ratio-4x3-1.jpg",
      favorite: false,
      calories: "R 290 | L 400",
      description: ""),
  Datas(
      name: "DIET COKE®",
      prince: 2.00,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Diet-Coke-aspect-ratio-4x3-2.jpg",
      favorite: false,
      calories: "R 290 | L 400",
      description: ""),
  Datas(
      name: "SPRITE®",
      prince: 2.50,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Sprite-aspect-ratio-4x3-1.jpg",
      favorite: false,
      calories: "R 290 | L 400",
      description: ""),
  Datas(
      name: "DR. PEPPER®",
      prince: 2.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Dr-Pepper-aspect-ratio-4x3-2.jpg",
      favorite: false,
      calories: "R 290 | L 400",
      description: ""),
  Datas(
      name: "FANTA® STRAWBERRY",
      prince: 3.00,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Fanta-aspect-ratio-4x3-1.jpg",
      favorite: false,
      calories: "R 340 | L 460",
      description: ""),
  Datas(
      name: "HI-C® FRUIT PUNCH",
      prince: 3.00,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Hi_C_group-1.jpg",
      favorite: false,
      calories: "R 310 | L 420",
      description: ""),
  Datas(
      name: "CHURCH'S SOUTHERN SWEET TEA®",
      prince: 3.50,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Tea-Half-Gallon.jpg",
      favorite: false,
      calories: "0 - 270",
      description: ""),
  Datas(
      name: "MINUTE MAID® LEMONADE",
      prince: 3.000,
      image:
          "https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/Minute-Maid-Half-Gallon.jpg",
      favorite: false,
      calories: "R 290 | L 390",
      description: ""),
];

List<Datas> combos = [
  Datas(
      name: "2 PIECE MIXED",
      prince: 10.00,
      image:
          'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/2PC-Mixed-aspect-ratio-4x3.jpg',
      favorite: false,
      calories: "720 - 1740",
      description:
          "Served with a regular drink, your choice of any regular side and a scratch made Honey-Butter Biscuit™"),
  Datas(
      name: "3 PIECE MIXED",
      prince: 12.00,
      image:
          'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/3PC-Mixed-aspect-ratio-4x3.jpg',
      favorite: false,
      calories: "870 - 1990",
      description:
          "Served with a regular drink, your choice of any regular side and a scratch made Honey-Butter Biscuit™"),
  Datas(
      name: "3 PIECE MIXED TENDER",
      prince: 12.50,
      image:
          'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/3PC-Tender-Strips®-aspect-ratio-4x3.jpg',
      favorite: false,
      calories: "620 - 1390",
      description:
          "Served with a regular drink, your choice of any regular side and a scratch made Honey-Butter Biscuit™"),
  Datas(
      name: "4 PIECE MIXED",
      prince: 14.000,
      image:
          'https://churchs-prod.s3.amazonaws.com/wp-content/uploads/2019/03/4PC-Tender-Strips®-aspect-ratio-4x3.jpg',
      favorite: false,
      calories: "720 - 1490",
      description:
          "Served with a regular drink, your choice of any regular side and a scratch made Honey-Butter Biscuit™"),
];
