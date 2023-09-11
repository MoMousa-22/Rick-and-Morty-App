import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/characters.dart';
import '../../data/repository/characters_repository.dart';
import 'characters_states.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<CharacterModel> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepository.getAllCharacters().then(
      (characters) {
        emit(CharactersLoadedState(characters));
      },
    );
    return characters;
  }
}
