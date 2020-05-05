import React from "react";
import {LoginComponent} from "./components/LoginComponent";
import {SignupComponent} from "./components/SignupComponent";

class LoginSignupScreenState {
    signUp: boolean = false;
}

export class LoginSignupScreen extends React.Component<any, LoginSignupScreenState, any> {

    constructor(props: any) {
        super(props);

        this.state = new LoginSignupScreenState();

        this.loginClicked = this.loginClicked.bind(this);
        this.signUpClicked = this.signUpClicked.bind(this);
    }

    loginClicked() {
        this.setState({
            signUp: false
        });
    }

    signUpClicked() {
        this.setState({
            signUp: true
        });
    }

    render() {
        return <div>
            <span>
                <a onClick={this.loginClicked}>Login</a>
                <a onClick={this.signUpClicked}>Signup</a>
            </span>
            <div>
                {!this.state.signUp && <LoginComponent/>}
                {this.state.signUp && <SignupComponent/>}
            </div>
        </div>;
    }
}