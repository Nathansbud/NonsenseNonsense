import UIKit

extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font : font])
    }
}

let appNames = ["Calendar", "Notes", "Settings", "Games", "Media", "Transport", "Extras", "Docs", "Drive", "Instagram", "Messenger", "Mail", "Discord", "Messages", "FaceTime", "WhatsApp", "TV", "Health", "iTunes Store", "Google Maps"]

let uiNames = ["Vodafone IN", "3G", "11:56 AM", "66%"]

let fontSize: CGFloat = 5.2
let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .regular)
let font: UIFont
if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
    font = UIFont(descriptor: descriptor, size: fontSize)
} else {
    font = systemFont
}
for a in appNames {
    print(a, a.size(OfFont: font).width*0.352778, a.size(OfFont: font).height*0.352778)
}

for u in uiNames {
    print(u, u.size(OfFont: font).width*0.352778, u.size(OfFont: font).height*0.352778)
}

