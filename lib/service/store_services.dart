import 'package:seller_ecomerce/const/seller_const.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendersCollection)
        .where('id', isEqualTo: uid)
        .get();
  }
}
