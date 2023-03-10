import 'package:blog/modules/auth/login/login_binding.dart';
import 'package:blog/modules/auth/login/login_scren.dart';
import 'package:blog/modules/auth/register/register_binding.dart';
import 'package:blog/modules/auth/register/register_scren.dart';
import 'package:blog/modules/blog/blogadd/blogadd_binding.dart';
import 'package:blog/modules/blog/blogadd/blogadd_scren.dart';
import 'package:blog/modules/blog/bloghome/blog_binding.dart';
import 'package:blog/modules/blog/bloglist/bloglist_binding.dart';
import 'package:blog/modules/blog/bloglist/bloglist_scren.dart';
import 'package:get/get.dart';

import '../modules/auth/home/home_scren.dart';
import '../modules/blog/bloghome/blog.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_scren.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => const HomeScreen()),
    GetPage(name: Routes.SPLASH, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: Routes.REGISTER, page: () => const RegisterScreen(), binding: RegisterBinding()),
    GetPage(name: Routes.LOGIN, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: Routes.BLOG, page: () => const BlogScreen(), binding: BlogBinding()),
    GetPage(name: Routes.BLOGADD, page: () => const BlogAddScreen(), binding: BlogAddBinding()),
    GetPage(name: Routes.BLOGLIST, page: () => const BlogListScreen(), binding: BlogListBinding()),
  ];
}
