//
//  ViewController.swift
//  Counter
//
//  Created by Anna on 18.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonCounter: UIButton!
    
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Значение счетчика: \(counter)"
        
    }


    @IBAction func pressedButtonCounter(_ sender: UIButton) {
        counter += 1
        label.text = "Значение счетчика: \(counter)"
        buttonCounter.setTitle("\(counter)", for: .normal)
    }
}

