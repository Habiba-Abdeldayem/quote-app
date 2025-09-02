import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'dart:convert';

class QuoteModel extends Quote{
  const QuoteModel({required super.author, required super.id, required super.content});


QuoteModel quoteModelFromJson(String str) => QuoteModel.fromJson(json.decode(str));

    factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["id"],
        content: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toJson(QuoteModel quote) => {
        "id": id,
        "quote": content,
        "author": author,
    };

}