import UIKit

class CoolController: UIViewController
{
    override func loadView() {
        view = CoolView(frame: UIScreen.main.bounds)
    }
}




//extension CoolController
//{
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let newLocation = touch.location(in: nil)
//        let oldLocation = touch.previousLocation(in: nil)
//        touch.view?.center.x += newLocation.x - oldLocation.x
//        touch.view?.center.y += newLocation.y - oldLocation.y
//        //        bounds.origin.x += newLocation.x - oldLocation.x
//        //        bounds.origin.y += newLocation.y - oldLocation.y
//        //        setNeedsDisplay()
//    }
//}
