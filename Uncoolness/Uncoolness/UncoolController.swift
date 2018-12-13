import UIKit

class UncoolController: UIViewController, UITextFieldDelegate
{
    var accessoryView: UIView!
    var contentView: UIView!
    var textField: UITextField!
    
    @objc func addCoolCell() {
        print("In \(#function), text is \(textField.text ?? "null")")
        addCell(text: textField.text)
    }
    
    // Add `recognizer` parameter
    @objc func bounce(recognizer: UITapGestureRecognizer) {
        print("In \(#function)")
        // Downcast and unwrap
        guard let cell = recognizer.view as? UncoolCell else { return }
        cell.animateBounce(duration: 1.0, size: CGSize(width: 120, height: 240), cell: cell)
    }
    
    func addCell(origin: CGPoint = .zero, text: String?, color: UIColor = .brown) {
        let newCell = UncoolCell()
        contentView.addSubview(newCell)
        newCell.frame.origin = origin
        newCell.text = text
        newCell.backgroundColor = color
        newCell.sizeToFit()
        // Add recognizer
        configureGestureRecognizers(cell: newCell)
    }
    
    // Add `cell` parameter
    private func configureGestureRecognizers(cell: UncoolCell) {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(bounce(recognizer:)))
        recognizer.numberOfTapsRequired = 2
        cell.addGestureRecognizer(recognizer)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("In \(#function)")
        textField.resignFirstResponder()
        return true
    }

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.brown
        
        let (accessoryRect, contentRect) = view.frame.divided(atDistance: 90, from: .minYEdge)
        accessoryView = UIView(frame: accessoryRect)
        contentView = UIView(frame: contentRect)
        
        contentView.clipsToBounds = true
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        // CoolViews
        addCell(origin: CGPoint(x: 20, y: 60), text: "Hello World! 🌎🌏🌍☀️", color: .purple)
        addCell(origin: CGPoint(x: 40, y: 120), text: "Cool Cells FTW! 🏆🏅🎖", color: .orange)
        
        // Controls
        textField = UITextField(frame: CGRect(x: 15, y: 50, width: 280, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter some text"
        accessoryView.addSubview(textField)
        
        textField.delegate = self
        
        let button = UIButton(type: .system)
        accessoryView.addSubview(button)
        
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame.origin = CGPoint(x: 305, y: 50)
        
        button.addTarget(self, action: #selector(addCoolCell), for: .touchUpInside)
   }
}

// MARK: - Animation
extension UncoolCell
{
    func animateFinishBounce(duration: TimeInterval, cell: UncoolCell) {
        UIView.animate(withDuration: duration) {
            cell.transform = .identity
        }
    }
    
    func configureBounce(size: CGSize, cell: UncoolCell) {
        UIView.setAnimationRepeatCount(3.5)
        UIView.setAnimationRepeatAutoreverses(true)
        
        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        cell.transform = translation.rotated(by: .pi / 2)
    }
    
    // Extra parameter, `cell`
    func animateBounce(duration: TimeInterval, size: CGSize, cell: UncoolCell) {
        UIView.animate(withDuration: duration,
                       animations: { cell.configureBounce(size: size, cell: cell) },
                       completion: { _ in cell.animateFinishBounce(duration: duration, cell: cell)  }
        )
    }
}


// MARK: - UIResponder methods
extension UncoolCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Downcast to filter out other types of views
        guard
            let touch = touches.first,
            let cell = touch.view as? UncoolCell else { return }
        
        superview?.bringSubviewToFront(self)
        cell.alpha = 0.5
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Downcast to filter out other types of views
        guard
            let touch = touches.first,
            let cell = touch.view as? UncoolCell else { return }
        
        let newLocation = touch.location(in: nil)
        let oldLocation = touch.previousLocation(in: nil)
        cell.center.x += newLocation.x - oldLocation.x
        cell.center.y += newLocation.y - oldLocation.y
    }
    
    private func finish(touch: UITouch?) {
        // Downcast to filter out other types of views
        guard
            let touch = touch,
            let cell = touch.view as? UncoolCell else { return }
        
        cell.alpha = 1.0
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        finish(touch: touches.first)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        finish(touch: touches.first)
    }
}
