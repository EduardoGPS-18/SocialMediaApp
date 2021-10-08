import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../domain/entities/entities.dart';

import 'profile.dart';

class ProfilePage extends StatefulWidget {
  final Size size;
  final ProfilePresenter presenter;

  const ProfilePage({
    Key? key,
    required this.size,
    required this.presenter,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    widget.presenter.loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserEntity>(
        stream: widget.presenter.userData,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: widget.presenter.setImage,
                      child: Container(
                        width: widget.size.width * 0.40,
                        height: widget.size.width * 0.40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(snapshot.data!.photoUrl),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: widget.size.height * 0.04),
                      child: Text(
                        snapshot.data!.name,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    StreamBuilder<int>(
                        stream: widget.presenter.postsCount,
                        builder: (context, snapshot) {
                          return Text.rich(
                            TextSpan(
                              text: "${snapshot.data!}",
                              style: Theme.of(context).textTheme.headline6,
                              children: const [
                                TextSpan(
                                  text: " posts",
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
                Positioned(
                  right: widget.size.width * 0.29,
                  child: IconButton(
                    onPressed: widget.presenter.setImage,
                    icon: Container(
                      height: widget.size.height * 0.1,
                      width: widget.size.height * 0.1,
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
          } else {
            return Stack(
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
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: widget.size.width * 0.40,
                        height: widget.size.width * 0.40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: widget.size.height * 0.04,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withAlpha(60),
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: widget.size.height * 0.04,
                          width: widget.size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              widget.size.width * 0.02,
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
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: widget.size.height * 0.04,
                        width: widget.size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.circular(widget.size.width * 0.02),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: widget.size.width * 0.29,
                  child: Shimmer.fromColors(
                    baseColor: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(60),
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: widget.size.height * 0.05,
                      width: widget.size.height * 0.05,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
