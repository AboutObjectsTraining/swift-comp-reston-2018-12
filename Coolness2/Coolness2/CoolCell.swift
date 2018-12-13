import UIKit

private let textInsets = UIEdgeInsets(top: 7, left: 12, bottom: 8, right: 12)
private let textOrigin = CGPoint(x: 12, y: 7)

@IBDesignable
class CoolCell: UIView
{
    @IBInspectable var text: String? {
        didSet { sizeToFit() }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    private var highlighted: Bool = false {
        didSet {
            alpha = highlighted ? 0.5 : 1.0
        }
    }
    
    static let textAttributes: [NSAttributedString.Key: Any] = [.font:  UIFont.boldSystemFont(ofSize: 20),
                                                                .foregroundColor: UIColor.white]
    
    private func configureLayer() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func configureGestureRecognizers() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        recognizer.numberOfTapsRequired = 2
        addGestureRecognizer(recognizer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // TODO: Consider doing this in IB
        configureLayer()
        // FIXME: Consider doing this in IB
        configureGestureRecognizers()
    }
}

// MARK: - Core Animation
extension CoolCell
{
    @objc func bounce() {
        print("In \(#function)")
        animateBounce(duration: 1.0, size: CGSize(width: 120, height: 240))
    }
    
    func animateFinishBounce(duration: TimeInterval) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.transform = .identity
        }
    }
    
    func configureBounce(size: CGSize) {
        UIView.setAnimationRepeatCount(3.5)
        UIView.setAnimationRepeatAutoreverses(true)
        
        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        transform = translation.rotated(by: .pi / 2)
    }
    
    func animateBounce(duration: TimeInterval, size: CGSize) {
        UIView.animate(withDuration: duration,
                       animations: { [weak self] in self?.configureBounce(size: size) },
                       completion: { [weak self] _ in self?.animateFinishBounce(duration: duration)  }
        )
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
//        bounds.origin.x += newLocation.x - oldLocation.x
//        bounds.origin.y += newLocation.y - oldLocation.y
//        setNeedsDisplay()
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
