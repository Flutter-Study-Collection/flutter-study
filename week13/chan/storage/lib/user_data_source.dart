class UserDataSource {
  UserDataSource();
  CollectionReference ref = FirebaseFirestore.instance.collection('user');

  Future read({required String customerId, required String name}) =>
      ref.doc(customerId).set({}, SetOptions(merge: true));

  Future update({required String customerId, required String name}) => ref.doc(customerId).set({{'name': name}}, SetOptions(merge: true));

  Stream<UserFs?> streamUser(String customerId) => ref
      .doc(customerId)
      .withConverter<UserFs>(
    fromFirestore: (snapshot, _) =>
        UserFs.fromDocument(snapshot.data()!),
    toFirestore: (model, _) => model.toJson(),
  )
      .snapshots()
      .map((event) {
    Log(usePretty: false).d('event.data(): ${event.data()}');
    return event.data();
  });
}