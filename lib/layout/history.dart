import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_history.dart';
import 'package:bmi_calculator/services/bmi_service.dart';
import 'package:intl/intl.dart';

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
          if (bmiState.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                ),
              ),
            );
          } else if (bmiState.hasError) {
            return Center(
              child: Text('Error: ${bmiState.error}'), // Show an error message
            );
          } else {
            return ListView.separated(
              itemCount: bmiState.data?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 0),
              itemBuilder: (BuildContext context, int index) {
                final history = bmiState.data![index];
                final formattedDate = DateFormat('dd.MM.yyyy HH:mm:ss').format(history.date);
                final roundedBMI = history.bmi.toStringAsFixed(2);

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          history.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'BMI: $roundedBMI',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      'Date: $formattedDate',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    onTap: () {
                      // Add your desired navigation logic here
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
