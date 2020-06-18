//: [3Dcube](@previous)

/*:
## The 4D hypercube - Tesseract

- Note:
 The construction of Schlegel diagram is not based on a specific (conventional) projection. You can pick a point on any surface of a 4⃣️-dimensional polyhedron, pull it out a little bit, and project it from there. If you want to know more about Tesseract, check out [wikipedia](https://en.wikipedia.org/wiki/Tesseract)
 */
/*:
 
- Important:
In geometry 🔍, a *hypercube* is a cube higher than 3⃣️ dimensions, and in 4️⃣ dimensions there is a hypercube called *Tesseract*, which has 16 points and 32 edges.

*/

//#-hidden-code
import PlaygroundSupport
import SpriteKit
import SceneKit
import IntoFourDimensions

handleP4Vector()
let tesseractView = TesseractViewController()
//#-end-hidden-code

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
tesseractView.rotateXYaxis = /*#-editable-code*/true/*#-end-editable-code*/
tesseractView.rotateZWaxis = /*#-editable-code*/true/*#-end-editable-code*/

//#-hidden-code
PlaygroundPage.current.liveView = tesseractView
//#-end-hidden-code

/*:
### About

* Callout(How I implemented this):
Similar to the 3D cube, I projection the 4⃣️-dimensional *Tesseract* into the SceneKit. If there is no projection method, you will not see the *Tesseract*, because human beings are living in 3️⃣ dimensions and cannot see 🙈 the 4️⃣-dimensional *Tesseract* directly.
Again, run 🏃🏻‍♂️ my code and adjust 🔧 the axis of rotation. There's a lot of math involved in matrix operations, too.
 \
 \
 Similar to the previous page, A 4️⃣D vector looks like this
 ![4dvector](4dvector.png)
 \
 \
 Same way as the previous page, in each frame, I update the θ this way(angle is very small)
 ![θ](θ.png)
 \
 \
 But we rotate two axis at a time, XY or ZW, thus the 4️⃣D *Rotation Matrix* looks like this
 \
 \
 ![4DRotationMatrix](4DRotationMatrix.png)
 \
 \
 And I update every 4D vector in each frame.
 \
 \
 ![4dupdate](4dupdate.png)
*/

//: [4dAR](@next)
