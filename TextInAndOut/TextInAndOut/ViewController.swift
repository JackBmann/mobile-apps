//
//  ViewController.swift
//  TextInAndOut
//
//  Created by jbaumann on 10/24/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loremIpsumView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loremIpsumView.delegate = self
        if let font = UIFont(name: "Chalkduster", size: 20.0) {
            loremIpsumView.font = UIFontMetrics.default.scaledFont(for: font)
        }
    }

}

extension UIViewController: UITextViewDelegate {
    
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
    
}
