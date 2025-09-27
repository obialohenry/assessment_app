import 'package:assessment_app/src/config.dart';
import 'package:flutter/widgets.dart';

class DividerWidget extends StatelessWidget {
  ///Creates a widget that drwas a horizontal line on the screen.
  const DividerWidget({super.key,this.color,this.height,this.width});
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(color:color?? AppColors.kSoftLilac, width:width?? double.infinity, height:height?? 4);
  }
}
