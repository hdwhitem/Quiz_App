class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List data = [
  {
    "id": 1,
    "question": "What colour pill does Neo swallow in The Matrix 1999?",
    "options": ['Red', 'Blue', 'Green', 'White'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Who wrote the screenplay for Rocky?",
    "options": [
      'Danny Elfman',
      'Alec Baldwin',
      'John Carpenter',
      'Sylvester Stallone'
    ],
    "answer_index": 3,
  },
  {
    "id": 3,
    "question": "How many Oscars has Meryl Streep won?",
    "options": ['One', 'Two', 'Three', 'Four'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question":
        "In the 1932 pre-Code film Blonde Venus, Marlene Dietrich famously appears in a nightclub dressed as what animal?",
    "options": ['A shark', 'A duck', 'A rabbit', 'A gorilla'],
    "answer_index": 3,
  },
];
