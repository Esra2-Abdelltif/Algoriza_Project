import 'package:flutter/cupertino.dart';

import '../../../../core/util/style/colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "7",
        style: TextStyle(
            fontSize: 35,
            color: kSecondryColor,
            fontWeight: FontWeight.w900),
        children: [
          TextSpan(
            text: "Krave",
            style: TextStyle(
              color: defultColor,
            ),
          ),
        ],
      ),
    );;
  }
}
