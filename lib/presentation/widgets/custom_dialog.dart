import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

class CustomDialogs {
  static Widget showCircularProgressIndicator({double? size = 30}) => SizedBox(
    height: size,
    width: size,
    child: CircularProgressIndicator());

  static ProgressDialog showProgressDialog({
    required BuildContext context,
    required String message,
    String? title,
  }) {
    return ProgressDialog(
      context,
      message: Text(message),
      title: Text(title ?? "Loading..."),
    );
  }

  static void showToast({
    required String? message,
    required BuildContext context,
    Color? backgroundColor,
    Color? textColor,
    IconData? iconData,
    Color? iconColor,
  }) {
    FToast fToast = FToast().init(context);
    fToast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor ?? Colors.black,
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              (iconData != null)
                  ? Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        iconData,
                        color: iconColor ?? Colors.white,
                      ),
                    )
                  : SizedBox.shrink(),
              Expanded(
                child: Text(
                  message ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor ?? Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}