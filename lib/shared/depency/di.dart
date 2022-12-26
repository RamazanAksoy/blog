import 'package:get/get.dart';

import '../service/auth_service.dart';
import '../service/firebase_service.dart';

class DependencyInjection {
  static init() async {
    await Get.putAsync(() => FirebaseService().init());
    await Get.putAsync(() => AuthService().init());
  }
}
