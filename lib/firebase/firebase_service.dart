import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<UserCredential> register({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static CollectionReference<UserModel> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),

      toFirestore: (user, _) => user.toJson(),
    );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
    UserModel user = documentSnapshot.data()!;
    return user;
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
    //   "Users",
    // );
    // DocumentReference<Map<String, dynamic>> userDoc = usersCollection.doc(uid);
    // DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await userDoc
    //     .get();
    // return UserModel.fromJson(documentSnapshot.data()!);
    // ;
  }

  static CollectionReference<EventModel> getEventsCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
      fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
      toFirestore: (event, _) => event.toJson(),
    );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(EventModel event) {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    return eventDocument.set(event);
  }

  static Stream<List<EventModel>> getEventsFromFireStore(
      CategoryModel selectedCategory,) async* {
    //     CollectionReference<EventModel> eventsCollection =getEventsCollection();
    //    QuerySnapshot<EventModel> collectionSnapShot = await  eventsCollection.where("categoryId", isEqualTo: selectedCategory.id == "0"? null : selectedCategory.id).orderBy("dateTime", descending: false).get();
    //    List<EventModel> events = collectionSnapShot.docs.map((docSnapShot)=> docSnapShot.data()).toList();
    // return events;
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    Stream<QuerySnapshot<EventModel>> collectionSnapshots =
    await eventsCollection
        .where(
      "categoryId",
      isEqualTo: selectedCategory.id == "0"
          ? null
          : selectedCategory.id,
    )
        .orderBy("dateTime", descending: false)
        .snapshots();

    Stream<List<EventModel>> events = collectionSnapshots.map(
          (querySnapshot) =>
          querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
    );
    yield* events;
  }


  static Future<void> addEventToFavourite(EventModel event) {
    UserModel currentUser = UserModel.loggedInUser!;
    currentUser.favouriteEventsIds.add(event.id);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(
        currentUser.id);
    return userDocument.set(currentUser);
  }


  static removeEventFromFavourite(EventModel event) {
    UserModel currentUser = UserModel.loggedInUser!;
    currentUser.favouriteEventsIds.remove(event.id);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(
        currentUser.id);
    return userDocument.set(currentUser);
  }


  static Future<List<EventModel>>getFavouriteEvents() async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    QuerySnapshot<EventModel> collectionSnapShot = await eventsCollection
        .orderBy("dateTime", descending: false).get();
    List<EventModel> events = collectionSnapShot.docs.map((docSnapShot) =>
        docSnapShot.data()).toList();



    List<EventModel> favouriteEvents = events.where((event) =>
        UserModel.loggedInUser!.favouriteEventsIds.contains(event.id)).toList();

    return favouriteEvents;
  }
}

/// Muhammed saad -> 1
/// ali -> 2,
/// moo -> 3,
