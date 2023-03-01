import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/view/orders/seller_orderdeatails.dart';
import 'package:seller_ecomerce/view/widgets/appbar_widget.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

class SellerOrder extends StatelessWidget {
  const SellerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbarWidget(orders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
                onTap: () {
                  Get.to(() => const SellerOrderDetailsScreen());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                tileColor: textfieldGrey,
                title: boldText(
                    text: '901237849072873', size: 16.0, color: purpleColor),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: fontGrey),
                        10.widthBox,
                        boldText(
                            text: intl.DateFormat()
                                .add_yMd()
                                .format(DateTime.now()),
                            color: fontGrey),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.payment, color: fontGrey),
                        10.widthBox,
                        boldText(text: unpaid, color: red),
                      ],
                    ),
                  ],
                ),
                trailing:
                    boldText(text: '\$100', color: purpleColor, size: 16.0),
              ).box.margin(const EdgeInsets.all(4)).make(),
            ),
          ),
        ),
      ),
    );
  }
}
