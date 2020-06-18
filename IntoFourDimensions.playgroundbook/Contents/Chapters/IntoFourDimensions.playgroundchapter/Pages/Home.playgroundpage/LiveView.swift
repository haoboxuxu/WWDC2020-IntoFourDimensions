import UIKit
import AVFoundation
import PlaygroundSupport
import SpriteKit
import IntoFourDimensions



let bounds = CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width/2,height: UIScreen.main.bounds.height)

let videoFrame = CGRect(x: 0, y: 0, width: 280, height: 280)

let url = URL(fileURLWithPath: Bundle.main.path(forResource: "me", ofType: "mov")!)


let videoView = UIView(frame: videoFrame)
videoView.center = CGPoint(x: bounds.width/2, y: bounds.height/2 + 170)

let player = AVQueuePlayer()
let playerLayer = AVPlayerLayer(player: player)
playerLayer.frame = videoFrame
videoView.layer.addSublayer(playerLayer)
let playerLooper = AVPlayerLooper(player: player, templateItem: AVPlayerItem(url: url))
player.play()

let window = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
window.backgroundColor = .black



let backImage = UIImageView(image: UIImage(named: "back.png"))
backImage.frame = CGRect(x: 0, y: 0, width: backImage.contentClippingRect.width*0.4, height: backImage.contentClippingRect.height*0.4)
backImage.center = CGPoint(x: bounds.width/2, y: bounds.height/2 - 190)

let ipadImage = UIImageView(image: UIImage(named: "ipad.png"))
ipadImage.frame = CGRect(x: 0, y: 0, width: ipadImage.contentClippingRect.width*0.4, height: ipadImage.contentClippingRect.height*0.4)
ipadImage.center = CGPoint(x: bounds.width/2, y: bounds.height/2+260)

window.addSubview(videoView)
window.addSubview(backImage)
window.addSubview(ipadImage)
PlaygroundSupport.PlaygroundPage.current.liveView = window

