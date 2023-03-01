import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

Widget sellerOrderPlaced({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: '$title1', color: fontGrey),
            boldText(text: '$d1', color: red)
            // '$title1'.text.fontFamily(semibold).make(),
            // "$d1".text.color(redColor).fontFamily(semibold).make(),
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: '$title2', color: fontGrey),
              boldText(text: '$d2', color: red)
              // '$title2'.text.fontFamily(semibold).make(),
              // "$d2".text.color(redColor).fontFamily(semibold).make(),
            ],
          ),
        )
      ],
    ),
  );
}
