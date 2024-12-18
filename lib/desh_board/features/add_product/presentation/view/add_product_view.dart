import 'package:e_commerce/desh_board/features/add_product/presentation/view/widget/add_products_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: AddProductsViewBodyBlocConsumer(),
      ),
    );
  }
}

