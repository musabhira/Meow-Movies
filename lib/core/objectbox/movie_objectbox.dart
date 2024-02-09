import 'package:meow_films/features/home_page/Data/Models/objectbox_entity.dart';
import 'package:meow_films/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieStoreObjectBox {
  static MovieStoreObjectBox? _instance;

  final Store store;
  late final Box<ObjectBoxMovieEntityUser> box;

  MovieStoreObjectBox._create(this.store) {
    box = store.box<ObjectBoxMovieEntityUser>();
  }

  static MovieStoreObjectBox get instance {
    return _instance!;
  }

  static Future<void> createMethod() async {
    if (_instance == null) {
      final docDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docDir.path, 'MovieFliq'));
      _instance = MovieStoreObjectBox._create(store);
    }
  }
}
