//: [Back to home](@previous)

/*:
 ## What does a cube look like to a 2️⃣-dimensional creature 🧬
 
 - Note:
 Content in a plane is two dimensions. In a brief history of time, Mr. Hawking argued that if there were two dimensions of space, if there were life in it, there would be two-dimensions of animals.
 
 ### Idea
 * Callout(Flatland):
 The movie 🎥 Flatland inspired me to do this page on playground. A 2️⃣-dimensional creature does not necessarily mean that the creature is two-dimensional, perhaps, its senses are stuck in two dimensions, unable to perceive the existence of a 3️⃣-dimensional space.
 \
 \
 Humans, by your own definition, are 3️⃣-dimensional creatures, but you also live in a higher dimensional space without perceiving it.

 ### Have Fun 🤪
 * Callout(3D Cube in 2D):
 The retina 👀 of a 3️⃣-dimensional creature is a plane, so the retina 👁 of a 2️⃣-dimensional creature is a line. So everything a 2️⃣-dimensional creature sees is a line.
 \
 \
 For a simple example, imagine 🙇🏻‍♂️ a cube, and run 🏃🏻‍♂️ my code.
 \
 \
 See 🤔 what the cube looks like to a 2️⃣-dimensional creature, and try to adjust 🔧 the axis of the rotation.

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
    scene.is2D = true
    scene.rotateXaxis = /*#-editable-code*/true/*#-end-editable-code*/
    scene.rotateYaxis = /*#-editable-code*/true/*#-end-editable-code*/
    scene.rotateZaxis = /*#-editable-code*/true/*#-end-editable-code*/
    
//#-hidden-code
    sceneView.presentScene(scene)
}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code

//: [3D Cube](@next)

