import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:marvel_app/src/core/core.dart';

NavitMarvelAssets randonBackgroundImage() {
  final int randomImage =
      Random.secure().nextInt(NavitMarvelAssets.values.length);
  return NavitMarvelAssets.values.firstWhere(
    (nAss) => nAss.index == randomImage,
    orElse: () => NavitMarvelAssets.bg01,
  );
}

Future<Either<MarvelAppException, T>> resolveRequest<T>(
  Future<NavitResponse> Function(INavitRequest request) processRequest,
  INavitRequest request,
  T Function(dynamic data) processData,
) async {
  try {
    NavitResponse response = await processRequest(request);
    if (response.statusCode > 399) {
      return Left(
        NavitHttpException(
          response.statusCode,
          response.statusMessage,
          response.data,
        ),
      );
    }

    return Right(processData(response.data));
  } catch (e, s) {
    return Left(
      MarvelAppException(
        message: e.toString(),
        errorMessage: e.toString(),
        stackTrace: s,
      ),
    );
  }
}
