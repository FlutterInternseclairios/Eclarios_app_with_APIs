import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/segments_api_model.dart';
import '../../services/states_services.dart';

class SegmentsApiGridView extends StatelessWidget {
  const SegmentsApiGridView({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return FutureBuilder<SegmentsApiModel>(
        future: statesServices.getSegment(),
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
          } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          } else {
            var all = snapshot.data!.data!;

            return Padding(
              padding: EdgeInsets.only(right: mqw * 0.03),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 15 / 16,
                ),
                itemCount: all.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                // scrollDirection: Axis,
                itemBuilder: (context, index) {
                  final image = all[index].image.toString();
                  final title = all[index].title.toString();
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(mqw * 0.035),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          image: NetworkImage(image),
                          height: mqh * 0.1,
                        ),
                        // CommonImageView(
                        //   imagePath: image,
                        //   height: mqh * 0.1,
                        // ),
                        Positioned(
                          bottom: 0,
                          // left: mqw * 0.02,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: mqh * 0.007,
                            ),
                            child: Container(
                              height: mqh * 0.04,
                              width: mqw * 0.25,
                              decoration: BoxDecoration(
                                color: kBottomBarColor,
                                borderRadius: BorderRadius.circular(mqw * 0.04),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: mqw * 0.03),
                                      child: Text(
                                          textAlign: TextAlign.center,
                                          title,
                                          style: TextStyle(
                                              fontSize: mqw * 0.022,
                                              color: kBottomBarTextColor)),
                                    ),
                                  ),
                                  Container(
                                    height: mqh * 0.08,
                                    width: mqw * 0.08,
                                    decoration: BoxDecoration(
                                      color: kTextColor1,
                                      borderRadius:
                                          BorderRadius.circular(mqw * 0.05),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_outward,
                                        color: kPrimaryColor,
                                        size: mqw * 0.045,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
