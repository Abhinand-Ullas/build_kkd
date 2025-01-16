import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> initializeDatabase() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final kozhikodePanchayaths = [
    "Azhiyur",
    "Chorode",
    "Eramala",
    "Onchiyam",
    "Chekkiad",
    "Edacherry",
    "Puramery",
    "Thuneri",
    "Valayam",
    "Vanimel",
    "Kunnummal",
    "Nadapuram",
    "Kayakkodi",
    "Kavilumpara",
    "Kuttaidy",
    "Maruthomkara",
    "Velom",
    "Narippatta",
    "Ayancherry",
    "Villiappally",
    "Maniyur",
    "Thiruvallur",
    "Thurayur",
    "Keezhariyur",
    "Thikkodi",
    "Meppayur",
    "Cheruvannur",
    "Nochad",
    "Changaroth",
    "Kayanna",
    "Koothali",
    "Perambra",
    "Chakkittappara",
    "Balusseri",
    "Naduvannur",
    "Atholi",
    "Ulliyeri",
    "Kottur",
    "Unnikulam",
    "Panangad",
    "Koorachundu",
    "Chemancherry",
    "Arikkulam",
    "Moodadi",
    "Changottukavu",
    "Kakkodi",
    "Chelannur",
    "Kakkur",
    "Nanminda",
    "Narikkuni",
    "Thalakulathur",
    "Thiruvampady",
    "Koodaranji",
    "Kizhakkoth",
    "Madavoor",
    "Puthuppady",
    "Thamarassery",
    "Omassery",
    "Kattippara",
    "Kodiyathur",
    "Kuruvattur",
    "Mavoor",
    "Karasseri",
    "Kunnamangalam",
    "Chathamangalam",
    "Kodencherry",
    "Peruvayal"
  ];

  WriteBatch batch = firestore.batch();

  for (String panchayath in kozhikodePanchayaths) {
    DocumentReference docRef = firestore.collection('panchayaths').doc();
    batch.set(docRef, {
      'name': panchayath,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  await batch.commit();
  print('Database initialized with Kozhikode panchayaths');
}
