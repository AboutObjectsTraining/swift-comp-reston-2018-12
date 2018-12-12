import UIKit

class CoolController: UIViewController
{
    override func loadView() {
        view = CoolView(frame: UIScreen.main.bounds)
//        view.backgroundColor = UIColor.brown
//        
//        let subview1 = CoolCell(frame: CGRect(x: 20, y: 60, width: 120, height: 40))
//        let subview2 = CoolCell(frame: CGRect(x: 40, y: 120, width: 120, height: 40))
//
//        view.addSubview(subview1)
//        view.addSubview(subview2)
//
//        subview1.text = "Hello World! 🌎🌏🌍☀️"
//        subview2.text = "Cool Cells FTW! 🏆🏅🎖"
//
//        subview1.sizeToFit()
//        subview2.sizeToFit()
//
//        subview1.backgroundColor = UIColor.purple
//        subview2.backgroundColor = UIColor.orange
    }
    
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

}
