import UIKit

class CoolView: UIView
{
    var accessoryView: UIView!
    var contentView: UIView!
    var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.brown
        configureSubviews(frame)
        configureControls()
        configureCells()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureControls() {
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
    
    func configureSubviews(_ frame: CGRect) {
        let (accessoryRect, contentRect) = frame.divided(atDistance: 90, from: .minYEdge)
        accessoryView = UIView(frame: accessoryRect)
        contentView = UIView(frame: contentRect)
        
        contentView.clipsToBounds = true
        
        addSubview(accessoryView)
        addSubview(contentView)
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    func configureCells() {
        addCell(origin: CGPoint(x: 20, y: 60), text: "Hello World! 🌎🌏🌍☀️", color: .purple)
        addCell(origin: CGPoint(x: 40, y: 120), text: "Cool Cells FTW! 🏆🏅🎖", color: .orange)
    }
    
    @objc func addCoolCell() {
        print("In \(#function), text is \(textField.text ?? "null")")
        addCell(text: textField.text)
    }
    
    func addCell(origin: CGPoint = .zero, text: String?, color: UIColor = .brown) {
        let newCell = CoolCell()
        contentView.addSubview(newCell)
        newCell.frame.origin = origin
        newCell.text = text
        newCell.backgroundColor = color
    }
}

extension CoolView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("In \(#function)")
        textField.resignFirstResponder()
        return true
    }
}
