import 'package:get/get.dart';
import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/controller/home_controller.dart';
import 'package:seller_ecomerce/view/home/seller_home_screen.dart';
import 'package:seller_ecomerce/view/orders/sellers_order.dart';
import 'package:seller_ecomerce/view/products/seller_products.dart';
import 'package:seller_ecomerce/view/settings/seller_settings.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SellerHomeController());
    var navScreens = [
      const SellerHome(),
      const SellerProducts(),
      const SellerOrder(),
      const SellerSettings(),
    ];
    var bottomNavbar = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: dashBoard),
      BottomNavigationBarItem(
          icon: Image.asset(icProducts, color: darkGrey, width: 24),
          label: products),
      BottomNavigationBarItem(
          icon: Image.asset(icOrders, color: darkGrey, width: 24),
          label: orders),
      BottomNavigationBarItem(
          icon: Image.asset(icGeneralSettings, color: darkGrey, width: 24),
          label: settings),
    ];
    return Scaffold(
      backgroundColor: lightGrey,
      body: Column(
        children: [
          Obx(() =>
              Expanded(child: navScreens.elementAt(controller.navIndex.value)))
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavbar,
          currentIndex: controller.navIndex.value,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.navIndex.value = index;
          },
        ),
      ),
    );
  }
}
