import 'package:chatapp/helper/helperfunction.dart';
import 'package:chatapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class sigingooge {

  String email;
  String name;
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signupwithgoogle() async {
    final GoogleSignInAccount account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication = await account
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final AuthResult result = await _auth.signInWithCredential(credential);
    final FirebaseUser user = result.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    name = user.displayName;
    email = user.email;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
    Map<String, String> userDataMap = {
      "userName": name,
      "userEmail": email,
    };
    databaseMethods.addUserInfo(userDataMap);
    HelperFunctions.saveUserLoggedInSharedPreference(true);
    HelperFunctions.saveUserNameSharedPreference(name);
    HelperFunctions.saveUserEmailSharedPreference(email);

    final FirebaseUser currentuser = await _auth.currentUser();
    assert(user.uid == currentuser.uid);
    return 'Signin google Succeed $user';
  }

  void Signoutgoogle() async {
    await googleSignIn.signOut();
    print("Sign Out");
  }

  Future<String> Signingoogle() async {
    final GoogleSignInAccount account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication = await account
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final AuthResult result = await _auth.signInWithCredential(credential);
    final FirebaseUser user = result.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    name = user.displayName;
    email = user.email;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    HelperFunctions.saveUserLoggedInSharedPreference(true);

    final FirebaseUser currentuser = await _auth.currentUser();
    assert(user.uid == currentuser.uid);
    if(currentuser!=null){
      QuerySnapshot userInfoSnapshot =
      await DatabaseMethods().getUserInfo(email);

      HelperFunctions.saveUserLoggedInSharedPreference(true);
      HelperFunctions.saveUserNameSharedPreference(
          userInfoSnapshot.documents[0].data["userName"]);
      HelperFunctions.saveUserEmailSharedPreference(
          userInfoSnapshot.documents[0].data["userEmail"]);
    }
    return 'Signin google Succeed $user';
  }
}
