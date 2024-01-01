import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../data_exception.dart';

typedef AsyncRes<T> = Future<Either<Err, T>>;

typedef AsyncResList<T> = Future<Either<Err, List<T>>>;

typedef AsyncResMap = Future<Response<Map<String, dynamic>>>;

typedef AsyncResDyn = Future<Response<dynamic>>;
