import UIKit

class CoolController: UIViewController
{
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.brown
        
        let subview1 = CoolCell(frame: CGRect(x: 20, y: 60, width: 120, height: 40))
        let subview2 = CoolCell(frame: CGRect(x: 40, y: 120, width: 120, height: 40))
        
        view.addSubview(subview1)
        view.addSubview(subview2)
        
        subview1.text = "Hello World! 🌎🌏🌍☀️"
        subview2.text = "Cool Cells FTW! 🏆🏅🎖"
        
        subview1.sizeToFit()
        subview2.sizeToFit()
        
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
    }
}
