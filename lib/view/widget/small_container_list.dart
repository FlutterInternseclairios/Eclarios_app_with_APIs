import 'package:flutter/cupertino.dart';

import '../../models/small_container_model.dart';
import 'small_container_widget.dart';

class SmallContainerList extends StatelessWidget {
  const SmallContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return SizedBox(
      height: mqw * 0.17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: smallContainerModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: mqw * 0.01),
            child: SmallContainer(
              imagePath: smallContainerModel[index].image,
              medicinename: smallContainerModel[index].medicinename,
              description: smallContainerModel[index].description,
              subname: smallContainerModel[index].subname,
              price: smallContainerModel[index].price,
            ),
          );
        },
      ),
    );
  }
}
