import 'dart:html';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

// Global var elements
InputElement toDoInput = querySelector('#to-do-input');
var addTodoBtn = querySelector('#add-todo');
var modal_overlay = querySelector('.modal__overlay');
var modal_content = querySelector('.modal__content');

//Create test user
var listTodo = ['Brushing teeth', 'Having breakfast', 'Go to school'];
User user = User("duongthienlee@gmail.com", "Thien Ly", "123456", listTodo);

void main() {
  // Open Welcome Modal
  modal_overlay.classes.add("open");
  modal_content.classes.add("open");

  // modal onClick handlers
  querySelector('#modal-btn-confirm')
      .onClick
      .listen(onClickConfirm); // login check

  addTodoBtn.onClick.listen(add_todo);

  print("hahha ${user.get_listTodo}");
}

//------------------------------ Onclick event handlers
void loginCheck(MouseEvent event) {
  String emailInput = (querySelector('#email') as InputElement).value;
  String pwdInput = (querySelector('#pwd') as InputElement).value;
  var outputInfo = querySelector('.login-info');

  if (emailInput == user.get_email && pwdInput == user.get_pwd) {
    onCloseModal(event); // close modal
    // Todo list rendering
    querySelector('#greeting').text =
        'Hello ${user.get_name}, Here are things to do:';

    todoListEle = querySelector('#todolist');
    user.get_todo_list;
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

void add_todo(Event e) {
  String inputValue = toDoInput.value;
  if (inputValue != '') {
    var newToDo = LIElement();
    newToDo.text = inputValue;
    user.add_new_todo(inputValue); // add to object User
    todoListEle.children.add(newToDo); // render
    toDoInput.value = ''; // reset input field
  } else {
    querySelector("#to-do-input-error").text = "Empty space is not allowed!";
  }
}

//------------------------------ Todo list -------------------------------------
Iterable<String> thingsTodo(listTodo) sync* {
  for (var todo in listTodo) {
    yield '$todo ';
  }
}

void addTodoItem(String item) {
  var listElement = LIElement();
  listElement.text = item;

  todoListEle.children.add(listElement);
}

UListElement todoListEle;

//------------------------------ User class ------------------------------------
class User {
  //field
  final String id = uuid.v1();
  String name;
  String email;
  String pwd;
  List listTodo;

  //Dart Constructor
  User(String email, String name, String pwd, List listTodo) {
    this.email = email;
    this.name = name;
    this.pwd = pwd;
    this.listTodo = listTodo;
  }

  //getters
  String get get_id {
    return this.id;
  }

  void get get_todo_list {
    thingsTodo(listTodo).forEach(addTodoItem);
  }

  List get get_listTodo {
    return this.listTodo;
  }

  String get get_email {
    return this.email;
  }

  String get get_pwd {
    return this.pwd;
  }

  String get get_name {
    return this.name;
  }

  void add_new_todo(String value) {
    this.listTodo.add(value);
  }
}
