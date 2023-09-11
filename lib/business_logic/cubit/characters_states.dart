import '../../data/models/characters.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class  CharactersLoadedState extends  CharactersState {
  final List< CharacterModel>  characters;

  CharactersLoadedState(this.characters);
}

class CharactersErrorState extends CharactersState {}