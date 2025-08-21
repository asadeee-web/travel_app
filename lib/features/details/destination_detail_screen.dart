import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/details/destination_detail_view_model.dart';
import 'package:travel_app/widgets/custom_circle_button.dart';
import 'package:travel_app/widgets/custom_tour_card.dart';

class DestinationDetailScreen extends StatelessWidget {
  Map<String, dynamic> destinations;

  DestinationDetailScreen({super.key, required this.destinations});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DestinationDetailViewModel(),
      child: Consumer<DestinationDetailViewModel>(
        builder: (_, model, child) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(destinations["image"]),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      CustomCircleIconButton(
                        icon: CupertinoIcons.back,
                        onTap: () {
                          Get.back();
                        },
                      ),
                      // Heart button
                      CustomCircleIconButton(icon: CupertinoIcons.heart),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destinations["city"],
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          model.getFlagEmoji(
                                            destinations["country"],
                                          ),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          destinations["country"],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow[700]),
                                    SizedBox(width: 4),
                                    Text(
                                      '5.0',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '143 reviews',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),

                            Text(
                              'Rio de Janeiro, often simply called Rio, is one of Brazil\'s most iconic cities, renowned for...',
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                            Text(
                              'Read more',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.5,
                              ),
                            ),
                            SizedBox(height: 24),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Upcoming tours',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),

                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                itemCount: 4,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return CustomTourCard(
                                    imagePath: destinations["image"],
                                    title: "Eiffel Tower Tour",
                                    duration: "3 days",
                                    price: "\$250",
                                    rating: "4.9",
                                    reviews: "320 reviews",
                                    onTap: () {},
                                    onFavoriteTap: () {},
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
