//
//  Matextension.swift
//  ar_scenekit
//
//  Created by 徐浩博 on 2020/2/19.
//  Copyright © 2020 徐浩博. All rights reserved.
//

import Foundation

public func newMat(rows: Int, cols: Int) -> [[Double]] {
    let mat = [[Double]](repeating: [Double](repeating: 0, count: cols), count: rows)
    return mat
}

public func matAdd(a: [[Double]], b: [[Double]]) -> [[Double]] {
    let rows = a.count
    let cols = a[0].count
    var mat = [[Double]](repeating: [Double](repeating: 0, count: cols), count: rows)
    for row in 0..<rows {
        for col in 0..<cols {
            mat[row][col] = a[row][col] + b[row][col]
        }
    }
    return mat
}

public func matSub(a: [[Double]], b: [[Double]]) -> [[Double]] {
    let rows = a.count
    let cols = a[0].count
    var mat = [[Double]](repeating: [Double](repeating: 0, count: cols), count: rows)
    for row in 0..<rows {
        for col in 0..<cols {
            mat[row][col] = a[row][col] - b[row][col]
        }
    }
    return mat
}

public func matDot(a: [[Double]], b: [[Double]]) -> [[Double]] {
    let rowsA = a.count//SIZE_M
    let colsA = a[0].count//SIZE_N
    let colsB = b[0].count//SIZE_S
    
    var mat = newMat(rows: rowsA, cols: colsB)
    for i in 0..<rowsA {
        for j in 0..<colsB {
            for k in 0..<colsA {
                mat[i][j] += a[i][k] * b[k][j]
            }
        }
    }
    return mat
}

public func matDiv(a: [[Double]], b: [[Double]]) -> [[Double]] {
    let rows = a.count
    let cols = a[0].count
    var mat = [[Double]](repeating: [Double](repeating: 0, count: cols), count: rows)
    for row in 0..<rows {
        for col in 0..<cols {
            mat[row][col] = a[row][col] + b[row][col]
        }
    }
    return mat
}


public func p4vToMat(v: P4Vector) -> [[Double]] {
    var res = newMat(rows: 4, cols: 1)
    res[0][0] = v.x
    res[1][0] = v.y
    res[2][0] = v.z
    res[3][0] = v.w
    return res
}

public func p3vToMat(v: P3Vector) -> [[Double]] {
    var res = newMat(rows: 3, cols: 1)
    res[0][0] = v.x
    res[1][0] = v.y
    res[2][0] = v.z
    return res
}
