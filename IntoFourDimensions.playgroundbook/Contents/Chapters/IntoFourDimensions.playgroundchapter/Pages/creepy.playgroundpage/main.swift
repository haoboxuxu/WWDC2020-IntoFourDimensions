//: [4dAR](@previous)

//#-hidden-code
import PlaygroundSupport
import SpriteKit
import SceneKit
import IntoFourDimensions
handleP4Vector()
//#-end-hidden-code

/*:
 ### This is creepy 👻
 * Callout(Can you do this?):
 I mentioned earlier that living things in 3️⃣ dimensions cannot perceive objects in 4️⃣ dimensions, but since I have displayed 🖥 the *Tesseract*, can you 👉🏻 touch it or move 🤚🏻?
 Here are the vectors of Tesseract's 16 points. Try to change their coordinates to see if you can move it 🤚🏻.

 */


p4s[0] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[1] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[2] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[3] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[4] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[5] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[6] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[7] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/)
p4s[8] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)
p4s[9] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)
p4s[10] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)
p4s[11] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)
p4s[12] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)
p4s[13] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)
p4s[14] = P4Vector(/*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)
p4s[15] = P4Vector(/*#-editable-code*/-0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/0.5/*#-end-editable-code*/, /*#-editable-code*/-0.5/*#-end-editable-code*/)


//#-hidden-code
let tesseractView = TesseractViewController()
PlaygroundPage.current.liveView = tesseractView
//#-end-hidden-code


/*:
 ### What are the results?
 * Callout(So sad 😔 to say goodbye):
 That's the creepy 👻 truth, you can't move a 4️⃣-dimensional object. Even if you move some points, the overall center is still where it was.
 Three minutes is such a short and enjoyable time, and you see the powerful of coding and it can create such an amazing world 🌏. Hope you enjoy and learn something from it.

 */
