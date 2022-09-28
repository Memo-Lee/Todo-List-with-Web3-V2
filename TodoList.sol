// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// error veriyor
contract TodoList {
    // struct metodu ile string text ve bool complated değişkenleri oluşturulur.
    struct Todo {
        string text;
        bool complated;
    }
    // Todo[] arrayini todos değişkenine atıyoruz ve public ediyoruz.
    // todos click olduğunda da dizinin elemanları getiriliyor.
    Todo[] public todos;
    function create(string calldata _text) external {
        todos.push(Todo({
            text:_text,
            complated:false
        }));
    }
    // yazılan text'i yeni text ile update etme işlemi
    function updateText(uint _index ,string calldata _text) external {
        // todos arrayindeki indexin textine _text'ini atama işlemi
        // 1. şekilde yapılan atama işlemlerideki gas ücreti : 35138 gas
        // todos[_index].text = _text;
        // todos[_index].text = _text;
        // todos[_index].text = _text;
        // todos[_index].text = _text;
        
        todos[_index].text = _text;

        // 2. şekilde yapılan atama işlemlerindeki gas ücreti : 34578 gas
        // Todo storage todo = todos[_index];
        // todo.text = _text;
        // todo.text = _text;
        // todo.text = _text;
        // todo.text = _text;
    }
    // yazılan text'i index sayısına görme döndürme functionu
    function get(uint _index) external view returns (string memory,bool){
        // storage - 29397
        // memory - 29480
        Todo memory todo = todos[_index];
        // example : updateText in input = ' 0,"learn Vyper" '
        return (todo.text,todo.complated);
    }
    function toggleCompleted(uint _index) external {
        todos[_index].complated = !todos[_index].complated;
    }
}


