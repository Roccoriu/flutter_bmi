import 'package:bmi_calculator/layout/drawer.dart';
import 'package:bmi_calculator/services/bmi_service.dart';
import 'package:bmi_calculator/models/bmi.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: Text(l10n.appBarTitleRating),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder<List<BmiRating>>(
        future: BmiService.getBmiRatings(
            localeKey: Localizations.localeOf(context).languageCode),
        builder:
            (BuildContext context, AsyncSnapshot<List<BmiRating>> bmiState) {
          if (bmiState.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
            );
          } else if (bmiState.hasError) {
            return Center(
              child: Text(
                  '${l10n.error} ${bmiState.error}'), // Show an error message
            );
          } else {
            return ListView.separated(
              itemCount: bmiState.data?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 0),
              itemBuilder: (BuildContext context, int index) {
                final rating = bmiState.data![index];
                final IconData icon = _getRatingIcon(rating.ratingKey);

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
                    '${l10n.bmi} ${rating.min} - ${rating.max}',
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
      case 'underweight':
        return Icons.mood_bad;
      case 'normal':
        return Icons.mood;
      case 'overweight':
        return Icons.mood_bad_outlined;
      case 'obese':
        return Icons.sentiment_dissatisfied;
      case 'very_obese':
        return Icons.sentiment_very_dissatisfied;
      case 'morbidly_obese':
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
    var l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: Text(l10n.appBarTitleRatingDetail),
      ),
      body: FutureBuilder<BmiRating>(
        future: BmiService.getBmiRatingById(
            id: int.parse(id!),
            localeKey: Localizations.localeOf(context).languageCode),
        builder: (BuildContext context, AsyncSnapshot<BmiRating> bmiRating) {
          if (bmiRating.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
            );
          } else if (bmiRating.hasError) {
            return Center(
              child: Text('${l10n.error} ${bmiRating.error}'),
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
                      '${l10n.bmi} ${rating.min} - ${rating.max}',
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
