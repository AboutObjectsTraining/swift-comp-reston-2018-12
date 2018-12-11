struct Point: CustomStringConvertible {
    var x: Double
    var y: Double
    
    var description: String {
        return "x: \(x), y: \(y)"
    }
}

// MARK: - Size
struct Size: CustomStringConvertible {
    var width: Double
    var height: Double
    
    var description: String {
        return "width: \(width), height: \(height)"
    }
}

// MARK: - Rectangle
struct Rectangle {
    // Stored properties
    var origin: Point
    var size: Size
    
    var area: Double { return width * height }
    var center: Point {
        return Point(x: x + (width / 2.0),
                     y: y + (height / 2.0))
    }
    
    // Methods
    func offsetBy(dx: Double, dy: Double) -> Rectangle {
        let newOrigin = Point(x: x + dx, y: y + dy)
        return Rectangle(origin: newOrigin, size: size)
    }
}

extension Rectangle: CustomStringConvertible
{
    var description: String { return "\(origin), \(size)" }
}

// MARK: - Computed properties
extension Rectangle {
    var x: Double { return origin.x }
    var y: Double { return origin.y }
    var width: Double { return size.width }
    var height: Double { return size.height }
}
