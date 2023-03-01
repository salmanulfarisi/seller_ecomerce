import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/controller/auth_controller.dart';
import 'package:seller_ecomerce/service/store_services.dart';
import 'package:seller_ecomerce/view/messages/messages_screen.dart';
import 'package:seller_ecomerce/view/seller_app.dart';
import 'package:seller_ecomerce/view/settings/edit_profile.dart';
import 'package:seller_ecomerce/view/settings/seller_shop_settings.dart';
import 'package:seller_ecomerce/view/widgets/loading_indicator.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

class SellerSettings extends StatelessWidget {
  const SellerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              },
              icon: const Icon(Icons.edit)),
          TextButton(
              onPressed: () async {
                await Get.find<SellerAuthController>()
                    .signOutMethod(context: context);
                Get.offAll(() => const SellerAppLogin());
              },
              child: normalText(text: logout))
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(sellerCurrentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circleColr: white);
          } else {
            var data = snapshot.data!.docs[0];
            return Column(
              children: [
                ListTile(
                  leading: Image.asset(imgProduct)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  title: boldText(text: '${data['vendor_name']}'),
                  subtitle: normalText(text: "${data['email']}"),
                ),
                const Divider(),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                        profileButtonsIcon.length,
                        (index) => ListTile(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Get.to(() => const ShopSettings());
                                    break;
                                  case 1:
                                    Get.to(() => const SellerMessagesScreen());
                                    break;
                                  default:
                                }
                              },
                              leading: Icon(
                                profileButtonsIcon[index],
                                color: white,
                              ),
                              title:
                                  normalText(text: profileButtonTitle[index]),
                            )),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
