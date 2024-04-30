import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume_builder_twinkle/models/contact_info_model.dart';

const String COLLECTON_REF = "contact_information";

class ContactDatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _contactRef;

  ContactDatabaseService() {
    _contactRef =
        _firestore.collection(COLLECTON_REF).withConverter<ContactInfo>(
            fromFirestore: (snapshots, _) => ContactInfo.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (contact, _) => contact.toJson());
  }

  Stream<QuerySnapshot> getContactData() {
    return _contactRef.snapshots();
  }

  void add(ContactInfo contact) async {
    _contactRef.add(contact);
  }

  void update(String contactId, ContactInfo contact) {
    _contactRef.doc(contactId).update(contact.toJson());
  }

  void delete(String contactId) {
    _contactRef.doc(contactId).delete();
  }
}
