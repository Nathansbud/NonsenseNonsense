//Gyuri's Once
function once(x) {
    function nums(y) {
        if(!hasCalled) {
            return y
        }
    }
    return x
}








































//Gyuri's Problem: Not caching the result anywhere!
function fixedOnce(callback) {
    let hasCalled = false
    let result = null
    function singleCall(...args) {
        if(!hasCalled) result = callback(args)
    }
    
    if(!hasCalled) singleCall()
    return result
} 