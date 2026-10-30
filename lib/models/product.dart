class Product {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int price;
  final String category;
  final double rating;
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.rating,
  });
}
const List<Product> products = [
  Product(
    id: '1',
    title: 'CHICAGO Mascara',
    description:
    'CHICAGO mascara helps create expressive lashes '
        'and completes your everyday makeup look.',
    imageUrl:
    'https://cdn-01.goldapple.ru/p/p/3750100039/web/696d674d61696e5064708ddc3e15ddf877f.jpg',
    price: 4500,
    category: 'Eye Makeup',
    rating: 4.9,
  ),
  Product(
    id: '2',
    title: 'Hydrating Face Cream',
    description:
    'A moisturizing face cream for soft and comfortable skin.',
    imageUrl:
    'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=600',
    price: 6500,
    category: 'Skincare',
    rating: 4.8,
  ),
  Product(
    id: '3',
    title: 'Velvet Lipstick',
    description:
    'A beautiful lipstick with a smooth velvet finish.',
    imageUrl:
    'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=600',
    price: 3500,
    category: 'Lip Makeup',
    rating: 4.7,
  ),
  Product(
    id: '4',
    title: 'Face Serum',
    description:
    'A lightweight facial serum for your daily skincare routine.',
    imageUrl:
    'https://images.unsplash.com/photo-1601049541289-9b1b7bbbfe19?w=600',
    price: 5500,
    category: 'Skincare',
    rating: 4.9,
  ),
];
