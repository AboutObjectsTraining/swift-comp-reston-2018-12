import XCTest

class UnitTests: XCTestCase {

    func testFoo() {
        print("Foo")
        print("Foo")
    }
    
    func testKVC() {
        let person = Person()
        person.name = "Fred"
        person.dog = Dog()
        
        person.setValue("Frederick", forKey: "name")
        person.setValue("Collie", forKeyPath: "dog.breed")
        
        print(person)
        let values = person.dictionaryWithValues(forKeys: ["name", "dog"])
        print(values)
        
        let otherPerson = Person()
        otherPerson.setValuesForKeys(values)
        print(otherPerson)
    }
}
