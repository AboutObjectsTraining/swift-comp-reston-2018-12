import UIKit

class CoolView: UIView
{
    var accessoryView: UIView!
    var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.brown
        configureSubviews(frame)
        configureCells()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews(_ frame: CGRect) {
        let (accessoryRect, contentRect) = frame.divided(atDistance: 90, from: .minYEdge)
        accessoryView = UIView(frame: accessoryRect)
        contentView = UIView(frame: contentRect)
        addSubview(accessoryView)
        addSubview(contentView)
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.7)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    func configureCells() {
        addCell(origin: CGPoint(x: 20, y: 60), text: "Hello World! 🌎🌏🌍☀️", color: .purple)
        addCell(origin: CGPoint(x: 40, y: 120), text: "Cool Cells FTW! 🏆🏅🎖", color: .orange)
    }
    
    func addCell(origin: CGPoint = .zero, text: String, color: UIColor = .brown) {
        let newCell = CoolCell()
        contentView.addSubview(newCell)
        newCell.frame.origin = origin
        newCell.text = text
        newCell.backgroundColor = color
        newCell.sizeToFit()
    }
}
