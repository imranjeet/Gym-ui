import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paygo_assignment/widgets/banner_card.dart';
import 'package:paygo_assignment/widgets/header_location.dart';
import 'package:paygo_assignment/utils/color_utils.dart'; // Import the color utils

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildCategories(),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('bannerCards').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var centres = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: centres.length,
                    itemBuilder: (context, index) {
                      var centre = centres[index];
                      return BannerCard(
                        imagePath: centre['imagePath'],
                        title: centre['title'],
                        location: centre['location'],
                        distance: centre['distance'],
                        price: centre['price'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.fromLTRB(24, 12, 0, 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/vectors/vector_9_x2.svg',
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 20),
          const HeaderLocation(),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 5),
      child: SizedBox(
        height: 70,
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            _buildCategoryChip('Gym', isSelected: true),
            _buildCategoryChip('Swimming'),
            _buildCategoryChip('Cricket'),
            _buildCategoryChip('Yoga'),
            _buildCategoryChip('Zumba'),
            _buildCategoryChip('Volleyball'),
            _buildCategoryChip('Badminton'),
            _buildCategoryChip('Dance'),
            _buildCategoryChip('Table tennis'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: isSelected ? AppColors.backgroundColor : AppColors.chipTextColor,
          ),
        ),
        backgroundColor: isSelected ? AppColors.chipSelectedBackgroundColor : AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.chipBorderColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:paygo_assignment/widgets/banner_card.dart';
// import 'package:paygo_assignment/widgets/header_location.dart';

// class ListScreen extends StatelessWidget {
//   const ListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(context),
//             _buildCategories(),
//             const Expanded(
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     // Banner section
                    // BannerCard(
                    //   imagePath: 'assets/images/image_18.png',
                    //   title: 'Quad Special Workout Gym',
                    //   location: 'Near Andhra Bank, Manikonda, Hyderabad',
                    //   distance: '~ 3.4 Km',
                    //   price: '₹45 / session',
                    // ),
                    // SizedBox(height: 10),
                    // BannerCard(
                    //   imagePath: 'assets/images/image_106.png',
                    //   title: 'People Get fit Centre',
                    //   location: 'Near Andhra Bank, Manikonda, Hyderabad',
                    //   distance: '~ 12 Km',
                    //   price: '₹45 / session',
                    // ),
                    // BannerCard(
                    //   imagePath: 'assets/images/image_1061.png',
                    //   title: 'Sky Gym Centre',
                    //   location: 'Near Andhra Bank, Manikonda, Hyderabad',
                    //   distance: '~ 5.7 Km',
                    //   price: '₹66 / session',
                    // ),
                    // BannerCard(
                    //   imagePath: 'assets/images/image_1062.png',
                    //   title: '360 fitness Gym',
                    //   location: 'Near Andhra Bank, Manikonda, Hyderabad',
                    //   distance: '~ 9.0 Km',
                    //   price: '₹45 / session',
                    // ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.fromLTRB(24, 12, 0, 5),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: SvgPicture.asset(
//               'assets/vectors/vector_9_x2.svg',
//               width: 20,
//               height: 20,
//             ),
//           ),
//           const SizedBox(width: 20),
//           const HeaderLocation()
//         ],
//       ),
//     );
//   }

//   Widget _buildCategories() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 0, 0, 5),
//       child: SizedBox(
//         height: 70,
//         width: double.maxFinite,
//         child: ListView(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           children: [
//             _buildCategoryChip('Gym', isSelected: true),
//             _buildCategoryChip('Swimming'),
//             _buildCategoryChip('Cricket'),
//             _buildCategoryChip('Yoga'),
//             _buildCategoryChip('Zumba'),
//             _buildCategoryChip('Volleyball'),
//             _buildCategoryChip('Badminton'),
//             _buildCategoryChip('Dance'),
//             _buildCategoryChip('Table tennis'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryChip(String label, {bool isSelected = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: Chip(
//         label: Text(
//           label,
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.w400,
//             fontSize: 14,
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//         backgroundColor: isSelected ? const Color(0xFF7E3AF2) : Colors.white,
//         shape: RoundedRectangleBorder(
//           side: const BorderSide(color: Color(0xFFCFCFCF)),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }

  
// }
