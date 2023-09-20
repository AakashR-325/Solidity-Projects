// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] private todos;

    function create(string calldata _text, bool _completed) external {
        todos.push(Todo({text: _text, completed: _completed}));
    }

    function updateText(uint _i, string calldata _updatedText) external {
        todos[_i].text = _updatedText;
    }

    function get(uint _index) external view returns (Todo memory) {
        return (todos[_index]);
    }
}
