import UIKit

struct PinchGestureRecognizerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIPinchGestureRecognizer")
    var title: String = "pinch_gesture_recognizer_title".localize
    var description: String = "pinch_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: MoprotoObjectType = MoprotoObjectType(name: String(describing: UIPinchGestureRecognizer.self))
}
