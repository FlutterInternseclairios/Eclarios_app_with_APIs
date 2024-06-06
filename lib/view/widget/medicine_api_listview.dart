import 'package:eclarios/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../models/home_medicine_model.dart';
import '../../services/states_services.dart';
import 'medicine_container_widget.dart';

class MedicineApiListView extends StatelessWidget {
  final Color? lowercontainercolor;
  const MedicineApiListView({super.key, this.lowercontainercolor});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return FutureBuilder<HomeMedicineModel>(
        future: statesServices.getMedicine(),
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
            return SizedBox(
              height: mqh * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: all.length < 5 ? all.length : 5,
                itemBuilder: (context, index) {
                  String image = all[index].image.toString();
                  String name = all[index].name.toString();
                  String description = all[index].description.toString();
                  String subname = all[index].subname ?? '';
                  String price = all[index].price.toString();
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: EdgeInsets.only(right: mqw * 0.02),
                      child: MedicineContainer(
                        url: image,
                        medicinename: name,
                        subname: subname,
                        description: description,
                        price: price,
                        lowercontainercolor: lowercontainercolor,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        });
  }
}
