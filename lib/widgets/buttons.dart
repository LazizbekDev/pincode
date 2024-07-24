import 'package:flutter/material.dart';
import 'package:pincode/widgets/colors.dart';
// import 'package:widgets/widgets/colors.dart';

class Buttons extends StatelessWidget {
  final Function validatePassword;
  final int index;
  final List numbers;
  const Buttons({
    super.key,
    required this.validatePassword,
    required this.index,
    required this.numbers,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      onPressed: () {
        validatePassword(index);
      },
      color:
          index == 11 ? AppColors.transparent : AppColors.buttonPrimary,
      height: 78,
      minWidth: 80,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: index == 11
          ? const Icon(Icons.backspace_outlined)
          : Text(
              "${numbers[index == 10 ? index - 1 : index]}",
              style: const TextStyle(
                fontFamily: 'montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 29,
                color: AppColors.textPrimary,
              ),
            ),
    );
  }
}
