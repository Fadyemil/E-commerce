import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productBsetSelling});
  final ProductEntity productBsetSelling;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 214.h,
        width: 163.w,
        decoration: ShapeDecoration(
          color: Color(0xffF3F5F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  CachedNetworkImage(
                    width: 163.w,
                    height: 110.h,
                    imageUrl:
                        'https://jjfnqrvkebweapmofqtn.supabase.co/storage/v1/object/public/${productBsetSelling.imageUrl}',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  ListTile(
                    title: Text(
                      productBsetSelling.name,
                      style: AppTextStyles.bodySmallSemiBold13,
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${productBsetSelling.price} جنية /',
                            style: AppTextStyles.bodySmallBold13.copyWith(
                              color: Color(0xffF4A91F),
                            ),
                          ),
                          TextSpan(
                            text: ' كيلو ',
                            style: AppTextStyles.bodySmallBold13.copyWith(
                              color: Color(0xffF8C76D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton.filled(
                      iconSize: 32.r,
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Color(0xff1B5E37)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
