//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = UIColor.blue
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
let textLayer = CATextLayer()
textLayer.string = "🐠"
textLayer.fontSize = 100
textLayer.frame = view.frame
textLayer.alignmentMode = kCAAlignmentCenter
view.layer.addSublayer(textLayer)

let rotationInDegrees = Measurement(value: 45, unit: UnitAngle.degrees)
let rotationInRadians = CGFloat(rotationInDegrees.converted(to: .radians).value)
let transform = CATransform3DMakeRotation(rotationInRadians, 0, 0.0, 1.0)
textLayer.transform = transform

let animation = CABasicAnimation(keyPath: "transform")
animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: 10, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: -10, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
animation.duration = 2.0
animation.repeatCount = Float.infinity
animation.autoreverses = true
textLayer.add(animation, forKey: nil)

let position = CABasicAnimation(keyPath: "position.x")
position.fromValue = view.frame.width
position.toValue = 0
position.duration = 10.0
position.repeatCount = Float.infinity
textLayer.add(position, forKey: nil)

