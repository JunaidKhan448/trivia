import 'package:flutter/material.dart';
import '../app_resources/app_styles.dart';
import '../widgets/shimmer_widget.dart';
import 'package:sizer/sizer.dart';

class ShimmerForCategoriesList extends StatelessWidget {
  const ShimmerForCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 8.0 : 0.0),
            child: ShimmerWidget(
              child: Container(
                height: 10.h,
                margin: const EdgeInsets.only(bottom: 8.0),
                width: double.infinity,
                padding: const EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: AppStyles.appTileBorderRadius()),
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 4.h,
                  width: index % 3 == 0 ? 70.0 : 50.w,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
