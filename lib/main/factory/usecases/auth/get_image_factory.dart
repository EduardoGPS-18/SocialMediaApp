import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../local/local.dart';

GetImage makeSelectLocalImage() => LocalSelectImage(
      selectLocalImage: makeSelectLocalImageAdapter(),
    );
