// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/constants/app_urls.dart';
import 'package:petcure_doctor_app/modules/appointment_details_module/models/appointment_details_model.dart';

class PetInfoSection extends StatelessWidget {
  const PetInfoSection({super.key, required this.pet});

  final PetDetails pet;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pet Information',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                    '${AppUrls.baseUrl}${pet.image}',
                  ),
                  onBackgroundImageError: (exception, stackTrace) =>
                      const Icon(Icons.pets, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pet.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Category: ${pet.category}'),
                      Text('Sub Category: ${pet.subCategory}'),
                      Text('Weight: ${pet.weight} kg'),
                      Text('Gender: ${pet.gender}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Owner: ${pet.ownerName}'),
            if (pet.healthCondition != null) ...[
              const SizedBox(height: 8),
              Text(
                'Health Conditions: ${pet.healthCondition}',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
