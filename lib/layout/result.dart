import 'package:bmi_calculator/layout/drawer.dart';
import 'package:bmi_calculator/services/bmi_service.dart';
import 'package:bmi_calculator/types/bmi.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text('Ratings'),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder<List<BmiRating>>(
        future: BmiService.getBmiRatings(),
        builder: (BuildContext context, AsyncSnapshot<List<BmiRating>> bmiState) {
          return ListView.builder(
            itemCount: bmiState.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(bmiState.data![index].description),
                onTap: () => context.go('/result/${bmiState.data![index].id}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RatingDetail extends StatelessWidget {
  final String? id;

  const RatingDetail({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text('Rating Detail'),
      ),
      body: FutureBuilder<BmiRating>(
        future: BmiService.getBmiRatingById(id: int.parse(id!)),
        builder: (BuildContext context, AsyncSnapshot<BmiRating> bmiRating) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(bmiRating.data?.description ?? '', style: const TextStyle(fontSize: 30)),
                const SizedBox(height: 20),
                //Text(rating.range, style: const TextStyle(fontSize: 20)),
                //const SizedBox(height: 20),
                //Text(rating.advice, style: const TextStyle(fontSize: 20)),
              ],
            ),
          );
        },
      ),
    );
  }
}
