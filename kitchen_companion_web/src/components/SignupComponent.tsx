import React from "react";
import {userAuthentication} from "../infra/auth";

class SignupComponentState {
    email: string = "";
    password: string = "";
}

export class SignupComponent extends React.Component<any, SignupComponentState>{
    constructor(props: any) {
        super(props);

        this.state = new SignupComponentState();

        this.handleInputChange = this.handleInputChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    render() {
        return <div>
            <form onSubmit={this.handleSubmit}>
                <label>Signup to Kitchen</label>
                <label>
                    Email<br/>
                    <input type="text" name="email" onChange={this.handleInputChange}/><br/></label>
                <label>Password<br/>
                    <input type="password" name="password" onChange={this.handleInputChange}/><br/></label>
                <input type="submit" value="Login"/>
            </form>
        </div>;
    }

    handleInputChange(e: React.ChangeEvent<HTMLInputElement>) {
        const target = e.target;
        const value = target.value;

        if (target.name == "email") {
            this.setState({
                email: value
            });
        } else {
            this.setState({
                password: value
            });
        }
    }

    handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();

        userAuthentication.signUp(this.state.email, this.state.password).then((user) => {
            if (user != null) {
                console.log(`signup credential: ${user.email}|${user.id}`)
            }
        });
    }
}