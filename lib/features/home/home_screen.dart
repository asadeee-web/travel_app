import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/details/destination_detail_screen.dart';
import 'package:travel_app/features/home/home_view_model.dart';
import 'package:travel_app/widgets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    int selectedIndex = 0;

    return Scaffold(
      bottomNavigationBar: CustomBottomNav(
        currentIndex: selectedIndex,
        onTap: (index) {
          // handle navigation
          selectedIndex = index;
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),

                const SizedBox(height: 20),

                _buildSearchBar(),

                const SizedBox(height: 10),

                const Text(
                  "Select Your Next Trip",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                /// Regions Selector
                _buildRegions(provider),

                SizedBox(
                  height: 400,
                  child: CardSwiper(
                    cardsCount: provider.destinations.length,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(0, 40),
                    padding: const EdgeInsets.all(0),
                    cardBuilder:
                        (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) {
                          return _buildDestinationCard(
                            provider.destinations[index],
                          );
                        },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hello, Asad Qureshi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Welcome To Travel Agency", style: TextStyle(fontSize: 12)),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey),
          suffixIcon: Padding(
            padding: EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Colors.white,
              ),
            ),
          ),
          hintText: 'Search',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildRegions(HomeViewModel provider) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.regions.length,
        itemBuilder: (context, index) {
          final isSelected = index == provider.selectedIndex;
          return GestureDetector(
            onTap: () => provider.setSelectedIndex(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                provider.regions[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Destination Card
  Widget _buildDestinationCard(Map<String, dynamic> destination) {
    return GestureDetector(
      onTap: () {
        Get.to(DestinationPage());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination["image"]),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Favorite Icon
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Icon(
                      CupertinoIcons.heart,
                      color: Colors.white,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination["country"],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      destination["city"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                destination["rating"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          destination["reviews"],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xff343435).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Text(
                            "See more",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                CupertinoIcons.forward,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
