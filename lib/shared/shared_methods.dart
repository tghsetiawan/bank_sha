import 'package:another_flushbar/flushbar.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(
  num number, {
  String symbol = 'Rp ',
}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

Future<XFile?> selectImage() async {
  // try {
  //   final XFile? pickedFile = await _picker.pickImage(
  //     source: source,
  //     maxWidth: maxWidth,
  //     maxHeight: maxHeight,
  //     imageQuality: quality,
  //   );
  //   setState(() {
  //     _setImageFileListFromFile(pickedFile);
  //   });
  // } catch (e) {
  //   setState(() {
  //     _pickImageError = e;
  //   });
  // }

  try {
    XFile? selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    return selectedImage;
  } catch (e) {
    print(e.toString());
  }
}
