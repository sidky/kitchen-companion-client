export class User {
    readonly  id: string;
    readonly email: string;

    constructor(id: string, email: string) {
        this.id = id;
        this.email = email;
    }
}