//
//  Geometry.swift
//  ar_scenekit
//
//  Created by 徐浩博 on 2020/2/22.
//  Copyright © 2020 徐浩博. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

public func get3dDis(_ p1: SCNVector3, _ p2: SCNVector3) -> CGFloat {
    let dx = p1.x - p2.x
    let dy = p1.y - p2.y
    let dz = p1.z - p2.z
    return CGFloat(abs(sqrt(pow(dx, 2) + pow(dy, 2) + pow(dz, 2))))
}


public func atanRotation(len1: Float, len2: Float) -> Float {
    if len2 == 0 {
        return Float.pi / 2
    }else {
        if len1 == 0{
            return 0
        }else {
            return atan(len1 / len2)
        }
    }
}


public func get2dDis(_ p1: CGPoint, _ p2: CGPoint) -> CGFloat {
    let dx = p1.x - p2.x
    let dy = p1.y - p2.y
    return CGFloat(abs(sqrt(pow(dx, 2) + pow(dy, 2))))
}


//public func atanRotation(len1: Float, len2: Float) -> Float {
//    if len2 == 0 {
//        return Float.pi / 2
//    }else {
//        if len1 == 0{
//            return 0
//        }else {
//            return atan(len1 / len2)
//        }
//    }
//}

public func linkTowNode(_ pos1: CGPoint, _ pos2: CGPoint, _ line: SKSpriteNode) {
    let dx = pos1.x - pos2.x
    let dy = pos1.y - pos2.y
    
    var rotate: Float = 0
    
    let center = CGPoint(x: (pos1.x + pos2.x) / 2, y: (pos1.y + pos2.y) / 2)
    line.position = CGPoint(x: center.x, y: center.y)
    
    line.size.height = get2dDis(pos1, pos2)
    
    if dx > 0 && dy > 0 {
        rotate = -atanRotation(len1: Float(dx), len2: Float(dy))
    }
    if dx < 0 && dy > 0 {
        rotate = atanRotation(len1: Float(-dx), len2: Float(dy))
    }
    if dx < 0 && dy < 0 {
        rotate = -atanRotation(len1: Float(-dx), len2: Float(-dy))
    }
    if dx > 0 && dy < 0 {
        rotate = atanRotation(len1: Float(dx), len2: Float(-dy))
    }
    if dy == 0 {
        rotate = Float.pi / 2
    }
    if dx == 0 {
        rotate = 0
    }
    
    line.zRotation = CGFloat(rotate)
}
