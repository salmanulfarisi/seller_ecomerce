import 'package:intl/intl.dart' as intl;
import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

AppBar customappbarWidget(title) {
  return AppBar(
    backgroundColor: white,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: fontGrey, size: 16.0),
    actions: [
      Center(
        child: normalText(
            text: intl.DateFormat('EEE,MMM d,' 'yy').format(DateTime.now()),
            color: darkGrey,
            size: 16.0),
      ),
      10.widthBox,
    ],
  );
}
