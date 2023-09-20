// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] private todos;

    function create(string calldata _text) external {
        todos.push(Todo({text: _text, completed: false}));
    }

    function updateText(uint _index, string calldata _updatedText) external {
        todos[_index].text = _updatedText;
    }

    function get(uint _index) external view returns (Todo memory) {
        return (todos[_index]);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
