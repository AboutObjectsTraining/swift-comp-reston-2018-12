import UIKit

class CoolView: UIView
{
    @IBOutlet weak var accessoryView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    static var cellNib = UINib(nibName: "CoolCell", bundle: nil)
    
    @IBAction func addCoolCell() {
        addCell(text: textField.text)
    }
    
    func addCell(text: String?) {
        guard let newCell = CoolView.cellNib.instantiate(withOwner: nil, options: nil).first as? CoolCell else { return }
        contentView.addSubview(newCell)
        newCell.text = text
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
