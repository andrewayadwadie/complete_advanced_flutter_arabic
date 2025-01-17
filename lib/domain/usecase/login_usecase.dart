import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../model/models.dart';
import 'base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
