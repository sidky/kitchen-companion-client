import React from "react";
import {userAuthentication} from "../infra/auth";

class LoginComponentState {
    email: string = "";
    password: string = "";
}

export class LoginComponent extends React.Component<any, LoginComponentState, any> {

    constructor(props: any) {
        super(props);

        this.state = {
            email: '',
            password: ''
        };

        this.handleInputChange = this.handleInputChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInputChange(e: React.ChangeEvent<HTMLInputElement>) {
        e.preventDefault();

        const target = e.target;
        const value = target.value;

        if (target.name == "email") {
            console.log(`this: ${this}`);
            this.setState({
                email: value
            });
        } else {
            this.setState({
                password: value
            });
        }
    }

    render() {
        return <div>
            <form onSubmit={this.handleSubmit}>
                <label>Login to Kitchen</label>
                <label>
                Email<br/>
                <input type="text" name="email" onChange={this.handleInputChange}/><br/></label>
                <label>Password<br/>
                    <input type="password" name="password" onChange={this.handleInputChange}/><br/></label>
                <input type="submit" value="Login"/>
            </form>
        </div>;
    }

    handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();
        userAuthentication.signIn(this.state.email, this.state.password).then((user) => {
            if (user != null) {
                console.log(`credential: ${user.email}|${user.id}`)
            }
        });
    };
}