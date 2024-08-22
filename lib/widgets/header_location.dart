import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paygo_assignment/utils/color_utils.dart';

class HeaderLocation extends StatefulWidget {
  const HeaderLocation({super.key});

  @override
  State<HeaderLocation> createState() => _HeaderLocationState();
}

class _HeaderLocationState extends State<HeaderLocation> {
  String _location = 'Fetching';
  String _address = 'Fetching address...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _location = 'Location services are disabled.';
        _address = 'Address unavailable';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _location = 'Location permissions are denied';
          _address = 'Address unavailable';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _location =
            'Location permissions are permanently denied, we cannot request permissions.';
        _address = 'Address unavailable';
      });
      return;
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    // Fetch address from coordinates
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark placemark = placemarks.first;
      setState(() {
        _location = '${placemark.name}';
        _address =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
      });
    } catch (e) {
      setState(() {
        _address = 'Failed to fetch address';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                // width: size.width * 0.55,
                child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                  child: Text(
                    _location,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                "assets/vectors/vector_6_x2.svg",
                width: 10,
                height: 10,
              ),
            ],
          ),
          Text(
            _address,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: AppColors.searchIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
