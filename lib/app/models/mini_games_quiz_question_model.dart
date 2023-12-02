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
    englishFamilyBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "The three children of my aunt are my _________.",
        image:
            "https://img.freepik.com/premium-vector/cute-kids-holding-hands-together_330389-328.jpg",
        options: [
          MiniGamesQuizOption(
            text: "Cousins",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "Friends",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Twins",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Siblings",
            isCorrect: false,
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
    englishFoodBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "What is the correct spelling?",
        image:
            "https://media.istockphoto.com/id/1209008469/vector/broccoli-fresh-green-vegetable-isolated-on-white-background-broccoli-icon.jpg?s=612x612&w=0&k=20&c=1K3zTtvNJvaorEGb5Dxj1rQfKZFxaVuGlWtsqO0PcIs=",
        options: [
          MiniGamesQuizOption(
            text: "brocoly",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "broccoli",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "brocolli",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "brocoli",
            isCorrect: false,
          ),
        ],
      ),
    );
    return englishFoodBeginnerQuizQuestions;
  }

  static List<MiniGamesQuizQuestion> getEnglishPlacesBeginnerQuizQuestions() {
    List<MiniGamesQuizQuestion> englishPlacesBeginnerQuizQuestions = [];
    englishPlacesBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "There is a bus ___________ just round the corner.",
        image:
            "https://t3.ftcdn.net/jpg/02/56/33/66/360_F_256336632_q7BHQciXrZBhuzGCuUdnUG6YLQCrxt9d.jpg",
        options: [
          MiniGamesQuizOption(
            text: "station",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "stop",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "platform",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "start",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishPlacesBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "I practise sport in the ___________.",
        image:
            "https://img.freepik.com/free-vector/gym-concept-illustration_114360-6640.jpg",
        options: [
          MiniGamesQuizOption(
            text: "train station",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "bank",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "gym",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "shopping center",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishPlacesBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "She works at the __________ at the check-in counter.",
        image:
            "https://www.shutterstock.com/image-vector/man-luggage-suitcases-queue-flight-600nw-2003520659.jpg",
        options: [
          MiniGamesQuizOption(
            text: "post office",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "police station",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "supermarket",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "airport",
            isCorrect: true,
          ),
        ],
      ),
    );
    englishPlacesBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "We need some bread. Please go to the _________ to buy some.",
        image:
            "https://cdni.iconscout.com/illustration/premium/thumb/bakery-store-9933967-8114816.png?f=webp",
        options: [
          MiniGamesQuizOption(
            text: "butcher shop",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "library",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "bakery shop",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "barber shop",
            isCorrect: false,
          ),
        ],
      ),
    );
    return englishPlacesBeginnerQuizQuestions;
  }

  static List<MiniGamesQuizQuestion> getEnglishBusinessBeginnerQuizQuestions() {
    List<MiniGamesQuizQuestion> englishBusinessBeginnerQuizQuestions = [];
    englishBusinessBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title:
            "We are waiting on the _________ to send us our next shipment of computers.",
        image:
            "https://cdn.dribbble.com/users/2273377/screenshots/5689103/media/80adef5781c1fffc5af471aaedbd8c74.png?resize=400x300&vertical=center",
        options: [
          MiniGamesQuizOption(
            text: "stock",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "supplier",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "underestimate",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "research",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishBusinessBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "Our goal next month is to _________ seven more office workers.",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8jNelnKZvWiBE5UU9ndQGdaBsuFkl5u68gQ&usqp=CAU",
        options: [
          MiniGamesQuizOption(
            text: "employ",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "own",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "stock",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "research",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishBusinessBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title:
            "What is the term for a list of topics or issues to be discussed in a meeting?",
        image:
            "https://img.freepik.com/free-vector/manager-prioritizing-tasks-list_74855-5272.jpg",
        options: [
          MiniGamesQuizOption(
            text: "Minutes",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Agenda",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "Venue",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Invitee",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishBusinessBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title:
            "Several of the sales _____________ told me that they have received numerous complaints from customers.",
        image:
            "https://static-00.iconduck.com/assets.00/salesman-illustration-512x392-5mrz030f.png",
        options: [
          MiniGamesQuizOption(
            text: "persons",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "personnel",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "personal",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "person",
            isCorrect: false,
          ),
        ],
      ),
    );
    return englishBusinessBeginnerQuizQuestions;
  }

  static List<MiniGamesQuizQuestion>
      getEnglishEntertainmentBeginnerQuizQuestions() {
    List<MiniGamesQuizQuestion> englishEntertainmentBeginnerQuizQuestions = [];
    englishEntertainmentBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title: "What do you call a female actor?",
        image:
            "https://st2.depositphotos.com/4770601/7353/v/450/depositphotos_73533797-stock-illustration-retro-glam-girl-face.jpg",
        options: [
          MiniGamesQuizOption(
            text: "actress",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "comedy",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "actor",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "orchestra",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishEntertainmentBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title:
            "What is a dramatic work intended for performance by actors on a stage?",
        image:
            "https://img.freepik.com/free-vector/opera-singers-playing-stage-with-musicians-theatre-performers-wearing-costumes-standing-spotlights-singing-before-audience-flat-cartoon-illustration-drama-performance-concept_74855-13187.jpg",
        options: [
          MiniGamesQuizOption(
            text: "quiz",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "folk music",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "drama",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "comedy",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishEntertainmentBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title:
            "________ music artists are usually famous worldwide, like Madonna, and Michael Jackson.",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRqOvhVE5UbwjdzM6Dz_N4YQgOQ6n2fSCaHw&usqp=CAU",
        options: [
          MiniGamesQuizOption(
            text: "Rock",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Pop",
            isCorrect: true,
          ),
          MiniGamesQuizOption(
            text: "Opera",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "Tune",
            isCorrect: false,
          ),
        ],
      ),
    );
    englishEntertainmentBeginnerQuizQuestions.add(
      MiniGamesQuizQuestion(
        title:
            "Some people have natural ________ talent and understand how instruments work without much help.",
        image:
            "https://i.pinimg.com/736x/f8/69/1d/f8691d12916e16ccf636d988b8037564.jpg",
        options: [
          MiniGamesQuizOption(
            text: "tune",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "soul",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "rap",
            isCorrect: false,
          ),
          MiniGamesQuizOption(
            text: "musical",
            isCorrect: true,
          ),
        ],
      ),
    );
    return englishEntertainmentBeginnerQuizQuestions;
  }
}
