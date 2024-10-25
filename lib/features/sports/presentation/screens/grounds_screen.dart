import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/const/constants.dart';
import 'package:kamn/core/helpers/spacer.dart';
import 'package:kamn/core/theme_data/app_palette.dart';
import 'package:kamn/core/theme_data/style.dart';
import 'package:kamn/core/utils/app_images.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_filter_item.dart';
import 'package:kamn/features/sports/presentation/widgets/grounds_screen/custom_ground_item.dart';
import '../widgets/grounds_screen/custom_app_bar.dart';
import '../widgets/grounds_screen/custom_bottom.dart';
import '../widgets/grounds_screen/custom_text_form_field.dart';
import '../widgets/grounds_screen/custom_your_next_match_timer.dart';

class GroundsScreen extends StatelessWidget {
  const GroundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: AppPalette.backgroundColor,
      appBar: CustomAppBar.appBar(
        arrowFunction: () {},
        notificationIconFunction: () {},
        profileFunction: () {},
        badgesIconFunction: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constants.groundsScreenTitle,
              style: Style.font30DarkGreenColorBold,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: controller,
                )),
                horizontalSpace(5),
                CustomBottom(
                  iconVisible: true,
                  iconWidget: Image.asset(
                    AppImages.filterImage,
                    width: 15.w,
                    height: 15.h,
                  ),
                  onPressed: () {},
                  textBottom: 'Filter',
                  textStyle: Style.font12WhiteColorW400,
                ),
              ],
            ),
            verticalSpace(10),
            SizedBox(
              height: 30.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomFilterItem(
                        icon: Icons.location_on_outlined,
                        text: "Alexandria, Hadra",
                        onPressed: () {});
                  },
                  separatorBuilder: (context, index) {
                    return horizontalSpace(5);
                  },
                  itemCount: 5),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.reservation,
                  style: Style.font15BlackColorBold,
                ),
                Text(
                  Constants.showAll,
                  style: Style.font10GrayColorW400,
                ),
              ],
            ),
            verticalSpace(10),
            const CustomYourNextMatchTimer(),
            verticalSpace(20),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomGroundItem(
                        imageUrl: "",
                        favoriteOnTap: () {},
                        placeText: "Hadra Stadium East .1",
                        km: "2.7",
                        owner: "mahmoud sayed",
                        location: "Alexandria, Hadra",
                        available: "Available",
                        rates: "4.5",
                        price: "250",
                      );
                    },
                    separatorBuilder: (context, index) {
                      return verticalSpace(10);
                    },
                    itemCount: 5))
          ],
        ),
      ),
    );
  }
}