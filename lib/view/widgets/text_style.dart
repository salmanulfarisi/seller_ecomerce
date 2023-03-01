import 'package:seller_ecomerce/const/seller_const.dart';

Widget normalText({text, color = white, size = 14.0}) {
  return "$text".text.color(color).size(size).make();
}

Widget boldText({text, color = white, size = 14.0}) {
  return '$text'.text.semiBold.color(color).size(size).make();
}
