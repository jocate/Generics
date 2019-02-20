import UIKit

struct CountedSet<Element> : ExpressibleByArrayLiteral where Element : Hashable {
    
    private var elementDict: [Element: Int] = [:]
    
    init(arrayLiteral elements: Element...) {
        
        for e in elements {
            self.insert(type: e)
        }
       
    }
 
  
    init(elementDict: [Element: Int]) {
        self.elementDict = elementDict
       
    }
    
    // Insert
    
    mutating func insert(type: Element) {
        
        if let value = elementDict[type] {
            elementDict[type] = value + 1
        } else {
            elementDict[type] = 1
        }
    }
    
 
    // Remove
    
    mutating func remove(type: Element) -> Int {
        if let value = elementDict[type] {
            elementDict[type] = value - 1
            return elementDict[type]!
        } else {
            return 0
        }
    }
    
    subscript(_ member: Element) -> Int {
        if let value = elementDict[member] {
            return value
        } else {
            return 0
        }
    }
    
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(type: .iron) // 3
myCountedSet.remove(type: .dwarvish) // 0
myCountedSet.remove(type: .magic) // 0
myCountedSet.insert(type: .elven)
myCountedSet[.elven]
