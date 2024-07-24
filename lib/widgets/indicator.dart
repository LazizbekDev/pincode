import 'package:flutter/material.dart';
import 'package:pincode/widgets/colors.dart';

class Indecator extends StatefulWidget {
  final bool active;
  const Indecator({
    super.key,
    this.active = false,
  });

  @override
  State<Indecator> createState() => _IndecatorState();
}

class _IndecatorState extends State<Indecator> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Container(
        width: 12.0,
        height: 12.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.active ? AppColors.primary : AppColors.defaultIndicator,
        ),
      ),
    );
  }
}
