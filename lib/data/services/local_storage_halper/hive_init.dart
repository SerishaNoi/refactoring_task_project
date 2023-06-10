import 'package:eds_test/data/models/hive_models/hive_album_model.dart';
import 'package:eds_test/data/models/hive_models/hive_comment_model.dart';
import 'package:eds_test/data/models/hive_models/hive_photo_model.dart';
import 'package:eds_test/data/models/hive_models/hive_post_model.dart';
import 'package:eds_test/data/models/hive_models/hive_user_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> registerHiveAdapters() async {
  final directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  Hive.registerAdapter(UserModelAdapter());

  Hive.registerAdapter(AddressAdapter());

  Hive.registerAdapter(CompanyAdapter());

  Hive.registerAdapter(GeoAdapter());

  Hive.registerAdapter(PostModelAdapter());

  Hive.registerAdapter(PhotoModelAdapter());

  Hive.registerAdapter(CommentModelAdapter());

  Hive.registerAdapter(AlbumModelAdapter());
}
