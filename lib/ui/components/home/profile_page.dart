// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePage extends StatelessWidget {
  Size size;
  String name;
  String image;
  int postQuantity;

  ProfilePage({
    Key? key,
    required this.size,
    required this.name,
    required this.image,
    required this.postQuantity,
  }) : super(key: key);
  bool isload = false;
  @override
  Widget build(BuildContext context) {
    return isload
        ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(60),
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: size.width * 0.40,
                      height: size.width * 0.40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.04,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withAlpha(60),
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: size.height * 0.04,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(
                            size.width * 0.02,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(60),
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(size.width * 0.02),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: size.width * 0.29,
                child: Shimmer.fromColors(
                  baseColor:
                      Theme.of(context).colorScheme.onBackground.withAlpha(60),
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: size.height * 0.05,
                    width: size.height * 0.05,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          )
        //
        : Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width * 0.40,
                      height: size.width * 0.40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.04),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: "$postQuantity",
                      style: Theme.of(context).textTheme.headline6,
                      children: const [
                        TextSpan(
                          text: " posts",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: size.width * 0.29,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit_outlined,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
