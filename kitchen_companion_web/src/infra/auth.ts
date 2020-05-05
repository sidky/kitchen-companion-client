import {auth} from "./firebase";
import {User} from "../model/user";
import firebase from "firebase";

class Authentication {
    currentUser() {
        const cu = auth.currentUser;

        if (cu != null) {
            return Authentication.toUser(cu);
        }
    }

    public signIn(email: string, password: string): Promise<User | null> {
        return auth.signInWithEmailAndPassword(email, password).then((credential) => {
            if (credential.user != null) {
                return Authentication.toUser(credential.user);
            } else {
                return null;
            }
        });
    }

    public signUp(email: string, password: string): Promise<User | null> {
        return auth.createUserWithEmailAndPassword(email, password).then((credential) => {
            if (credential.user != null) {
                return Authentication.toUser(credential.user);
            } else {
                return null;
            }
        });
    }

    private static toUser(user: firebase.User): (User | null) {
        const email = user.email;

        if (email != null) {
            return new User(user.uid, email);
        } else {
            return null;
        }
    }
}

export const userAuthentication = new Authentication();