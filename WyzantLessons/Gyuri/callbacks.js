function after(num, callback) {
    return function(num) {
        num--
        if(num <= -1) callback()
    }
}

const called = (str) => `hello ${str}!`
const afterCalled = after(3, called)


//Gyuri's Problem: Not caching the result anywhere!
function once(callback) {
    let hasCalled = false
    let result = null
    function singleCall(...args) {
        if(!hasCalled) result = callback(args)
    }
    
    if(!hasCalled) singleCall()
    return result
} 

//After called doesn't exist! If you define a function but don't return or use it, it doesn't exist
function after(num, callback) {
    let count = 0
    return function(...args) {
      count++
      if(count >= num) return callback(...args)
    }
}

function delay(callback, waitMS) {
    return function() {
      setTimeout(callback, waitMS)
    }
}
  


//Gyuri's Problem: For Each needs to use for!

function forEach(arr, callback) {
    for(let i = 0; i < arr.length; i++) {
        callback(arr[i])
    }
}

let oldArr = [1, 2, 3]
function map(arr, callback) {
    let newArr = []
    forEach(arr, function(elem) {
        newArr.push(callback(elem))
    })
    return newArr
}

map([3, 4, 5], el => el - 2)