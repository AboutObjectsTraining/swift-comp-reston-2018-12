import Foundation

class Person: NSObject
{
    @objc var name: String?
    @objc var dog: Dog?
    
    override var description: String {
        return "\(name ?? "Unknown"), dog's breed is \(dog?.breed ?? "null")"
    }
}


class Dog: NSObject
{
    @objc var breed: String?
    
    override var description: String {
        return breed ?? "Unknown"
    }
}
