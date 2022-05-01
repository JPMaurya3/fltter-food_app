import 'package:flutter/material.dart';
import 'package:foddy_world/data.dart';
import 'package:foddy_world/rating_star.dart';
import 'package:foddy_world/recent_order.dart';
import 'package:foddy_world/restaurant_page.dart';

import 'rating_star.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TO DO
  _buildRestaurants() {
    List<Widget> restaurantList = [];

    // to do avoid using for Each with a function literal
    //for
    for (var restaurant in restaurants) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantPage(restaurant),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  height: 150,
                  width: 150,
                  image: AssetImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // to do
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingStar(restaurant.rating),
                      Text(
                        restaurant.address,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        "0.2 miles away",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {}, icon: const Icon(Icons.account_circle));
        }),
        centerTitle: true,
        title: const Text("food delivery world"),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Cart(${currentUser.cart.length})",
                style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    width: 1.0, color: Theme.of(context).primaryColor),
              ),
              hintText: "Search Food or Restaurants",
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                Icons.clear,
                color: Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          ),
        ),
        const RecentOrder(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Nearby Restaurants",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .5,
                ),
              ),
            ),
            _buildRestaurants()
          ],
        )
      ]),
    );
  }
}
