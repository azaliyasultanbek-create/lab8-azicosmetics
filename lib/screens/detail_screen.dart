import 'package:flutter/material.dart';
import '../main.dart';
import '../models/product.dart';
class DetailScreen extends StatefulWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  const DetailScreen({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoritePressed,
  });
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }
  void toggleFavorite() {
    widget.onFavoritePressed();
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: primaryColor,
            ),
            tooltip: 'Add to favorites',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 70,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product.category,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  '${product.rating} / 5.0',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Text(
                  '${product.price} ₸',
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Product Description',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Feed'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
