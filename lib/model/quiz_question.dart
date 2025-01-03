class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  getShuffleAnswer() {
    var shuffleAwser = List.of(answers);
    shuffleAwser.shuffle();
    return shuffleAwser;
  }
}
