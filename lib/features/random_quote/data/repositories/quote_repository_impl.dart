import 'package:dartz/dartz.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository{
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource remoteDataSource;
  final RandomQuoteLocalDataSource localDataSource;

  QuoteRepositoryImpl({required this.networkInfo, required this.remoteDataSource, required this.localDataSource});
  
  @override
  Future<Either<Failure, Quote>> getRandomQuote() {
    // TODO: implement getRandomQuote
    throw UnimplementedError();
  }


}