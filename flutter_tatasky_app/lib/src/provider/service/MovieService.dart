import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';

class MovieService {
  static final String _baseUrl = 'movie';

  final CollectionReference _db;

  MovieService() : _db = Firestore.instance.collection(_baseUrl);

/*add or update item*/
  Future<MovieEntity> save(MovieEntity entity) async {
    if (entity.id == null) entity.id = _db.document().documentID;

    await _db.document(entity.id).setData(entity.toJson());
    return entity;
  }

  Future<List<MovieEntity>> getByTypeAll(String type) async {
    final CollectionReference _dbs = Firestore.instance.collection(_baseUrl);
    QuerySnapshot query =
        await _dbs.where("TypeMovie", isEqualTo: type).getDocuments();
    List<MovieEntity> products = query.documents
        .map((doc) => MovieEntity.fromSnapshotJson(doc))
        .toList();
    return products;
  }

//categories movies...
 Future<List<MovieCategory>> getcategoriesmovie(String type) async {
    final CollectionReference _dbs = Firestore.instance.collection(type);
    QuerySnapshot query =
        await _dbs.getDocuments();
    List<MovieCategory> category = query.documents
        .map((doc) => MovieCategory.fromSnapshotJson(doc))
        .toList();
    return category;
  }

}
