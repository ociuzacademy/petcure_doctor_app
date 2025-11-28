import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageWithFallback extends StatelessWidget {
  const ProfileImageWithFallback({
    super.key,
    required this.imageUrl,
    required this.fallbackText,
    required this.size,
  });

  final String imageUrl;
  final String fallbackText;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.grey.shade100,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey.shade200,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade300),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: size * 0.4,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 4),
                Text(
                  fallbackText,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
