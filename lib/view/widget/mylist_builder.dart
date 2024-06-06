import 'package:eclarios/services/states_services.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../models/mylist_api_model.dart';
import '../../models/mylist_model.dart';
import 'mylist_card.dart';

class MylistBuilder extends StatelessWidget {
  const MylistBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;
    return Expanded(
        child: FutureBuilder<MyListApiModel>(
      future: statesServices.getList(),
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
          return ListView.builder(
              itemCount: all.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: mqw * 0.02),
                  child: MyListCard(
                    name: all[index].name.toString(),
                    specialist: all[index].profession.toString(),
                    gender: all[index].gender.toString(),
                    backgroundImage: all[index].image.toString(),
                    color: index % 2 == 0 ? kBottomBarColor : kCardColor,
                  ),
                );
              });
        }
      },
    ));
  }
}
