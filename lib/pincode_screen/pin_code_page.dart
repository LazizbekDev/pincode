import 'package:flutter/material.dart';
import 'package:pincode/widgets/buttons.dart';
import 'package:pincode/widgets/colors.dart';
import 'package:pincode/widgets/continue_button.dart';
import 'package:pincode/widgets/indicator.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  String userInput = "";
  List<bool> activeDots = [false, false, false, false];
  int currentIndex = 0;
  Map<String, dynamic> message = {
    "warning": false,
    "text": "Введите ПИН-код для входа в приложение"
  };

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenHeight < 700 ? 80 : 50;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const Icon(
          Icons.chevron_left,
        ),
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          _buildMessageText(),
          _buildIndicatorRow(),
          _buildPinCodeGrid(horizontalPadding),
          if (userInput == '1111')
            Continue(
              screenHieght: screenHeight,
            )
        ],
      ),
    );
  }

  Widget _buildMessageText() {
    return SizedBox(
      height: 73,
      width: MediaQuery.of(context).size.width - 100,
      child: Text(
        message['text'],
        style: TextStyle(
          fontFamily: 'montserrat',
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
          color: message['warning'] ? AppColors.warning : AppColors.textPrimary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildIndicatorRow() {
    return SizedBox(
      height: 76,
      child: Center(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < activeDots.length; i++)
                Indecator(
                  active: activeDots[i],
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeGrid(gridPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gridPadding),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            (index == 9 || index == 11 && userInput == "")
                ? const SizedBox()
                : Buttons(
                    validatePassword: validatePassword,
                    index: index,
                    numbers: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
                  ),
        itemCount: 12,
      ),
    );
  }

  void validatePassword(int index) {
    setState(() {
      if (index == 11 && userInput.isNotEmpty) {
        _removeLastDigit();
      } else if (userInput.length < 4) {
        _addDigit(index);
        if (userInput.length == 4) {
          _checkPinCode();
        }
      }
    });
  }

  void _removeLastDigit() {
    userInput = userInput.substring(0, userInput.length - 1);
    currentIndex--;
    if (currentIndex >= 0) {
      activeDots[currentIndex] = false;
    }
  }

  void _addDigit(int index) {
    userInput += [1, 2, 3, 4, 5, 6, 7, 8, 9, 0][index == 10 ? index - 1 : index]
        .toString();
    activeDots[currentIndex] = true;
    currentIndex++;
  }

  void _checkPinCode() {
    if (userInput == '1111') {
      message["text"] = "Введите ПИН-код для входа в приложение";
      message["warning"] = false;
    } else {
      message["text"] = "ПИН-коды не совпали";
      message["warning"] = true;
      activeDots.fillRange(0, activeDots.length, false);
      userInput = "";
      currentIndex = 0;
    }
  }
}
