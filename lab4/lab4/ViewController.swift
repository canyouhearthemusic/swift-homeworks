//
//  ViewController.swift
//  lab4
//
//  Created by Alibek Tastan on 03.03.2024.
//

import UIKit

class ViewController: UIViewController {

    private var count = 0
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = count.description
        view.backgroundColor = .green
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        count += 1
        label.text = count.description
    }
    
}

