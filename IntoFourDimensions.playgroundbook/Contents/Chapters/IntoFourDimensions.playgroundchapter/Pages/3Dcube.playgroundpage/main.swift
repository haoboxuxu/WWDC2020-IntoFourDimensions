//: [2d](@previous)

/*:
 - Note:
 3️⃣-dimensional creatures: How we see a 3D object on screen 🖥
 \
 \
 We humans are all 3⃣️-dimensional creatures, and I don't have to explain too much. In order to explore the 4⃣️-dimensional cube in the next page, I need to explain how you see a 3⃣️D cube.
 \
 \
 A 3⃣️-dimensional cube is displayed on a 2️⃣-dimensional screen. The process of showing it reduces 1️⃣ dimension. There are two ways of showing it. One is *slide method*, which is the trace left by an n-dimensional object passing through the space of n-1 dimension. Another the way is called *projection*, and it’s the way how screen display things. I chose the latter one.
 
 Run 🏃🏻‍♂️ my code. See 🤔 how the 3️⃣D cube rendered into 2️⃣D, and try to adjust 🔧 the axis of the rotation.
 */

//#-hidden-code
import PlaygroundSupport
import SpriteKit
import SceneKit
import IntoFourDimensions

let sceneView = SKView(frame: UIScreen.main.bounds)
if let scene = CubeScene(fileNamed: "CubeScene") {
    //#-end-hidden-code
    
    //#-code-completion(everything, hide)
    //#-code-completion(identifier, show, true, false)
    scene.is2D = false
    scene.rotateXaxis = /*#-editable-code*/true/*#-end-editable-code*/
    scene.rotateYaxis = /*#-editable-code*/true/*#-end-editable-code*/
    scene.rotateZaxis = /*#-editable-code*/true/*#-end-editable-code*/
    
    //#-hidden-code
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code

/*:
 ### About
 * Callout(How I implemented this):
 I don't have to go into too much theory about how *projection* approach reduces the dimensions and render stuff.
 But I need to mention how I did it. You may notice that I use SpriteKit, which is a 2️⃣-dimensional framework, but I rendered 3⃣️-dimensional cube and they were computed in real time ⏳.
 \
 A 3D vector looks like this
 ![3dvector](3dvector.png)
 \
 \
 The key 🔑 is to use *Rotation Matrix*
 \
 \
 A 3D *Rotation Matrix* looks like this
 \
 \
 ![3DRotationMatrix](3DRotationMatrix.png)
 \
 \
 In each frame, I update the θ this way(angle is very small)
 ![θ](θ.png)
 \
 \
 And I update every 3D vector in each frame(There are 8 vectors in a 3D cube, because it has 8 points).
 \
 \
 ![3dupdate](3dupdate.png)
 \
 \
 There's a lot of math involved in matrix operations. If you want to know more, check out [wikipedia](https://en.wikipedia.org/wiki/Rotation_matrix)
 */


//: [4d](@next)

