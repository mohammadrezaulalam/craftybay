
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../data/models/review_data.dart';

class ReviewCard extends StatelessWidget {
  final ReviewData reviewData;
  const ReviewCard({
    super.key, required this.reviewData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 12),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.grey.shade300,),
            ),
            minLeadingWidth : 10,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CircularIconButton(
                //   icon: Icons.person,
                //   onTap: (){},
                // ),
                //const SizedBox(width: 8),
                Text(reviewData.profile?.cusName ?? ''),
                const SizedBox(width: 8),
                RatingBarIndicator(
                  rating: int.tryParse(reviewData.rating.toString()) == null ? 5 : double.parse(reviewData.rating ?? '0'),
                  itemCount: 5,
                  itemSize: 16.0,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                //Text(reviewData.rating.toString()),



              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 3, top: 10),
              child: Text(reviewData.description ?? ''),
            ),
          ),
        ),
      ),
    );
  }
}