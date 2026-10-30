import 'package:flutter/material.dart';
import '../models/product.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Product> products;
  final Set<String> favoriteIds;
  final ValueChanged<Product> onProductTap;
  final ValueChanged<Product> onFavoriteTap;
  const FavoritesScreen({
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
          'My Favorites',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: products.isEmpty
          ? const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_border,
              size: 70,
              color: Colors.black26,
            ),
            SizedBox(height: 12),
            Text(
              'No favorites yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text('Add products you love!'),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.antiAlias,
            child: ListTile(
              onTap: () => onProductTap(product),
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imageUrl,
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      width: 65,
                      height: 65,
                      child: Icon(Icons.image_not_supported),
                    );
                  },
                ),
              ),
              title: Text(
                product.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${product.price} ₸'),
              trailing: IconButton(
                onPressed: () => onFavoriteTap(product),
                icon: Icon(
                  favoriteIds.contains(product.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.pink,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
