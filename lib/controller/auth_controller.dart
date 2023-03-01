import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:seller_ecomerce/const/seller_const.dart';

class SellerAuthController extends GetxController {
  var isloading = false.obs;
  // text controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data method
  storeUserData({
    name,
    password,
    email,
  }) async {
    DocumentReference store =
        firestore.collection(vendersCollection).doc(sellerCurrentUser!.uid);
    store.set({
      'id': sellerCurrentUser!.uid,
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': '',
      "cart_count": "00",
      "wishlist_count": "00",
      "order_count": "00",
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
    });
  }

  // sign out method
  signOutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
