import 'package:flutter/material.dart';
import 'package:social_media_app/ui/components/components.dart';

import '../../../shared/shared.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(text: "Postagem"),
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              children: [
                // ViewPost(
                //   size: size,
                //   onCommentClick: () {},
                //   onContentClick: () {},
                //   onLikeClick: () {},
                //   onUserImageClick: (){},
                //   currentUser: ,
                //   publish: ,
                //   publishUser: ,

                // ),
                CustomDivider(height: 0.002, size: size),
                Expanded(
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, int index) =>
                        CustomDivider(height: 0.002, size: size),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.width * 0.03,
                          horizontal: size.width * 0.04,
                        ),
                        child: Comment(
                          size: size,
                          onUserImageClick: () {},
                        ),
                      );
                    },
                  ),
                ),
                CustomDivider(height: 0.002, size: size),
                Post(
                  image: "lib/ui/assets/images/test.jpg",
                  hintTextTextField: "Adicione uma comentário",
                  functionBottonTextField: () {},
                  functionImage: () {},
                  size: size,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
