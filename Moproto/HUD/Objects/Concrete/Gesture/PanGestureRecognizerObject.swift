import UIKit

struct PanGestureRecognizerObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIPanGestureRecognizer")
    var title: String = "pan_gesture_recognizer_title".localize
    var description: String = "pan_gesture_recognizer_description".localize
    var category: ObjectCategory = .gesture
    var type: NSItemProviderWriting = MoprotoGestureType(name: String(describing: UIPanGestureRecognizer.self))
}
