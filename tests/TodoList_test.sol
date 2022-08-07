// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/TodoList.sol";

contract TodoListTest {

    TodoList todoListTest;
    function beforeEach () public {
        todoListTest = new TodoList();
    }

    // 增加單一項目
    function checkAddTodoTest () public {
        todoListTest.addTodo("A");
        Assert.equal(todoListTest.getAllTodo().length, 1, "add todo item failed");
    }

    // 移除項目
    function checkDelTodoTest () public {
        todoListTest.addTodo("A");
        todoListTest.addTodo("B");
        todoListTest.delTodo(0);
        Assert.equal(todoListTest.getTodo(0), "B", "not B");
        Assert.equal(todoListTest.getAllTodo().length, 1, "delete todo item failed");
    }

    // 搬到 completed + 清空 Completed
    function checkAddandClearCompletedTest () public  {
        todoListTest.addTodo("A");
        todoListTest.addTodo("B");
        todoListTest.toCompleted(0);
        todoListTest.toCompleted(0);
        Assert.equal(todoListTest.getAllCompleted().length, 2, "move to completed failed");
        
        todoListTest.clearCompleted();
        Assert.equal(todoListTest.getAllCompleted().length, 0, "clear completed failed");
    }
    
    // 增加 Pending 最多滯留 n 秒 ，n 秒內移動 (成功移動，給予255秒 live pending time)
    function checkToPendingTest () public {
        todoListTest.updatePendingExpiredTime(uint8(255));
        todoListTest.addTodo("A");
        todoListTest.toPending(0);

        Assert.equal(todoListTest.getAllPending().length, 1, "to pending failed");
        Assert.equal(todoListTest.getAllTodo().length, 0, "move todo failed");

        todoListTest.backToTodos(0);
        Assert.equal(todoListTest.getAllPending().length, 0, "move pending failed");
        Assert.equal(todoListTest.getAllTodo().length, 1, "to todo failed");
    }


    // 增加 Pending 最多滯留 n 秒 ，n 秒後才移動則不可移動 (測試凍結，直接給予0秒 live pending time)
    function checkToPendingFreezeTest () public {
        todoListTest.updatePendingExpiredTime(0); // 禁止timeoffset , 0秒表示直接過期
        
        todoListTest.addTodo("A");
        todoListTest.toPending(0);

        Assert.equal(todoListTest.getAllPending().length, 1, "to pending failed");
        Assert.equal(todoListTest.getAllTodo().length, 0, "move todo failed");

        todoListTest.backToTodos(0);
        Assert.equal(todoListTest.getAllPending().length, 1, "Error move pending"); // 不可以移動
        Assert.equal(todoListTest.getAllTodo().length, 0, "Error move to todo list"); // 不可以移動
    }
}