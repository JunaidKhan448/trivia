import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../app_resources/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;

  ShimmerWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: child,
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor);
  }
}
