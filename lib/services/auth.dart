import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacespinner/models/user.dart';
import 'package:spacespinner/services/database.dart';

    class AuthService{

      final FirebaseAuth _auth = FirebaseAuth.instance;
      
      // User obj based on FirebaseUser
      
      User _userFromFirebaseUser(FirebaseUser user)
      {
        return user != null ? User(uid: user.uid) : null; 
      }

      Stream<User> get user {
        return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
      }

      //sign in anonymously
    Future signInAnon() async
    {
      try{
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        return _userFromFirebaseUser(user);
      }
      catch (e)
      {
        print(e.toString());
        return null;
      }
    }


      Future registerWithEmail(String email, String password, String name, String job, String location) async {
        try{
          AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          FirebaseUser user = result.user;
          await DatabaseService(uid:user.uid).updateUserData(name, job, location);
          return _userFromFirebaseUser(user);
        }
        catch(e)
        {
          print(e.toString());
          return null;
        }
      }

      Future<String> getCurrentUID() async{
        final FirebaseUser user = await _auth.currentUser();
        final String uid = user.uid;
        return uid;

        if (user.isEmailVerified) return user.uid;
        return null;
      }

      Future<String> verifyUser() async{
        final FirebaseUser user = await _auth.currentUser();
        if (user.isEmailVerified) {
          return user.uid;
        }
        return null;
      }

      Future signinWithEmail(String email, String password) async {
        try{
          AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
          await result.user.sendEmailVerification();
          FirebaseUser user = result.user;
          return _userFromFirebaseUser(user);
        }
        catch(e)
        {
          print(e.toString());
          return null;
        }
      }

      Future forgotEmailPassword(String email) async {
        try{
          print(email);
          await _auth.sendPasswordResetEmail(email: email);
          return true;
        }
        catch(e)
        {
          return false;
        }
      }

    Future signOut() async {
        try {
          return await _auth.signOut();
        }
        catch(e)
      {
        print(e.toString());
        return null;
      }
    }

    }