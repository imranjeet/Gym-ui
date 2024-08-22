import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paygo_assignment/screens/list_screen.dart';
import 'package:paygo_assignment/widgets/banner_card.dart';
import 'package:paygo_assignment/widgets/header_location.dart';
import 'package:paygo_assignment/utils/color_utils.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  void changeNavBar(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Location and points
            Container(
              height: 55,
              decoration: const BoxDecoration(color: AppColors.primaryBackgroundColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeaderLocation(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/coin_1.png",
                              height: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Points",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                                color: AppColors.pointsTextColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '3,725',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Greeting and prompt
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.primaryBackgroundColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, Karthik!',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: AppColors.textColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'What would you like to do today?',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                                color: AppColors.highlightColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 44,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.75,
                                    height: 44,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.search,
                                            color: AppColors.searchIconColor),
                                        hintText: 'Find a nearby activity',
                                        hintStyle: GoogleFonts.inter(
                                            color: AppColors.searchIconColor),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: SvgPicture.asset(
                                      'assets/vectors/filter.svg',
                                      height: 17,
                                      width: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Activity options
                    GridView.count(
                      crossAxisCount: 3,
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const _ActivityCard(
                          iconPath: 'assets/vectors/vector_5_x2.svg',
                          title: 'Gym',
                        ),
                        const _ActivityCard(
                          iconPath: 'assets/vectors/swim.svg',
                          title: 'Swimming',
                        ),
                        const _ActivityCard(
                          iconPath: 'assets/vectors/badminton.svg',
                          title: 'Badminton',
                        ),
                        const _ActivityCard(
                          iconPath: 'assets/vectors/yoga.svg',
                          title: 'Yoga',
                        ),
                        const _ActivityCard(
                          iconPath: 'assets/vectors/zumba.svg',
                          title: 'Zumba',
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle view all tap
                          },
                          child: Center(
                            child: Text(
                              'View all',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.highlightColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Banner section
                    const BannerCard(
                      imagePath: 'assets/images/image_1061.png',
                      title: 'Quad Special Workout Gym',
                      location: 'Near Andhra Bank, Manikonda, Hyderabad',
                      distance: '~ 3.4 Km',
                      price: '₹45 / session',
                    ),
                    const SizedBox(height: 10),
                    const BannerCard(
                      imagePath: 'assets/images/image_106.png',
                      title: 'Sky Gym Centre',
                      location: 'Near Andhra Bank, Manikonda, Hyderabad',
                      distance: '~ 5.7 Km',
                      price: '₹66 / session',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) => changeNavBar(value),
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.bottomNavSelectedItemColor,
        unselectedItemColor: AppColors.bottomNavUnselectedItemColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (currentPage == 0)
                    Container(
                      height: 2,
                      width: 30,
                      color: AppColors.bottomNavSelectedItemColor,
                    ),
                  const SizedBox(height: 8),
                  SvgPicture.asset(
                    'assets/vectors/home.svg',
                    color: currentPage == 0
                        ? AppColors.bottomNavSelectedItemColor
                        : AppColors.bottomNavUnselectedItemColor,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (currentPage == 1)
                    Container(
                      height: 2,
                      width: 45,
                      color: AppColors.bottomNavSelectedItemColor,
                    ),
                  const SizedBox(height: 8),
                  SvgPicture.asset(
                    'assets/vectors/bookings.svg',
                    color: currentPage == 1
                        ? AppColors.bottomNavSelectedItemColor
                        : AppColors.bottomNavUnselectedItemColor,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (currentPage == 2)
                    Container(
                      height: 2,
                      width: 45,
                      color: AppColors.bottomNavSelectedItemColor,
                    ),
                  const SizedBox(height: 8),
                  SvgPicture.asset(
                    'assets/vectors/explore.svg',
                    color: currentPage == 2
                        ? AppColors.bottomNavSelectedItemColor
                        : AppColors.bottomNavUnselectedItemColor,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (currentPage == 3)
                    Container(
                      height: 2,
                      width: 30,
                      color: AppColors.bottomNavSelectedItemColor,
                    ),
                  const SizedBox(height: 8),
                  SvgPicture.asset(
                    'assets/vectors/profile.svg',
                    color: currentPage == 3
                        ? AppColors.bottomNavSelectedItemColor
                        : AppColors.bottomNavUnselectedItemColor,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final String iconPath;
  final String title;

  const _ActivityCard({
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ListScreen()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
