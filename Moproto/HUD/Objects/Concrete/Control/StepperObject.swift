import UIKit

struct StepperObject: HUDItem {
    var image: UIImage = #imageLiteral(resourceName: "UIStepper")
    var title: String = "stepper_title".localize
    var description: String = "stepper_description".localize
    var category: ObjectCategory = .control
    var type: NSItemProviderWriting = MoprotoControlType(name: String(describing: UIStepper.self))
}
