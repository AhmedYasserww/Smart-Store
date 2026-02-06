
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../data/product_or_list_cubit/product_or_list_cubit.dart';

class ProductButton extends StatefulWidget {
  const ProductButton({super.key});

  @override
  State<ProductButton> createState() => _ProductButtonState();
}

class _ProductButtonState extends State<ProductButton> {
  bool isProduct = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              isProduct = !isProduct;
              BlocProvider.of<ProductOrListCubit>(context).changeUi(isProduct);
            });
          },
          child: isProduct
              ? Container(
                  height: 40,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Color(0xFF5D3A82),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Center(
                    child: SvgPicture.asset(AppImages.whiteProductIcon),
                  ),
                )
              : SvgPicture.asset(AppImages.productIcon),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              isProduct = !isProduct;
              BlocProvider.of<ProductOrListCubit>(context).changeUi(isProduct);
            });
          },
          child: isProduct
              ? Center(child: SvgPicture.asset(AppImages.blackListIcon))
              : Container(
                  height: 40,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Color(0xFF5D3A82),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: SvgPicture.asset(AppImages.listIcon)),
                ),
        ),
      ],
    );
  }
}
