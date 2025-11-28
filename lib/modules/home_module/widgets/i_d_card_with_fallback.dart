import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IDCardWithFallback extends StatelessWidget {
  const IDCardWithFallback({
    super.key,
    required this.idCardUrl,
    required this.width,
    required this.height,
  });

  final String idCardUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.grey.shade100,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: idCardUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey.shade200,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green.shade300,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.credit_card, size: 24, color: Colors.grey.shade400),
                const SizedBox(height: 4),
                Text(
                  'ID Card',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
