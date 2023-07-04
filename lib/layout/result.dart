import 'package:bmi_calculator/layout/drawer.dart';
import 'package:bmi_calculator/services/bmi_service.dart';
import 'package:bmi_calculator/models/bmi.dart';
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
          if (bmiState.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
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
                final rating = bmiState.data![index];
                final IconData icon = _getRatingIcon(rating.description);

                return ListTile(
                  onTap: () => context.go('/result/${rating.id}'),
                  title: Text(
                    rating.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'BMI: ${rating.min} - ${rating.max}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  leading: Icon(icon, color: Colors.deepPurple),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            );
          }
        },
      ),
    );
  }

  IconData _getRatingIcon(String rating) {
    switch (rating) {
      case 'Underweight':
        return Icons.mood_bad;
      case 'Normal':
        return Icons.mood;
      case 'Overweight':
        return Icons.mood_bad_outlined;
      case 'Obese':
        return Icons.sentiment_dissatisfied;
      case 'Very Obese':
        return Icons.sentiment_very_dissatisfied;
      case 'Morbidly Obese':
        return Icons.sentiment_very_dissatisfied_outlined;
      default:
        return Icons.star;
    }
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
          if (bmiRating.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
            );
          } else if (bmiRating.hasError) {
            return Center(
              child: Text('Error: ${bmiRating.error}'),
            );
          } else {
            final rating = bmiRating.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      rating.description,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'BMI: ${rating.min} - ${rating.max}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
