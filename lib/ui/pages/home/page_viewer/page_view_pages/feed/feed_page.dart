import 'package:flutter/material.dart';

import '../../../../../../domain/entities/entities.dart';
import '../../../../../../shared/widget/widget.dart';
import '../../../../../components/home/page_viewer/page_view_page/feed_components/feed_components.dart';
import 'feed_presenter.dart';

class FeedPage extends StatefulWidget {
  final Size size;
  final FeedPresenter presenter;

  const FeedPage({
    Key? key,
    required this.size,
    required this.presenter,
  }) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          SizedBox(
            height: widget.size.height * 0.15,
            child: FutureBuilder<UserEntity>(
              future: widget.presenter.user,
              builder: (context, snapshot) {
                return Post(
                  image: snapshot.data != null ? snapshot.data!.photoUrl : '',
                  hintTextTextField: "Adicione uma postagem",
                  functionBottonTextField: () {},
                  functionImage: () {},
                  size: widget.size,
                );
              },
            ),
          ),
          CustomDivider(
            size: widget.size,
            height: 0.015,
          ),
          StreamBuilder<List<PublishEntity>>(
            stream: widget.presenter.publishStream,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.hasData) {
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ViewPost(
                      size: widget.size,
                      publishUser: widget.presenter.loadUserEntityById(
                          uid: snapshot.data![index].userId),
                      publish: snapshot.data![index],
                      onLikeClick: () => widget.presenter
                          .likeImage(publishId: snapshot.data![index].uid),
                      onUserImageClick: () {},
                      onContentClick: () {},
                      onCommentClick: () {},
                      currentUser: widget.presenter.user,
                    );
                  },
                );
              }
              return const Center();
            },
          ),
        ],
      ),
    );
  }
}
