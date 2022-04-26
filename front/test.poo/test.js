//POO course O'clock 2022
console.log("----------------Echo Test");


/**
 * DEPRECATED
 */
const user = {
    firstName: 'Yumi',
    lastName: '---From test---',
    age: 30,
    //^INIT
    init() {
        user.sayHello();
    },
    //^METHOD
    sayHello() {
        console.log(`My user is ${user.firstName} ${user.lastName} and I am ${user.age}`);
    }
};

user.init();