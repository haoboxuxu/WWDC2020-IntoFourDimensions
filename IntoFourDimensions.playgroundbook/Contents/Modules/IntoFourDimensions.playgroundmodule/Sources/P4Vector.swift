//
//  V4.swift
//  ar_scenekit
//
//  Created by 徐浩博 on 2020/2/20.
//  Copyright © 2020 徐浩博. All rights reserved.
//

import Foundation
import SceneKit

public var angle: Double = 0
public var a = 0
public var distance = 2.0
public var taped: Bool = false


public class P4Vector {
    public var x: Double = 0
    public var y: Double = 0
    public var z: Double = 0
    public var w: Double = 0
    public init(_ x:Double, _ y:Double, _ z:Double, _ w:Double) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
}
public var p4s:[P4Vector] = []

public func handleP4Vector() {
    //0-7
    p4s.append(P4Vector(-0.5, -0.5, -0.5, 0.5))
    p4s.append(P4Vector(0.5, -0.5, -0.5, 0.5))
    p4s.append(P4Vector(0.5, 0.5, -0.5, 0.5))
    p4s.append(P4Vector(-0.5, 0.5, -0.5, 0.5))
    p4s.append(P4Vector(-0.5, -0.5, 0.5, 0.5))
    p4s.append(P4Vector(0.5, -0.5, 0.5, 0.5))
    p4s.append(P4Vector(0.5, 0.5, 0.5, 0.5))
    p4s.append(P4Vector(-0.5, 0.5, 0.5, 0.5))
    //8-15
    p4s.append(P4Vector(-0.5, -0.5, -0.5, -0.5))
    p4s.append(P4Vector(0.5, -0.5, -0.5, -0.5))
    p4s.append(P4Vector(0.5, 0.5, -0.5, -0.5))
    p4s.append(P4Vector(-0.5, 0.5, -0.5, -0.5))
    p4s.append(P4Vector(-0.5, -0.5, 0.5, -0.5))
    p4s.append(P4Vector(0.5, -0.5, 0.5, -0.5))
    p4s.append(P4Vector(0.5, 0.5, 0.5, -0.5))
    p4s.append(P4Vector(-0.5, 0.5, 0.5, -0.5))
}
