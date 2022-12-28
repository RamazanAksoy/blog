import 'package:get/get.dart';

import '../../../shared/service/analystics_service.dart';

class BlogController extends GetxController {
  AnalyticsService analyticsService = AnalyticsService();

  @override
  void onInit() {
    // TODO: implement onInit
    print("başladi");
    analyticsService.logEvent();
    super.onInit();
  }
}
