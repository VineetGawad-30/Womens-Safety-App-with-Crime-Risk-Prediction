import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safetyapp/utils/color/ColorCode.dart';
class TextMain extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign?textAlign;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final bool? softWrap;
  const TextMain({
    super.key,
    required this.label,
    required this.fontSize,
    this.color=ColorCode.textContent,
    this.fontWeight = FontWeight.w400,
    this.textAlign,
    this.maxLine,
    this.textOverflow,
    this.softWrap});

  @override
  Widget build(BuildContext context) {
    return Text(label,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily:GoogleFonts.robotoSlab().fontFamily,
          fontWeight: fontWeight ),
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: softWrap,
    );
  }
}
