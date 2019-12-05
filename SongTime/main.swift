import Foundation
import iTunesLibrary


let lib = try ITLibrary.init(apiVersion: "1.0")
var sum = 0
for item in lib.allMediaItems {
    if item.mediaKind == .kindSong {
        sum += item.totalTime
    }
}

func convertMilliseconds(ms: Int) -> (Int, Int, Int) {
    return (ms / 1000, (ms / 1000 / 60), (ms / 1000 / 3600)); //S, M, H
}

print(convertMilliseconds(ms: sum))

