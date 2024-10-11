//card model
class CardModel {
  final String id;
  final String img;
  bool revealed;

  CardModel({
    required this.id,
    required this.img,
    this.revealed = false,
  });
}
