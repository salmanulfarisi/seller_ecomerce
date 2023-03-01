import 'package:seller_ecomerce/const/seller_const.dart';

Widget loadingIndicator({circleColr = purpleColor}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(circleColr),
    ),
  );
}
