import '../../../data/usecases/local_select_image.dart';
import '../../../domain/usecases/usecases.dart';
import '../local/local.dart';

GetImage makeSelectLocalImage() => LocalSelectImage(
      selectLocalImage: makeSelectLocalImageAdapter(),
    );
