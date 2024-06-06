import 'package:eclarios/services/states_services.dart';
import 'package:flutter/material.dart';

import '../../models/home_medicine_model.dart';
import 'medicine_container_widget.dart';

class NewlyLaunchedApiList extends StatelessWidget {
  const NewlyLaunchedApiList({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
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
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 16 / 16,
                ),
                itemCount: all.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  String image = all[index].image.toString();
                  String name = all[index].name.toString();
                  String description = all[index].description.toString();
                  String subname = all[index].subname ?? '';
                  String price = all[index].price.toString();
                  return MedicineContainer(
                    url: image,
                    medicinename: name,
                    subname: subname,
                    description: description,
                    price: price,
                  );
                });
          }
        });
  }
}
