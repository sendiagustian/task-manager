import 'package:flutter/material.dart';

class AppWidget {
  // Untuk manampilkan snackbar
  static showSnackBar({
    required BuildContext context,
    required Widget content,
    required Duration duration,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: content,
        duration: duration,
      ),
    );
  }

  // Widget tombol atau button
  static Widget appButton({
    String buttonText = '',
    TextStyle? buttonTextStyle,
    Icon? leftTextIcon,
    Icon? rightTextIcon,
    required Function() onPressed,
    double minWidth = 88.0,
    double height = 36.0,
    Color? color,
    BorderSide? side,
    bool? withSpacing,
  }) {
    return ButtonTheme(
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftTextIcon ?? Container(),
            (withSpacing == true)
                ? const SizedBox(
                    width: 5,
                  )
                : Container(),
            Text(
              buttonText,
              style: buttonTextStyle,
            ),
            (withSpacing == true)
                ? const SizedBox(
                    width: 5,
                  )
                : Container(),
            rightTextIcon ?? Container(),
          ],
        ),
        style: TextButton.styleFrom(
          minimumSize: Size(minWidth, height),
          primary: Colors.black,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: side ??
                const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
