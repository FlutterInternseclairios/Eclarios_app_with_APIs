import 'package:eclarios/constants/app_colors.dart';
import 'package:eclarios/constants/app_fonts.dart';
import 'package:eclarios/services/states_services.dart';
import 'package:eclarios/view/screens/Bottombar/bottom_bar_page.dart';
import 'package:eclarios/view/screens/cart/cart_screen.dart';
import 'package:eclarios/view/widget/my_text_widget.dart';
import 'package:eclarios/view/widget/search_container_widget.dart';
import 'package:eclarios/view/widget/searchfeild_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../models/search_api_model.dart';
import '../../controller/checkbox_controller.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    final CheckboxController checkboxController = Get.put(CheckboxController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mqh * 0.03),
          child: Column(
            children: [
              SearchFeildWidget(
                onChanged: (value) => setState(() {}),
              ),
              SizedBox(
                height: mqh * 0.02,
              ),
              Expanded(
                child: FutureBuilder<SearchApiModel>(
                  future: statesServices.getSearch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData ||
                        snapshot.data!.data!.isEmpty) {
                      return Center(
                        child: Text('No data available'),
                      );
                    } else {
                      var all = snapshot.data!.data!;

                      return ListView.builder(
                          itemCount: all.length,
                          itemBuilder: (context, index) {
                            CheckboxController controller = Get.put(
                                CheckboxController(),
                                tag: index.toString());
                            String url = all[index].image.toString();
                            String name = all[index].name.toString();
                            String description =
                                all[index].description.toString();
                            String subname = all[index].subname ?? '';
                            String price = all[index].price.toString();
                            String stars = all[index].stars.toString();
                            String rating = all[index].rating.toString();
                            if (checkboxController
                                    .searchController.value.text.isEmpty ||
                                name.toLowerCase().contains(checkboxController
                                    .searchController.value.text
                                    .toLowerCase())) {
                              return GestureDetector(
                                onTap: () {
                                  Get.offAll(
                                      BottomBarPage(
                                        initialPage: 3,
                                        data: {
                                          'name': name,
                                          'subname': subname,
                                          'description': description,
                                          'price': price,
                                          'url': url,
                                        },
                                      ),
                                      transition:
                                          Transition.leftToRightWithFade,
                                      duration: Duration(milliseconds: 500));
                                },
                                child: SearchContainer(
                                  name: name,
                                  subname: subname,
                                  description: description,
                                  stars: stars,
                                  rating: rating,
                                  price: price,
                                  url: url,
                                  controller: controller,
                                ),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
