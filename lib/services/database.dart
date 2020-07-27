import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:spacespinner/models/ss.dart';
import 'package:spacespinner/models/user.dart';
import 'package:spacespinner/screens/home/ss_list.dart';

    class DatabaseService {
      //collection reference

      final String uid;
      DatabaseService({this.uid});

      final CollectionReference ssCollection = Firestore.instance.collection(('spacespinner'));

      Future updateUserData(String name, String job, String location) async
      {
        return await ssCollection.document(uid).setData({
          'name':name,
          'job' :job,
          'location':location,
        });
      }

      List<SS> _SSListFromSnapshot (QuerySnapshot snapshot) {
        return snapshot.documents.map((doc) {
          return SS(
            name: doc.data['name'] ?? 'NA',
            job: doc.data['job'] ?? 'NA',
            location: doc.data['location'] ?? 'NA',
          );
        }).toList();
      }
      //User Data from Snapshots.

      UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
      {
        return UserData(
            uid: uid,
            name:snapshot.data['name'],
            job:snapshot.data['job'],
            location:snapshot.data['location'],
        );
      }


      // get collection
    Stream<List<SS> > get ss {
        return ssCollection.snapshots()
        .map(_SSListFromSnapshot);
    }

    Stream<UserData> get userData {
        return ssCollection.document((uid)).snapshots()
            .map(_userDataFromSnapshot);

    }

    }