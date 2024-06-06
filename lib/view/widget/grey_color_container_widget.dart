import 'package:flutter/cupertino.dart';

import '../../constants/app_colors.dart';
import '../../models/medicine_model.dart';
import 'medicine_container_widget.dart';

class GreyContainer extends StatelessWidget {
  const GreyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<MedicineModel> firstFiveMedicines = medicineList.take(5).toList();
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return SizedBox(
      height: mqh * 0.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: firstFiveMedicines.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: mqw * 0.02),
              child: MedicineContainer(
                imagePath: medicineList[index].image,
                medicinename: medicineList[index].medicinename,
                subname: medicineList[index].subname,
                description: medicineList[index].description,
                price: medicineList[index].price,
                lowercontainercolor: kLowerContainerColor,
              ),
            );
          }),
    );
  }
}
