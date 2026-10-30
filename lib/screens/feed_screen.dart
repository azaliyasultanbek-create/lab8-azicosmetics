import 'package:flutter/material.dart';
import '../main.dart';
import '../models/product.dart';
class FeedScreen extends StatelessWidget {
  final List<Product> products;
  final Set<String> favoriteIds;
  final ValueChanged<Product> onProductTap;
  final ValueChanged<Product> onFavoriteTap;
  const FeedScreen({
    super.key,
    required this.products,
    required this.favoriteIds,
    required this.onProductTap,
    required this.onFavoriteTap,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cosmetics',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Beauty essentials',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Find your new everyday favorites',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ...products.map((product) {
            final isFavorite = favoriteIds.contains(product.id);
            return Card(
              color: Colors.white,
              elevation: 1,
              margin: const EdgeInsets.only(bottom: 16),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: InkWell(
                onTap: () => onProductTap(product),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 190,
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 48,
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () => onFavoriteTap(product),
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.category,
                            style: const TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text('${product.rating}'),
                              const Spacer(),
                              Text(
                                '${product.price} ₸',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
