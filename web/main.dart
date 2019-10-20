import 'dart:html';

// Global var elements
var modal_overlay = querySelector('.modal__overlay');
var modal_content = querySelector('.modal__content');
//Create test user
User user = User("duongthienlee@gmail.com", "Thien Ly", "123456");

void main() {
  // Open Welcome Modal
  modal_overlay.classes.add("open");
  modal_content.classes.add("open");

  // modal onClick handlers
  querySelector('#modal-btn-confirm')
      .onClick
      .listen(onClickConfirm); // login check
}

void loginCheck(MouseEvent event) {
  String emailInput = (querySelector('#email') as InputElement).value;
  String pwdInput = (querySelector('#pwd') as InputElement).value;
  var outputInfo = querySelector('.login-info');

  if (emailInput == user.get_email && pwdInput == user.get_pwd) {
    onCloseModal(event); // close modal
    // Todo list rendering
    querySelector('#greeting').text = 'Hello ${user.get_name}, Things to do:';
    todoList = querySelector('#todolist');
    thingsTodo().forEach(addTodoItem);
  } else {
    outputInfo.classes.add("error");
    outputInfo.text = "Email or password is wrong";
  }
}

void onCloseModal(MouseEvent event) {
  modal_overlay.classes.remove("open");
  modal_content.classes.remove("open");
  modal_overlay.classes.add("closed");
  modal_content.classes.add("closed");
}

void onClickConfirm(MouseEvent event) {
  loginCheck(event);
}

Iterable<String> thingsTodo() sync* {
  var actions = ['Brushing teeth', 'Having breakfast', 'Go to school'];

  for (var action in actions) {
    yield '$action ';
  }
}

void addTodoItem(String item) {
  print(item);

  var listElement = LIElement();
  listElement.text = item;
  todoList.children.add(listElement);
}

UListElement todoList;

class User {
  //field
  String name;
  String email;
  String pwd;

  //Dart Constructor
  User(String email, String name, String pwd) {
    this.email = email;
    this.name = name;
    this.pwd = pwd;
  }

  //getters
  String get get_email {
    return this.email;
  }

  String get get_pwd {
    return this.pwd;
  }

  String get get_name {
    return this.name;
  }
}
