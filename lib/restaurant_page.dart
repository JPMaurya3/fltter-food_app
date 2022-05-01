import 'package:flutter/material.dart';

import 'package:foddy_world/food.dart';
import 'package:foddy_world/rating_star.dart';
import 'package:foddy_world/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantPage(this.restaurant, {Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  _buildMenuItems(Food menuitems) {
    return Center(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuitems.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(.3),
                  Colors.black38.withOpacity(.3),
                  Colors.black54.withOpacity(.3),
                  Colors.black87.withOpacity(.3),
                ],
                stops: const [0.7, 0.7, .9, .9],
              )),
        ),
        Positioned(
          left: 50,
          child: Column(
            children: [
              Text(
                menuitems.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              Text(
                "\$${menuitems.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  )),
            ))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          Image(image: AssetImage(widget.restaurant.imageUrl)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 17),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.favorite, size: 30, color: Colors.red),
                  )
                ]),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "0.2 miles away",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            RatingStar(widget.restaurant.rating),
            const SizedBox(
              height: 6,
            ),
            Text(widget.restaurant.address)
            //TO DO
          ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 30)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
                ),
                onPressed: () {},
                child: const Text(
                  "Reviews",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                )),
            ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 30)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
                ),
                onPressed: () {},
                child: const Text(
                  "Contact",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Center(
          child: Text(
            "Menu",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                // ignore: unused_local_variable
                Food food = widget.restaurant.menu[index];
                return _buildMenuItems(food);
              })),
        )
      ],
    ));
  }
}
