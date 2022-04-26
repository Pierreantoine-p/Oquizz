console.log("--------------Echo Person");


//Use for encapsuling code : isolate code
//Everything in Class stay in Class !!!! 
//~Create Class
class Person {
    //~object created : instances
    firstName;
    lastName;
    age;
    //add for getters
    _pokemon;

    //to give an argument, we use a constructor
    //special METHOD !!!automatically called when INSTANCE is created donc dès qu'on met le mot "new"
    //c'est le constructeur qui est lancé
    //~constructor
    constructor(firstName, lastName, age) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;

    }

    //!SOLUTION 2 getters/setters IMPORTANT
    //permet de protéger notre code, pour ne pas rendre disponible en dehors des Class
    //~getters
    get pokemon() {
        return this._pokemon;
    }

    //~setters
    set pokemon(poke) {
        this._pokemon = poke;
    }
    //!

    //modern js, we cannot use Person class
    //We use this => current objetct
    //~methods
    sayHello() {
        console.log(`My Person is ${this.firstName} ${this.lastName} and I am ${this.age}`);
    }

}

//~export the module
//solution 1
/* export default Person; */
//solution 2
//new va permettre d'instancer une classe
//ici on parle alors de POO
const yumi2 = new Person('yumi', '---From Class---', 30);

//on peut ajouter une nouvelle propriété en faisant SOLUTION 1 DEPRECATED
/* yumi2.pokemon = 'pikachu';
console.log(yumi2); */


//ici on fait appel à la methode
/* console.log(yumi2.sayHello()); */ //ici on peut enlever le console.log car il y a déjà un console log dans la methode

yumi2.sayHello();
//~check for getters/setters
console.log(yumi2);
console.log(yumi2.pokemon);