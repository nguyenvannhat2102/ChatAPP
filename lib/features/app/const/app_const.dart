import 'package:chat_app/features/app/theme/style.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: tabColor,
    textColor: whiteColor,
    fontSize: 16.0,
  );
}
