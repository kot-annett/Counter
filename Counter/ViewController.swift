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
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    var counter: Int = 0 {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Значение счетчика: \(counter)"
        historyTextView.text = "История изменений:\n"
        historyTextView.isScrollEnabled = true
        historyTextView.isEditable = false
        updateUI()
    }


    @IBAction func pressedButtonCounter(_ sender: UIButton) {
        counter += 1
    }
    
    @IBAction func incrementCounter(_ sender: UIButton) {
        counter += 1
        appendToHistory("значение изменено на +1")
    }
    
    @IBAction func decrementCounter(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            appendToHistory("значение изменено на -1")
        } else {
            appendToHistory("попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction func resetCounter(_ sender: UIButton) {
        counter = 0
        appendToHistory("значение сброшено")
        
    }
    
    func appendToHistory(_ action: String) {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        historyTextView.text += "\(date): \(action)\n"
    }
    
    func updateUI() {
        label.text = "Значение счетчика: \(counter)"
        buttonCounter.setTitle("\(counter)", for: .normal)
    }
    
}

