import PlaygroundSupport
import SpriteKit

public class CubeScene: SKScene {
    
    public var is2D = false
    
    public var nodes: [SKSpriteNode] = []
    public var lines: [SKSpriteNode] = []
    
    //交互控制变量
    public var rotateXaxis = true, rotateYaxis = true, rotateZaxis = true
    
    public func initNodes() {
        // node0 = self.childNode(withName: "node0") as! SKSpriteNode
        
        
        for i in 0..<12 {
            let temp = self.childNode(withName: "line\(i)") as! SKSpriteNode
            temp.color = UIColor(#colorLiteral(red: 0.776219666, green: 1, blue: 0.1951622963, alpha: 1))
            lines.append(temp)
        }
        
        for i in 0..<8 {
            nodes.append(self.childNode(withName: "node\(i)") as! SKSpriteNode)
        }
    }
    
    public override func sceneDidLoad() {
        handleP2Vector()
        initNodes()
        
        linkTowNode(nodes[0].position, nodes[1].position, lines[0])
    }
    
    
    
    public override func update(_ currentTime: TimeInterval) {
        
        for i in 0..<8 {
            let p3v = p3s[i]
            var p3mat:[[Double]] = p3vToMat(v: p3v)
            
            let distance = 2.0
            let z = 1.0 / (distance - p3v.z);
            let projection:[[Double]] = [
                [z, 0, 0],
                [0, z, 0],
            ]
            
            let rotationZ:[[Double]] = [
                [cos(cubeAngle), -sin(cubeAngle), 0],
                [sin(cubeAngle), cos(cubeAngle), 0],
                [0, 0, 1]
            ]
            
            let rotationX:[[Double]] = [
                [1, 0, 0],
                [0, cos(cubeAngle), -sin(cubeAngle)],
                [0, sin(cubeAngle), cos(cubeAngle)]
            ]
            
            let rotationY:[[Double]] = [
                [cos(cubeAngle), 0, sin(cubeAngle)],
                [0, 1, 0],
                [-sin(cubeAngle), 0, cos(cubeAngle)]
            ]
            
            if rotateXaxis {
                p3mat = matDot(a: rotationX, b: p3mat)
            }
            if rotateYaxis {
                p3mat = matDot(a: rotationY, b: p3mat)
            }
            if rotateZaxis {
                p3mat = matDot(a: rotationZ, b: p3mat)
            }
            
            let p2mat = matDot(a: projection, b: p3mat)
            
            
            if (is2D) {
                //二维生物
                nodes[i].position = CGPoint(x: p2mat[0][0], y: p3mat[1][0])
            }else {
                //三维生物 无距离
                nodes[i].position = CGPoint(x: p3mat[0][0], y: p3mat[1][0])
            }
        }
        
        linkAll()
        cubeAngle += 0.01
    }
    
    public func linkAll() {
        var index = 0
        for i in 0..<3 {
            linkTowNode(nodes[i].position, nodes[i+1].position, lines[index])
            index += 1
        }
        linkTowNode(nodes[3].position, nodes[0].position, lines[index])
        index += 1
        
        for i in 4...6 {
            linkTowNode(nodes[i].position, nodes[i+1].position, lines[index])
            index += 1
        }
        linkTowNode(nodes[7].position, nodes[4].position, lines[index])
        index += 1
        
        for i in 0..<4 {
            linkTowNode(nodes[i].position, nodes[i+4].position, lines[index])
            index += 1
        }
    }
}
