import 'package:seller_ecomerce/const/seller_const.dart';

Widget prodctsImages({required label, onPress}) {
  return "$label"
      .text
      .bold
      .color(fontGrey)
      .size(16.0)
      .makeCentered()
      .box
      .color(lightGrey)
      .roundedSM
      .size(100, 100)
      .make();
}
