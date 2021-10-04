import 'package:image_picker/image_picker.dart';

import '../../../data/local/local.dart';
import '../../../infra/local/image_picker_adapter.dart';

SelectLocalImage makeSelectLocalImageAdapter() => SelectLocalImageAdapter(
      imagePicker: ImagePicker(),
    );
