import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/application.config.dart';
import 'controller/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: const Color(0xfff5f5f5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '请输入您要搜索的内容',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(5),
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.menu)),
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    ),
                  ),
                ]),
                Obx(() => Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                          height: 200, // 设置一个固定的高度
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: const Color(0xffeeeeee),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: PageView.builder(
                              itemCount: homeController.bannerList.length,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  homeController.bannerList[index].image,
                                  fit: BoxFit.cover, // 确保图片填充整个空间
                                );
                              },
                            ),
                          )),
                    )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
