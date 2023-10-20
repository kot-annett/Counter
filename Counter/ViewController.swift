//
//  ViewController.swift
//  Counter
//
//  Created by Anna on 18.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var buttonCounter: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    
    private var counter: Int = 0 {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счетчика: \(counter)"
        historyTextView.text = "История изменений:\n"
        historyTextView.isScrollEnabled = true
        historyTextView.isEditable = false
        updateUI()
    }


    @IBAction private func pressedButtonCounter(_ sender: UIButton) {
        counter += 1
    }
    
    @IBAction private func incrementCounter(_ sender: UIButton) {
        counter += 1
        appendToHistory("значение изменено на +1")
    }
    
    @IBAction private func decrementCounter(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            appendToHistory("значение изменено на -1")
        } else {
            appendToHistory("попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction private func resetCounter(_ sender: UIButton) {
        counter = 0
        appendToHistory("значение сброшено")
        
    }
    
    private func appendToHistory(_ action: String) {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
        historyTextView.text += "\(date): \(action)\n"
    }
    
    private func updateUI() {
        counterLabel.text = "Значение счетчика: \(counter)"
        buttonCounter.setTitle("\(counter)", for: .normal)
    }
    
}

