class Question {
  String questionText;
  bool questionAnswer;

  // List<String> ques = [
  //   // 'You can lead a cow down stairs but not up stairs.',
  //   // 'Approximately one quarter of human bones are in the feet.',
  //   // 'A slug\'s blood is green.',
  // ];

  // List<bool> ans = [
  //   // false,
  //   // true,
  //   // true,
  // ];

  // Question({
  //   this.questionText,
  //   this.questionAnswer,
  // });

  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}
