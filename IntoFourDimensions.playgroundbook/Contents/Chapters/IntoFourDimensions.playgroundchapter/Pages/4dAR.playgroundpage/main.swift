//: [4d](@previous)

/*:
 ### This is exciting 🥳
 * Callout(View 📷 it in **AR**):
 Do you enjoy the *Tesseract* on last page? Never mind, thanks to ARKit, I implement the AR version of Tesseract. Run 🏃🏻‍♂️ the code and enjoy being immersed in a “real” *Tesseract*!
 */

//#-hidden-code
import PlaygroundSupport
import SpriteKit
import SceneKit
import IntoFourDimensions

handleP4Vector()
var tesseractARView = TesseractARViewController()
//#-end-hidden-code

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
tesseractARView.rotateXYaxis = /*#-editable-code*/true/*#-end-editable-code*/
tesseractARView.rotateZWaxis = /*#-editable-code*/true/*#-end-editable-code*/

//#-hidden-code
PlaygroundPage.current.liveView = tesseractARView
PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code

//: [creepy](@next)

