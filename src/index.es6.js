class Cat {
  constructor(name) {
    console.log('hello');
    this.name = name;
  }

  speak() {
    console.log(this.name);
  }
}

var add = require('./add.es6.js');

var result = add(1, 2);

console.log(result);

var cat = new Cat('Joe');
cat.speak();
