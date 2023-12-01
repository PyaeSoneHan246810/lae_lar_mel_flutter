import 'package:lae_lar_mel_app/app/models/mini_games_quiz_option_model.dart';

class MiniGamesQuizQuestion {
  final String title;
  final String image;
  final List<MiniGamesQuizOption> options;
  bool isLocked;
  MiniGamesQuizOption? selectedOption;
  MiniGamesQuizQuestion({
    required this.title,
    required this.image,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
  void reset() {
    selectedOption = null;
    isLocked = false;
  }

  static List<MiniGamesQuizQuestion> getEnglishFamilyBeginnerQuizQuestions() {
    List<MiniGamesQuizQuestion> englishFamilyBeginnerQuizQuestions = [];
    englishFamilyBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "What is the relationship between your father's sister and you?",
        image:
            "https://thumb.ac-illust.com/8f/8fb19daa30b7cb2ccb198999edbc2305_t.jpeg",
        options: [
          MiniGamesQuizOption(
            text: "Aunt",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "Cousin",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Niece",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Sister",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishFamilyBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "In genealogy, what is the term for your father's father?",
        image:
            "https://media.istockphoto.com/id/1222015134/vector/grandfather-hugging-his-grandsonbeing-proud-of-him-happy-family-concept.jpg?s=612x612&w=0&k=20&c=rwhItU5t7a9mphgsO_rXwW8CgIbdH1ong4rDyGNV6t0=",
        options: [
          MiniGamesQuizOption(
            text: "Granduncle",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Grandfather",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "Grand-uncle",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Step-grandfather",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishFamilyBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title:
            "What is the term used to refer to brothers and sisters who are born to the same parents?",
        image:
            "https://media.istockphoto.com/id/916910830/vector/sibling-rivalry-naughty-kids-fighting-mothers-attention-original-hand-drawn-illustration.jpg?s=612x612&w=0&k=20&c=zYVUvX2EoBrrOKMRnTUkdllRMIjKPa6B5uooA-jGRKk=",
        options: [
          MiniGamesQuizOption(
            text: "Nephews",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Cousins",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Friends",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Siblings",
            isCorrect: true,
          ),
        ],
      ),
    );
    return englishFamilyBeginnerQuizQuestions;
  }

  static List<MiniGamesQuizQuestion> getEnglishFoodBeginnerQuizQuestions() {
    List<MiniGamesQuizQuestion> englishFoodBeginnerQuizQuestions = [];
    englishFoodBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "Bananas and apples are types of _________.",
        image:
            "https://static.vecteezy.com/system/resources/previews/029/193/875/non_2x/composition-of-fruits-green-apple-banana-and-orange-flat-modern-illustration-vector.jpg",
        options: [
          MiniGamesQuizOption(
            text: "vegetables",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "bread",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "dinner",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "fruit",
            isCorrect: true,
          ),
        ],
      ),
    );
    englishFoodBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "What is the correct spelling?",
        image:
            "https://t4.ftcdn.net/jpg/01/35/87/65/360_F_135876551_rctb0wtTk4cS2HNV4OxvTAw1grkGLdU3.jpg",
        options: [
          MiniGamesQuizOption(
            text: "carott",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "carrot",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "carrott",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "caroat",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishFoodBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "If you need food and are comfortable, you feel _________.",
        image:
            "https://img.freepik.com/premium-vector/happy-cute-kid-girl-feels-hungry-want-eat-thinks-about-food_97632-3408.jpg",
        options: [
          MiniGamesQuizOption(
            text: "launch",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "salt",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "hungry",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "sweet",
            isCorrect: false,
          ),
        ],
      ),
    );
    return englishFoodBeginnerQuizQuestions;
  }
}
