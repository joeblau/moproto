import UIKit

struct CustomGestureRecognizerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIGestureRecognizer")
    var title: String = "custom_gesture_recognizer_title".localize
    var description: String = "custom_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIGestureRecognizer.self))
}
