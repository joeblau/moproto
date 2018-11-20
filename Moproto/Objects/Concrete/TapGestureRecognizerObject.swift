import UIKit

struct TapGestureRecognizerObject: Object {
    var image: UIImage = #imageLiteral(resourceName: "UITapGestureRecognizer")
    var title: String = "tap_gesture_recognizer_title".localize
    var description: String = "tap_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UITapGestureRecognizer.self))
}
