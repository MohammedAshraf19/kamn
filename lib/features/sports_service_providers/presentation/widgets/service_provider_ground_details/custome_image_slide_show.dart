import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';

class CustomeImageSlideShow extends StatelessWidget {
  CustomeImageSlideShow(this.imagesPath, {super.key});

  List<dynamic> imagesPath = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The Image Slideshow
        if (imagesPath.isNotEmpty)
          ImageSlideshow(
            indicatorBottomPadding: 70.h,
            // Padding for indicators
            width: double.infinity,
            height: 346.h,
            initialPage: 0,
            indicatorColor: AppPallete.greenColor,
            indicatorBackgroundColor: AppPallete.lgGreyColor,
            autoPlayInterval: 3000,
            isLoop: true,
            children: imagesPath.map((path) {
              return Image.network(
                path,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            }).toList(),
          ),
        if (imagesPath.isEmpty)
          SizedBox(
            width: double.infinity,
            height: 346.h,
            child: const Center(child: Icon(Icons.error_outline, size: 40)),
          ),
        Positioned(
          top: 20.h,
          left: 20.w,
          right: 20.w,
          child: SizedBox(
            width: 340.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppPallete.greenColor,
                        border:
                            Border.all(color: AppPallete.whiteColor, width: 1)),
                    child: const Icon(Icons.arrow_back,
                        color: AppPallete.ofWhiteColor),
                  ),
                ),
                Icon(
                  Icons.bookmark_border,
                  color: AppPallete.whiteColor,
                  size: 30.h,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}