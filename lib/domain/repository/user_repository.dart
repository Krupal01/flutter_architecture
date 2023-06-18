
import 'package:flutter_architecture/domain/model/request/login_request.dart';

abstract class UserRepository{
  Future<dynamic> login(LoginRequest request);
// Future<dynamic> getAllWallets(int page,String? searchText);
// Future<dynamic> addWallet(String userKey,String walletId,String? publicKey);
// Future<dynamic> removeWallet(String userKey,String walletId);
// Future<dynamic> getUserWallet(String userKey);
// Future<dynamic> walletChart(String days);
// Future<dynamic> walletTransactionData(String senderKey, String receiverKey, double amount);

}