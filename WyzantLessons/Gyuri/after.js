//Gyuri's After
function after(num, callback) {
    function afterCalled(num, callback) {
        return num
    }
    return callback
}


































//Gyuri's Problem: Not counting number of calls, not returning function, ...
function after(num, callback) {
    let count = 0
    return function(...args) {
        count++
        if(count >= num) return callback(...args)
    }
  }

const called = function(string) { return('hello ' + string); };
const afterCalled = after(3, called);
