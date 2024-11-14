import 'package:e_commerce/desh_board/core/helper_functions/router/router_name_d_b.dart';
import 'package:e_commerce/desh_board/features/add_product/presentation/view/add_product_view.dart';
import 'package:go_router/go_router.dart';

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
        builder: (context, state) => const AddProductView(),
      ),
    ],
  );
}

GoRouter initializeRouterDB() {
  return createRouterDB(RouterNameDB.deshBoard);
}
