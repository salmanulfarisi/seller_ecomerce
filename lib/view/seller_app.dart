import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/controller/auth_controller.dart';
import 'package:seller_ecomerce/view/home/seller_home.dart';
import 'package:seller_ecomerce/view/widgets/button_widget.dart';
import 'package:seller_ecomerce/view/widgets/text_style.dart';

class SellerAppLogin extends StatefulWidget {
  const SellerAppLogin({Key? key}) : super(key: key);

  @override
  State<SellerAppLogin> createState() => _SellerAppLoginState();
}

class _SellerAppLoginState extends State<SellerAppLogin> {
  var isLoggedin = false;
  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        print('User is currently signed out!');
        setState(() {
          isLoggedin = false;
        });
      } else {
        print('User is signed in!');
        setState(() {
          isLoggedin = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SellerAuthController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.heightBox,
                normalText(text: welcome, size: 18.0),
                20.heightBox,
                Row(
                  children: [
                    Image.asset(
                      icLogo,
                      width: 70,
                      height: 70,
                    )
                        .box
                        .border(color: white)
                        .rounded
                        .padding(const EdgeInsets.all(8))
                        .make(),
                    10.widthBox,
                    boldText(text: appname, size: 18.0)
                  ],
                ),
                60.heightBox,
                Obx(
                  () => Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: textfieldGrey,
                          label: Text(email),
                          hintText: emailHint,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            color: purpleColor,
                          ),
                        ),
                      ),
                      10.heightBox,
                      TextFormField(
                        obscureText: true,
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: textfieldGrey,
                          label: Text(password),
                          hintText: passwordHint,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: purpleColor,
                          ),
                        ),
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: normalText(
                                text: forgotPassword,
                                size: 14.0,
                                color: purpleColor)),
                      ),
                      30.heightBox,
                      SizedBox(
                        width: context.screenWidth - 50,
                        child: controller.isloading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(purpleColor),
                                ),
                              )
                            : buttonWidget(
                                title: login,
                                onPress: () async {
                                  controller.isloading(true);
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    if (value != null) {
                                      VxToast.show(context,
                                          msg: "Login Successfull");
                                      controller.isloading(false);
                                      Get.to(() => const SellerHomeScreen());
                                    } else {
                                      controller.isloading(false);
                                    }
                                  });

                                  // Get.to(() => const SellerHomeScreen());
                                }),
                      ),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .outerShadowMd
                      .padding(const EdgeInsets.all(8))
                      .make(),
                ),
                20.heightBox,
                Center(child: normalText(text: anyProblem, color: lightGrey)),
                const Spacer(),
                Center(child: boldText(text: credit)),
                20.heightBox,
              ],
            ),
          ),
        ));
  }
}
