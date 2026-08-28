import 'package:flutter/material.dart';

import '../models/product.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final int quantity;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.quantity,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Image du produit
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 12),

              // Informations du produit
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '${product.price} €',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(quantity >=2 ? 'Quantités: $quantity' : 'Quantité: $quantity')
                  ],
                ),
              ),

            const SizedBox(width: 8),

            IconButton(
              onPressed: onDelete, 
              icon: Icon(Icons.delete, color: Colors.red,)
            ),

            const SizedBox(height: 10,),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            )
            ],
          ),
        ),
      ),
    );
  }
}