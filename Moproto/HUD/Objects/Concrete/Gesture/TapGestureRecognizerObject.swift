import UIKit

struct TapGestureRecognizerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UITapGestureRecognizer")
    var title: String = "tap_gesture_recognizer_title".localize
    var description: String = "tap_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: NSItemProviderWriting = MoprotoGestureType(name: String(describing: UITapGestureRecognizer.self))
}
