import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SnackBarUtil {
  static Flushbar? _flush;

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(message, style: const TextStyle(color: Colors.white)),
      ));
  }

  static void showFlushBarError(BuildContext context, String? message) {
    _flush = Flushbar<bool>(
      message: message,
      mainButton: IconButton(
        icon: const Icon(
          Icons.close,
          size: 20.0,
          color: Colors.white,
        ),
        onPressed: () {
          _flush!.dismiss(true);
        },
      ),
      backgroundColor: Theme.of(context).errorColor,
      animationDuration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(24.0),
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(4.0),
      flushbarPosition: FlushbarPosition.TOP,
    )..show(context);
  }

  static void showFlushBarDelete(BuildContext context, Function onUndo) {
    _flush = _flush = Flushbar<bool>(
      message: "Notifikasi Dihapus",
      mainButton: InkWell(
        onTap: () {
          onUndo();
        },
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0XFFF46363))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Undo',
                  style: TextStyle(color: Color(0XFFF46363), fontSize: 12.0)),
            )),
      ),
      messageColor: const Color(0XFF646464),
      backgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(24.0),
      duration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(4.0),
      flushbarPosition: FlushbarPosition.BOTTOM,
    )..show(context);
  }

  static Future<void> dismissFlushBar() async {
    await _flush!.dismiss(true);
  }

  static bool isDismissedFlushBar() {
    if (_flush == null) {
      return true;
    } else {
      bool isDismissed = _flush!.isDismissed();
      return isDismissed;
    }
  }
}
