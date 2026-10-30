
import 'package:flutter/material.dart';
import '../models/product.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Product> catalogProducts = List.from(products);

  bool isGridView = false;

  Future<void> refreshProducts() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    final newProduct = Product(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: 'New Beauty Product',
      description: 'A new product added to our cosmetics catalog.',
      imageUrl:
      'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=600',
      price: 5000,
      category: 'New Arrival',
      rating: 4.8,
    );

    setState(() {
      catalogProducts.insert(0, newProduct);
    });
  }

  void deleteProduct(Product product, int index) {
    setState(() {
      catalogProducts.remove(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              catalogProducts.insert(
                index.clamp(0, catalogProducts.length),
                product,
              );
            });
          },
        ),
      ),
    );
  }

  void resetCatalog() {
    setState(() {
      catalogProducts = List.from(products);
    });
  }

  Widget buildProductInfo(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          product.category,
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 17),
            Text(' ${product.rating}'),
            const Spacer(),
            Text(
              '${product.price} ₸',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFB76E79),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildListItem(Product product, int index) {
    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        deleteProduct(product, index);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFF0F0),
          child: const Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xFFB76E79),
          ),
        ),
        title: Text(product.title),
        subtitle: Text(
          '${product.category} • ⭐ ${product.rating}',
        ),
        trailing: Text(
          '${product.price} ₸',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildGridItem(Product product, int index) {
    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 15),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        deleteProduct(product, index);
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFFFFF0F0),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported,
                        size: 40,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              buildProductInfo(product),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F8),
      appBar: AppBar(
        title: const Text('AZI Cosmetics'),
        backgroundColor: const Color(0xFFFFF9F8),
        actions: [
          IconButton(
            icon: Icon(
              isGridView ? Icons.view_list : Icons.grid_view,
            ),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: catalogProducts.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 15),
            const Text(
              'Catalog is Empty',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: resetCatalog,
              child: const Text('Reset Catalog'),
            ),
          ],
        ),
      )
          : RefreshIndicator(
        onRefresh: refreshProducts,
        color: const Color(0xFFB76E79),
        child: isGridView
            ? GridView.builder(
          padding: const EdgeInsets.all(12),
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.72,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: catalogProducts.length,
          itemBuilder: (context, index) {
            final product = catalogProducts[index];
            return buildGridItem(product, index);
          },
        )
            : ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: catalogProducts.length,
          separatorBuilder: (context, index) {
            return const Divider(height: 1);
          },
          itemBuilder: (context, index) {
            final product = catalogProducts[index];
            return buildListItem(product, index);
          },
        ),
      ),
    );
  }
}
