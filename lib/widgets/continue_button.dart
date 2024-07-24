import 'package:flutter/material.dart';
import 'package:pincode/widgets/colors.dart';
// import 'package:widgets/widgets/colors.dart';

class Continue extends StatelessWidget {
  final double screenHieght;
  const Continue({super.key, required this.screenHieght});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        // ager screen height 700 dan kichik bolsa button masofasi ozgaradi
        height: screenHieght < 700 ? 30 : 54,
      ),
      MaterialButton(
        color: AppColors.primary,
        padding: const EdgeInsets.all(16),
        minWidth: MediaQuery.of(context).size.width - 44,
        onPressed: () {},
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          "Продолжить",
          style: TextStyle(
            fontFamily: 'montserrat',
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonPrimary,
          ),
        ),
      )
    ]);
  }
}
