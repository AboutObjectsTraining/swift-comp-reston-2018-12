import UIKit

private let textInsets = UIEdgeInsets(top: 7, left: 12, bottom: 8, right: 12)
private let textOrigin = CGPoint(x: 12, y: 7)

class CoolCell: UIView
{
    var text: String?
    
    private var highlighted: Bool = false {
        didSet {
            alpha = highlighted ? 0.5 : 1.0
        }
    }
    
    static let textAttributes: [NSAttributedString.Key: Any] = [.font:  UIFont.boldSystemFont(ofSize: 20),
                                                                .foregroundColor: UIColor.white]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Custom drawing and resizing
extension CoolCell
{
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        var newSize = (text as NSString).size(withAttributes: CoolCell.textAttributes)
        newSize.width += textInsets.left + textInsets.right
        newSize.height += textInsets.top + textInsets.bottom
        return newSize
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        (text as NSString).draw(at: textOrigin, withAttributes: CoolCell.textAttributes)
    }
}

// MARK: - UIResponder methods
extension CoolCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.bringSubviewToFront(self)
        highlighted = true
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let newLocation = touch.location(in: nil)
        let oldLocation = touch.previousLocation(in: nil)
        center.x += newLocation.x - oldLocation.x
        center.y += newLocation.y - oldLocation.y
    }
    
    private func finish(touch: UITouch?) {
        highlighted = false
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        finish(touch: touches.first)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        finish(touch: touches.first)
    }
}
