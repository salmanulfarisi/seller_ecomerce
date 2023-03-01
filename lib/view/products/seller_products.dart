import 'package:get/get.dart';
import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/view/products/seller_addnew_product.dart';
import 'package:seller_ecomerce/view/products/seller_product_details.dart';
import 'package:seller_ecomerce/view/widgets/appbar_widget.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

class SellerProducts extends StatelessWidget {
  const SellerProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const SellerAddNewProduct());
        },
        backgroundColor: purpleColor,
        child: const Icon(Icons.add),
      ),
      appBar: customappbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const SellerProductDetails());
                        },
                        leading: Image.asset(
                          imgProduct,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(
                            text: 'Product Name', size: 16.0, color: fontGrey),
                        subtitle: Row(
                          children: [
                            normalText(text: "\$40.0", color: darkGrey),
                            10.widthBox,
                            boldText(text: 'Featured', color: green)
                          ],
                        ),
                        trailing: VxPopupMenu(
                          showArrow: false,
                          child: const Icon(Icons.more_vert_rounded),
                          menuBuilder: () => Column(
                            children: List.generate(
                              popupMenuTitle.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(popupMenuIcons[index]),
                                    10.widthBox,
                                    normalText(
                                        text: popupMenuTitle[index],
                                        color: darkGrey),
                                  ],
                                ).onTap(() {}),
                              ),
                            ),
                          ).box.rounded.white.width(200).make(),
                          clickType: VxClickType.singleClick,
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
