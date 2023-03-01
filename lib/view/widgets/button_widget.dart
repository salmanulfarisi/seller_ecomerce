import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

Widget buttonWidget({title, color = purpleColor, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      onPressed: onPress,
      child: normalText(text: "$title", size: 16.0));
}
