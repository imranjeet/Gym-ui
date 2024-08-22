import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paygo_assignment/utils/color_utils.dart';

class BannerCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String distance;
  final String price;

  const BannerCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.distance,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 233,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                        image: imagePath.contains("https") ? NetworkImage(imagePath) : AssetImage(imagePath), fit: BoxFit.cover)),
              ),
              Positioned(
                  top: 15,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        color: AppColors.backgroundColor, shape: BoxShape.circle),
                    child: const Center(
                        child: Icon(
                      Icons.favorite_outline_outlined,
                      size: 20,
                    )),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.primarytextColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          location,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.secondarytextColor,
                          ),
                        ),
                    
                      ],

                    ),
                    const Spacer(),
                    Text(
                      distance,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.secondarytextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text(
                      price,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.text1Color,
                      ),
                    ),
                    Text(
                'Book Slot',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.highlightColor
                ),
              ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
