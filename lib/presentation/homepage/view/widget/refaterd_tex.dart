import 'package:flutter/material.dart';
import 'package:shopping_cart_with_api/core/constants/color_constants.dart';

class RefacterdText extends StatelessWidget {
  const RefacterdText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: "    I am",
              style: TextStyle(
                  color: ColorConstants.secondtextcolor, fontSize: 25),
              children: <TextSpan>[
                TextSpan(
                    text: "\n   Looking For...",
                    style: TextStyle(
                        fontSize: 30,
                        color: ColorConstants.textcolor,
                        fontWeight: FontWeight.bold))
              ]),
        ),
      ],
    );
  }
}
