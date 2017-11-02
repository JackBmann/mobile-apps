//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import GameKit

// 8/31/17

var view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
PlaygroundPage.current.liveView = view


// Put a picture of a clownfish in the view, add some text and a gradient
//let clownfish = #imageLiteral(resourceName: "anemonefish-sizes.jpg")
//
//let imageLayer = CALayer()
//imageLayer.frame = view.frame
//imageLayer.contents = clownfish.cgImage
//imageLayer.contentsGravity = kCAGravityCenter
//
//view.layer.addSublayer(imageLayer)
//
//let alpha:CGFloat = 0.9
//let colors = [
//    UIColor.clear.cgColor,
//    UIColor.lightGray.withAlphaComponent(alpha).cgColor,
//    UIColor.darkGray.withAlphaComponent(alpha).cgColor,
//    UIColor.black.withAlphaComponent(alpha).cgColor
//]
//
//let gradient = CAGradientLayer()
//gradient.frame = view.frame
//gradient.colors = colors
//gradient.locations = [0.7, 0.9, 0.95]
//
//view.layer.addSublayer(gradient)
//
//let textLayer = CATextLayer()
//textLayer.frame = view.frame
//textLayer.frame.origin.y = 350
//textLayer.string = "Jenny Huang"
//textLayer.alignmentMode = kCAAlignmentRight
//
//view.layer.addSublayer(textLayer)


// Put an emoji in the view as an image
//let textLayer = CATextLayer()
//textLayer.frame = view.frame
//textLayer.string = "🎸"
//textLayer.fontSize = 300
//textLayer.alignmentMode = kCAAlignmentCenter
//view.layer.addSublayer(textLayer)


// Put an emoji in the view as an image and animate it
//let iconLayer = CATextLayer()
//iconLayer.alignmentMode = kCAAlignmentCenter
//iconLayer.frame = view.frame.insetBy(dx: 160, dy: 160)
//iconLayer.fontSize = 60
//iconLayer.string = "🎸"
//iconLayer.backgroundColor = UIColor.lightGray.cgColor
//iconLayer.cornerRadius = 15
//view.layer.addSublayer(iconLayer)
//
//let animation = CABasicAnimation(keyPath: "transform")
//animation.duration = 0.1
//animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(-CGFloat.pi * 0.01, 0, 0, 1))
//animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat.pi * 0.01, 0, 0, 1))
//animation.autoreverses = true
//animation.repeatCount = HUGE
//iconLayer.add(animation, forKey: nil)


// Animate a fading circle
//let shapeLayer = CAShapeLayer()
//shapeLayer.frame = view.frame
//view.layer.addSublayer(shapeLayer)
//
//let path = CGPath(ellipseIn: shapeLayer.frame.insetBy(dx: 30, dy: 30), transform: nil)
//shapeLayer.path = path
//shapeLayer.fillColor = UIColor.white.cgColor
//
//let animation = CABasicAnimation(keyPath: "opacity")
//animation.duration = 2.0
//animation.repeatCount = Float.infinity
//animation.fromValue = 1.0
//animation.toValue = 0.3
//animation.autoreverses = true
//shapeLayer.add(animation, forKey: "opacity")
//
//let path2 = CGPath(ellipseIn: shapeLayer.frame.insetBy(dx: 10, dy: 70), transform: nil)
//
//let animation2 = CABasicAnimation(keyPath: "path")
//animation2.duration = 1.5
//animation2.repeatCount = Float.infinity
//animation2.fromValue = path
//animation2.toValue = path2
//animation2.autoreverses = true
//shapeLayer.add(animation2, forKey: nil)


// Make a card to flip
//let layer = CATextLayer()
//layer.backgroundColor = UIColor.white.cgColor
//layer.cornerRadius = 10
//layer.frame = view.frame.insetBy(dx: 100, dy: 100)
//layer.string = "🐰"
//layer.fontSize = 148
//layer.alignmentMode = kCAAlignmentCenter
//
//view.layer.addSublayer(layer)
//
//let animation = CABasicAnimation(keyPath: "transform")
//animation.duration = 5.0
//animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(-CGFloat.pi, 0, 1, 0))
//animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(0.0, 0, 1, 0))
//animation.repeatCount = Float.infinity
//layer.add(animation, forKey: nil)
//
//var transform = CATransform3DIdentity
//transform.m34 = -1.0/500.0
//view.layer.sublayerTransform = transform


// Use Measurement foundation
//let textLayer = CATextLayer()
//textLayer.string = "🐠"
//textLayer.fontSize = 100
//textLayer.frame = view.frame
//textLayer.alignmentMode = kCAAlignmentCenter
//view.layer.addSublayer(textLayer)
//
//let rotationInDegrees = Measurement(value: 45, unit: UnitAngle.degrees)
//let rotationInRadians = CGFloat(rotationInDegrees.converted(to: .radians).value)
//let transform = CATransform3DMakeRotation(rotationInRadians, 0, 0.0, 1.0)
//textLayer.transform = transform
//
//let animation = CABasicAnimation(keyPath: "transform")
//animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: 10, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
//animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: -10, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
//animation.duration = 2.0
//animation.repeatCount = Float.infinity
//animation.autoreverses = true
//textLayer.add(animation, forKey: nil)
//
//let position = CABasicAnimation(keyPath: "position.x")
//position.fromValue = view.frame.width
//position.toValue = 0
//position.duration = 10.0
//position.repeatCount = Float.infinity
//textLayer.add(position, forKey: nil)


// 9/2/17

// Make a custom emoji spinner
//let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
//view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//PlaygroundPage.current.liveView = view
//
//let gutarLayer = CATextLayer()
//gutarLayer.string = "🎸"
//gutarLayer.fontSize = 35
//gutarLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//gutarLayer.position = CGPoint(x: 75, y: 75)
//
//let fadeGutar = CABasicAnimation(keyPath: "opacity")
//fadeGutar.fromValue = 1.0
//fadeGutar.toValue = 0.0
//fadeGutar.repeatCount = HUGE
//fadeGutar.duration = 1.0
//gutarLayer.add(fadeGutar, forKey: "opacity")
//
//let replication = CAReplicatorLayer()
//replication.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//replication.position = view.center
//replication.instanceCount = 10
//replication.instanceDelay = 0.1
//replication.instanceTransform = CATransform3DMakeRotation(CGFloat.pi/5.0, 0, 0, 1)
//replication.addSublayer(gutarLayer)
//view.layer.addSublayer(replication)


// Make a bunch of moving hearts
//view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
//
//let icon = CATextLayer()
//icon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//icon.fontSize = 30
//icon.string = "❤️"
//
//let renderer = UIGraphicsImageRenderer.init(bounds: icon.frame)
//let image = renderer.image { (context) in
//    icon.render(in: context.cgContext)
//}
//
//let emitter = CAEmitterLayer()
//emitter.frame = view.frame
//view.layer.addSublayer(emitter)
//
//let cell = CAEmitterCell()
//cell.contents = image.cgImage
//cell.birthRate = 2
//cell.speed = 10.0
//cell.lifetime = 10
//
//emitter.emitterCells = [cell]
//emitter.emitterPosition = CGPoint(x: 200, y: 200)
//emitter.emitterShape = kCAEmitterLayerSphere
//emitter.emitterSize = CGSize(width: 400, height: 400)
//emitter.renderMode = kCAEmitterLayerOldestFirst
//
//cell.velocity = 3.0
//cell.yAcceleration = 3.3
//cell.xAcceleration = 3.3
//cell.scale = 1.0
//cell.scaleRange = 1.0
//cell.scaleSpeed = 0.5
//cell.lifetimeRange = 10
//cell.spin = 1.0
//cell.spinRange = 10.0
//cell.alphaSpeed = -0.1


// Make a bunch of moving hearts v2.0
//view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
//
//func createCell(string: String) -> CAEmitterCell {
//    let icon = CATextLayer()
//    icon.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//    icon.fontSize = 30
//    icon.string = string
//
//    let renderer = UIGraphicsImageRenderer.init(bounds: icon.frame)
//    let image = renderer.image { (context) in
//        icon.render(in: context.cgContext)
//    }
//
//    let cell = CAEmitterCell()
//    cell.contents = image.cgImage
//    cell.birthRate = 1
//    cell.speed = 10.0
//    cell.lifetime = 10
//
//    cell.velocity = 3.0
//    cell.yAcceleration = 3.3
//    cell.xAcceleration = 3.3
//    cell.scale = 1.0
//    cell.scaleRange = 1.0
//    cell.scaleSpeed = 0.5
//    cell.lifetimeRange = 10
//    cell.spin = 1.0
//    cell.spinRange = 10.0
//    cell.alphaSpeed = -0.1
//
//    return cell
//}
//
//func createCellArray(string: String) -> [CAEmitterCell] {
//    return string.characters.map() { createCell(string: String($0)) }
//}
//
//let emitter = CAEmitterLayer()
//emitter.frame = view.frame
//view.layer.addSublayer(emitter)
//emitter.emitterCells = createCellArray(string: "❤️💙💜💛💚💗♥️💖💞💕💓🖤❣️")
//
//emitter.emitterPosition = CGPoint(x: 200, y: 200)
//emitter.emitterShape = kCAEmitterLayerSphere
//emitter.emitterSize = CGSize(width: 400, height: 400)
//emitter.renderMode = kCAEmitterLayerOldestFirst


// Create an image, put a mask on it, save it, and update it by frame
//view = UIView(frame: CGRect(x: 0, y: 0, width: 256, height: 256))
//view.backgroundColor = .black
//PlaygroundPage.current.liveView = view
//
//func getSingleCharacterLayer(c: Character, font: UIFont) -> CATextLayer {
//    let layer = CATextLayer()
//    layer.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
//    layer.font = font
//    layer.fontSize = 12 // does not use font's size...
//    layer.string = String(c)
//    return layer
//}
//
//let random = GKMersenneTwisterRandomSource()
//let colors: [UIColor] = [#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)]
//
//func getRandomCharacterLayer(s: String, font: UIFont) -> CATextLayer {
//    let randomIndex = random.nextInt(upperBound: s.characters.count)
//    let character = s.characters[s.index(s.startIndex, offsetBy: randomIndex)]
//    let layer = getSingleCharacterLayer(c: character, font: font)
//    layer.foregroundColor = colors[random.nextInt(upperBound: colors.count)].cgColor
//    return layer
//}
//
//let characterSet = "!@#$%^&*()-=+{}[]|\\;:<>?/~`\""
//
//var height:CGFloat = 0
//let font = UIFont(name: "Menlo", size: 32)
//repeat {
//    var width: CGFloat = 0
//    repeat {
//        let charLayer = getRandomCharacterLayer(s: characterSet, font: font!)
//        charLayer.frame = CGRect(x: width, y: height, width: 8, height: 12)
//        view.layer.addSublayer(charLayer)
//
//        width += 10.0
//    } while (width < view.frame.width)
//    height += 18.0
//} while (height < view.frame.height)
//
//let imageRenderer = UIGraphicsImageRenderer(bounds: view.frame)
//let jpeg = imageRenderer.jpegData(withCompressionQuality: 1.0) { (context) in
//    view.layer.render(in: context.cgContext)
//}
//
//let maskLayer = CALayer()
//maskLayer.frame = view.frame
//maskLayer.backgroundColor = UIColor.clear.cgColor
//
//let letterLayer = CATextLayer()
//letterLayer.frame = maskLayer.frame
//letterLayer.fontSize = 200
//letterLayer.alignmentMode = kCAAlignmentCenter
//letterLayer.string = "❤️"
//maskLayer.addSublayer(letterLayer)
//
//view.layer.mask = maskLayer
//
//// must create '~/Documents/Shared Playground Data' manually
//let URL = playgroundSharedDataDirectory.appendingPathComponent("file.jpeg")
//print(URL)
//
//try! jpeg.write(to: URL)
//print("done")
//
//class Updater {
//    let layer: CALayer
//    let characters: String
//    let font: UIFont
//    init(l: CALayer, c: String, f: UIFont) {
//        layer = l
//        characters = c
//        font = f
//    }
//    @objc func update() {
//        let randomIndex = random.nextInt(upperBound: layer.sublayers!.count)
//        let sub = layer.sublayers![randomIndex]
//        let newSub = getRandomCharacterLayer(s: characters, font: font)
//        newSub.frame = sub.frame
//        sub.removeFromSuperlayer()
//        layer.addSublayer(newSub)
//    }
//}
//
//let updater = Updater(l: view.layer, c: characterSet, f: font!)
//let displayLink = CADisplayLink(target: updater, selector: #selector(Updater.update))
//displayLink.add(to: RunLoop.current, forMode: .defaultRunLoopMode)

