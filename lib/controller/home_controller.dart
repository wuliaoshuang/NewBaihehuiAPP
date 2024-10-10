import 'dart:developer';

import 'package:baihehui_app/config/application.config.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class BannerModel {
  String image = '';
  String url = '';
}

final dio = Dio();

class HomeController extends GetxController {
  var bannerList = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBannerList();
  }

  Future getBannerList() async {
    var res = await dio.get('$baseUrl/site/novel');
    var docment = parse(res.data);

    var banners =
        docment.querySelector('.carousel-inner')?.querySelectorAll('.item');
    banners
        ?.map((v) => {
              'image':
                  '$baseUrl${v.querySelector('img')?.attributes['src'] ?? ''}',
              'url': v.querySelector('a')?.attributes['href'] ?? ''
            })
        .toList()
        .forEach((element) {
      bannerList.add(BannerModel()
        ..image = element['image']!
        ..url = element['url']!);
    });
    log(bannerList.toString());
  }
}
