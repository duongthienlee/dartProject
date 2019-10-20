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
  modal_overlay.onClick.listen(onCloseModal);
  querySelector('#modal-btn-confirm')
      .onClick
      .listen(onClickConfirm); // login check
}

void loginCheck(MouseEvent event) {
  String emailInput = (querySelector('#email') as InputElement).value;
  String pwdInput = (querySelector('#pwd') as InputElement).value;
  var outputInfo = querySelector('.login-info');

  print("user.get_pwd: ${user.get_pwd}");
  print("pwdInput: ${pwdInput}");

  if (emailInput == user.get_email && pwdInput == user.get_pwd) {
    outputInfo.classes.add("success");
    outputInfo.text = 'Hello ' + user.get_name;

    // onCloseModal(event);
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

// usage of class, setters/getters, List, String, For loop
class ToDoList {
  //field
  var todo = List();

  //getters
  String get list_todo {
    String result = "Todos List:\n";
    for (var i = 0; i < todo.length; i++) {
      String br =
          i != (todo.length - 1) ? "\n" : ""; // Add break line except last item
      result += "${todo[i]}${br}";
    }
    return result;
  }

  //setters
  set add_todo(String todo) {
    this.todo.add(todo);
  }
}

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
