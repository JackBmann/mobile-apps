//
//  ViewController.swift
//  ProjectOne
//
//  Created by jbaumann on 9/19/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    
    // Unpacks the value of the label, decrements it by one, and then sets the colors of the background, label, and buttons
    @IBAction func decrementButtonPressed(_ sender: Any) {
        guard let v = valueLabel.text else {return}
        guard let val = Float(v) else {return}
        let value = val - 1.0
        valueLabel.text = String(Int(value))
        setColors()
    }
    
    // Unpacks the value of the label, increments it by one, and then sets the colors of the background, label, and buttons
    @IBAction func incrementButtonPressed(_ sender: Any) {
        guard let v = valueLabel.text else {return}
        guard let val = Float(v) else {return}
        let value = val + 1.0
        valueLabel.text = String(Int(value))
        setColors()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Initiates a random number generator and returns a float value between 0.0 and 1.0
    func getRandomValue() -> Float {
        let random = GKMersenneTwisterRandomSource()
        return random.nextUniform()
    }
    
    // Sets the colors of the background, label text, and buttons to differnt random colors.
    func setColors() {
        var redValue: Float
        var greenValue: Float
        var blueValue: Float
        var alphaValue: Float
        redValue = getRandomValue()
        greenValue = getRandomValue()
        blueValue = getRandomValue()
        alphaValue = getRandomValue()
        view.backgroundColor = UIColor.init(colorLiteralRed: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        valueLabel.textColor = UIColor.init(colorLiteralRed: greenValue, green: blueValue, blue: redValue, alpha: 1.0)
        let buttonColor = UIColor.init(colorLiteralRed: blueValue, green: redValue, blue: greenValue, alpha: 1.0)
        decrementButton.setTitleColor(buttonColor, for: UIControlState.normal)
        incrementButton.setTitleColor(buttonColor, for: UIControlState.normal)
    }


}

