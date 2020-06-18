import Foundation


public var cubeAngle: Double = 0

public class P3Vector {
    public var x: Double = 0
    public var y: Double = 0
    public var z: Double = 0
    
    public init(_ x:Double, _ y:Double,  _ z:Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}

public var p3s:[P3Vector] = []

public func handleP2Vector() {
    p3s.append(P3Vector(-100, -100, -100))
    p3s.append(P3Vector(100, -100, -100))
    p3s.append(P3Vector(100, 100, -100))
    p3s.append(P3Vector(-100, 100, -100))
    
    p3s.append(P3Vector(-100, -100, 100))
    p3s.append(P3Vector(100, -100, 100))
    p3s.append(P3Vector(100, 100, 100))
    p3s.append(P3Vector(-100, 100, 100))
}
