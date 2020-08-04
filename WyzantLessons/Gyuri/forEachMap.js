//Gyuri's forEach
function forEach(element, index, arr) {
    console.log(element)
}

console.log(typeof forEach)
forEach(['a', 'b', 'c'], i => console.log(j))

function map(arr, callback) {
    let newArr = []
    forEach(arr, function(elem) {
        newArr.push(callback(elem))
    })
    return newArr
}

























//Gyuri's Problem: For Each needs to use for!

function fixedForEach(arr, callback) {
    for(let i = 0; i < arr.length; i++) {
        callback(arr[i])
    }
}

function fixedMap(arr, callback) {
    let newArr = []
    fixedForEach(arr, function(elem) {
        newArr.push(callback(elem))
    })
    return newArr
}

fixedMap([3, 4, 5], el => el - 2)