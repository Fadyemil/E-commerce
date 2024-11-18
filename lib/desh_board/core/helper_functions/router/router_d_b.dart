import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/desh_board/core/helper_functions/router/router_name_d_b.dart';
import 'package:e_commerce/desh_board/core/repo/image_repo/image_repo.dart';
import 'package:e_commerce/desh_board/core/repo/poduct_repo/products_repo.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/add_product_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/add_product/presentation/manger/add_product/add_product_cubit.dart';
import '../../../features/desh_board/presentation/view/desh_board_view.dart';

GoRouter createRouterDB(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterNameDB.deshBoard,
        name: RouterNameDB.deshBoard,
        builder: (context, state) => const DeshBoardView(),
      ),
      GoRoute(
        path: RouterNameDB.addProduct,
        name: RouterNameDB.addProduct,
        builder: (context, state) => BlocProvider(
          create: (context) => AddProductCubit(
            getIt.get<ImageRepo>(),
            getIt.get<ProductsRepo>(),
          ),
          child: const AddProductView(),
        ),
      ),
    ],
  );
}

GoRouter initializeRouterDB() {
  return createRouterDB(RouterNameDB.deshBoard);
}
