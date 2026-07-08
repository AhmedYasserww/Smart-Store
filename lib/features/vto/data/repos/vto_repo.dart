import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/vto_entity.dart';

abstract class VtoRepo {
  Future<Either<Failure, VtoEntity>> tryOn({
    required File personImage,
    required String garmentUrl,
    required String category,
  });
}