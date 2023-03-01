import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

Widget sellerTextField({label, hint, controller, isDes = false}) {
  return TextFormField(
    maxLines: isDes ? 4 : 1,
    decoration: InputDecoration(
        isDense: true,
        label: normalText(text: label),
        hintText: hint,
        hintStyle: const TextStyle(color: darkGrey),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12.0),
        //   borderSide: const BorderSide(
        //     color: white,
        //   ),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: white,
          ),
        )),
  );
}
