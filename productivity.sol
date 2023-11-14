//This contract is purely for educational purpose, and should not be used it production is its security is not guaranteed
// SPDX-License-Identifier: MIT


pragma solidity 0.8.21;
 
contract Productivity {


// has variables to enter the task and mark if it is done
  struct Todo {
    string text;
    bool done;
  }
 
// we turned the struct to an array, callable by "todos,"?
  Todo[] public todos;


  function create(string memory _text) external {
// normally, ".push" pushes variables into an array
// we used this to create new tasks
    todos.push(Todo({
      text: _text,
// tasks are marked uncompleted until proven otherwise
      done: false
    }));
  }


// this is where we can mark completed tasks as done
  function checkDone(uint _index) external {
    todos[_index].done= !todos[_index].done;
  }


// update your tasks here  
  function updateText(uint _index, string memory _text) external {
    todos[_index].text = _text;
  }


// this is a getter function that returns the task, and whether or not it is done
  function get(uint _index) external view returns (string memory, bool) {
    Todo memory todo = todos[_index];
    return (todo.text, todo.done);
  }
}
