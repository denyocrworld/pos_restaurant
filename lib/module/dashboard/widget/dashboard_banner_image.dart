import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class DashboardBannerImage extends StatelessWidget {
  const DashboardBannerImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1550547660-d9450f859349?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 0.0,
            bottom: 0.0,
            child: SizedBox(
              width: 100.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "30%",
                    style: GoogleFonts.oswald(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Discount Only Valid for Today",
                    style: GoogleFonts.oswald(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
