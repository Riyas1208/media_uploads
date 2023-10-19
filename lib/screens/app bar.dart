
import 'package:flutter/material.dart';

import '../util/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      AppBar(
          backgroundColor: kGreenColor,
          elevation: 0,
          title: SizedBox(
            width: double.infinity,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                filled: true,
                fillColor: kWhiteColor,
                isDense: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: kGreyColor,
                  opticalSize: 20,
                  size: 16,
                  weight: 100,
                  grade: -25,
                  fill: 0,
                ),
                hintText: "Search for cars/bikes..",
                hintStyle: const TextStyle(color: kGreyColor, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: kWhiteColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: kWhiteColor),
                ),
              ),
            ),
          )
      );
  }


    }