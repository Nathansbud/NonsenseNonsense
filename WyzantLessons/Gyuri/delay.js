//Gyuri's Delay: 
function delay(callback, theWaitTime) {
    function what(delayed) {
        return what
    }
    return delay
}








































//Gyuri's Problem: Not using setTimeout, not returning the delay function
function fixedDelay(callback, waitMS) {
    return function() {
      setTimeout(callback, waitMS)
    }
}
