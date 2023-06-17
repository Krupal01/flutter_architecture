import '../model/model_post.dart';

abstract class UserRepository{

  Future<List<Post>> getPost();
}