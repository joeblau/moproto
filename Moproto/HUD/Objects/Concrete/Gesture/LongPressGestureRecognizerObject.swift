import UIKit

struct LongPressGestureRecognizerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UILongPressGestureRecognizer")
    var title: String = "long_press_gesture_recognizer_title".localize
    var description: String = "long_press_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: NSItemProviderWriting = MoprotoGestureType(name: String(describing: UILongPressGestureRecognizer.self))
}
