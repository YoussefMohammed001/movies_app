import 'package:equatable/equatable.dart';

class RecommendationsEntity extends Equatable{
final String backDropPath;
final int id;

const RecommendationsEntity({required this.backDropPath, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props =>[
    backDropPath,
    id,
  ];


}