import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_history.dart';
import 'package:bmi_calculator/services/bmi_service.dart';

class BmiUserHistory extends StatelessWidget {
  const BmiUserHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text('History'),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder<List<BmiHistory>>(
        future: BmiService.getBmiHistory(),
        builder: (BuildContext context, AsyncSnapshot<List<BmiHistory>> bmiState) {
          return ListView.builder(
            itemCount: bmiState.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(bmiState.data![index].name),
                subtitle: Text("${bmiState.data![index].bmi} ${bmiState.data![index].date}"),
                //onTap: () => context.go('/result/${bmiState.data![index].id}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
