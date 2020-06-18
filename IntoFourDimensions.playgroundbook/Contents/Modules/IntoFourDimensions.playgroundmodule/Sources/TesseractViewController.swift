import SceneKit
import UIKit

public class TesseractViewController: UIViewController, SCNSceneRendererDelegate {
    //public var sceneView = SCNView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width/2,height: UIScreen.main.bounds.height))
    public var sceneView = SCNView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width/2,height: UIScreen.main.bounds.height))
    
    var sphereNodes:[SCNNode] = []
    var lineNodes:[SCNNode] = []
    var lines:[SCNCylinder] = []
    
    var hcScene = SCNScene(named: "hypercube.scn")
    
    //交互控制变量
    public var rotateXYaxis = true, rotateZWaxis = true
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        sceneView.allowsCameraControl = true
        view.addSubview(sceneView)
        sceneView.scene = hcScene
        sceneView.delegate = self
        sceneView.isPlaying = true
        sceneView.loops = true
        
        DispatchQueue.main.async {
            self.initNodes()
        }
    }
    
    
    public func initNodes() {
        for i in 0..<16 {
            guard let node = hcScene!.rootNode.childNode(withName: "sphere\(i)", recursively: true) else {return}
            sphereNodes.append(node)
        }
        
        for i in 0..<32 {
            guard let node = hcScene!.rootNode.childNode(withName: "cylinder\(i)", recursively: true) else {return}
            lineNodes.append(node)
            lines.append(node.geometry as! SCNCylinder)
        }
    }
    
    
    
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if a <= 120 {
//            distance += 0.01
        }
        if a > 120 {
//            distance -= 0.01
        }
        for i in 0..<16 {
            let p4v = p4s[i]
            var p4mat = p4vToMat(v: p4v)
            let w = 1.0 / (distance - p4v.w);
            
            let projection:[[Double]] = [
                [w, 0, 0, 0],
                [0, w, 0, 0],
                [0, 0, w, 0]
            ]
            
            let rotationZW:[[Double]] = [
                [1, 0, 0, 0],
                [0, 1, 0, 0],
                [0, 0, cos(angle), -sin(angle)],
                [0, 0, sin(angle), cos(angle)]
            ]
            
            let rotationXY:[[Double]] = [
                [cos(angle), -sin(angle), 0, 0],
                [sin(angle), cos(angle), 0, 0],
                [0, 0, 1, 0],
                [0, 0, 0, 1]
            ]
            
            if rotateXYaxis {
                p4mat = matDot(a: rotationXY, b: p4mat)
            }
            if rotateZWaxis {
                p4mat = matDot(a: rotationZW, b: p4mat)
            }
            
            let p3mat = matDot(a: projection, b: p4mat)
            sphereNodes[i].position = SCNVector3(p3mat[0][0], p3mat[1][0], p3mat[2][0])
        }
        linkAllNodes()
        
        a += 1
        if a == 240 {
            a = 0
        }
        angle += 0.01
    }
    
    func linkAllNodes() {
        var index = 0
        for i in 0..<3 {
            linkTwoNodes(sphereNodes[i], sphereNodes[i+1], lineNodes[index], lines[index])
            index += 1
        }
        linkTwoNodes(sphereNodes[3], sphereNodes[0], lineNodes[index], lines[index])
        index += 1
        
        
        for i in 0..<3 {
            linkTwoNodes(sphereNodes[i+4], sphereNodes[i+5], lineNodes[index], lines[index])
            index += 1
        }
        linkTwoNodes(sphereNodes[7], sphereNodes[4], lineNodes[index], lines[index])
        index += 1
        
        
        for i in 0..<4 {
            linkTwoNodes(sphereNodes[i], sphereNodes[i+4], lineNodes[index], lines[index])
            index += 1
        }
        
        for i in 0..<3 {
            linkTwoNodes(sphereNodes[i+8], sphereNodes[i+1+8], lineNodes[index], lines[index])
            index += 1
        }
        linkTwoNodes(sphereNodes[3+8], sphereNodes[0+8], lineNodes[index], lines[index])
        index += 1
        
        for i in 0..<3 {
            linkTwoNodes(sphereNodes[i+4+8], sphereNodes[i+5+8], lineNodes[index], lines[index])
            index += 1
        }
        linkTwoNodes(sphereNodes[7+8], sphereNodes[4+8], lineNodes[index], lines[index])
        index += 1
        
        
        for i in 0..<4 {
            linkTwoNodes(sphereNodes[i+8], sphereNodes[i+4+8], lineNodes[index], lines[index])
            index += 1
        }
        
        for i in 0..<8 {
            linkTwoNodes(sphereNodes[i], sphereNodes[i+8], lineNodes[index], lines[index])
            index += 1
        }
    }
    
    
    
    
    
    public func linkTwoNodes(_ node1: SCNNode, _ node2: SCNNode, _ lineNode: SCNNode, _ line: SCNCylinder) {
        let p1 = node1.position
        let p2 = node2.position
        let dx = p1.x - p2.x
        let dy = p1.y - p2.y
        let dz = p1.z - p2.z
        
        line.height = get3dDis(node1.position, node2.position)
        
        lineNode.position = SCNVector3((p1.x+p2.x)/2, (p1.y+p2.y)/2, (p1.z+p2.z)/2)
        
        var rotateX: Float = 0
        var rotateZ: Float = 0
        
        let crossLen:Float = Float(abs(sqrt(pow(dx, 2) + pow(dy, 2))))

        if dy > 0 && dx > 0 {
            rotateZ = -atanRotation(len1: dx, len2: dy)
        }
        if dy > 0 && dx < 0 {
            rotateZ = atanRotation(len1: -dx, len2: dy)
        }
        if dy < 0 && dx < 0 {
            rotateZ = -atanRotation(len1: -dx, len2: -dy)
        }
        if dy < 0 && dx > 0 {
            rotateZ = atanRotation(len1: dx, len2: -dy)
        }
        if dy == 0 {
            rotateZ = Float.pi / 2
        }
        
        if dy > 0 && dz < 0 {
            rotateX = -atanRotation(len1: -dz, len2: crossLen)
        }
        if dy > 0 && dz > 0 {
            rotateX = atanRotation(len1: dz, len2: crossLen)
        }
        if dy < 0 && dz > 0 {
            rotateX = -atanRotation(len1: dz, len2: crossLen)
        }
        if dy < 0 && dz < 0 {
            rotateX = atanRotation(len1: -dz, len2: crossLen)
        }
        if dy == 0 {
            //mod
            if dz != 0 {
                rotateX = Float.pi / 2
            }
        }
        lineNode.eulerAngles.x = Float(rotateX)
        lineNode.eulerAngles.z = Float(rotateZ)
    }


    public func linkTwoNodes(_ node1: SCNNode, _ node2: SCNNode, _ lineNode: SCNNode) {
        let p1 = node1.position
        let p2 = node2.position
        let dx = p1.x - p2.x
        let dy = p1.y - p2.y
        let dz = p1.z - p2.z
        
        lineNode.position = SCNVector3((p1.x+p2.x)/2, (p1.y+p2.y)/2, (p1.z+p2.z)/2)
        
        var rotateX: Float = 0
        var rotateZ: Float = 0
        
        let crossLen:Float = Float(abs(sqrt(pow(dx, 2) + pow(dy, 2))))

        if dy > 0 && dx > 0 {
            rotateZ = -atanRotation(len1: dx, len2: dy)
        }
        if dy > 0 && dx < 0 {
            rotateZ = atanRotation(len1: -dx, len2: dy)
        }
        if dy < 0 && dx < 0 {
            rotateZ = -atanRotation(len1: -dx, len2: -dy)
        }
        if dy < 0 && dx > 0 {
            rotateZ = atanRotation(len1: dx, len2: -dy)
        }
        if dy == 0 {
            rotateZ = Float.pi / 2
        }
        
        if dy > 0 && dz < 0 {
            rotateX = -atanRotation(len1: -dz, len2: crossLen)
        }
        if dy > 0 && dz > 0 {
            rotateX = atanRotation(len1: dz, len2: crossLen)
        }
        if dy < 0 && dz > 0 {
            rotateX = -atanRotation(len1: dz, len2: crossLen)
        }
        if dy < 0 && dz < 0 {
            rotateX = atanRotation(len1: -dz, len2: crossLen)
        }
        if dy == 0 {
            //mod
            if dz != 0 {
                rotateX = Float.pi / 2
            }
        }
        lineNode.eulerAngles.x = Float(rotateX)
        lineNode.eulerAngles.z = Float(rotateZ)
    }
}
