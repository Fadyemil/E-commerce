import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/cubit/products/products_cubit.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/features/home/presentation/view/widget/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ProductsCubit(
            getIt.get<ProductsRepo>(),
          ),
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
