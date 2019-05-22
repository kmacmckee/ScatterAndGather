//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Kobe McKee on 5/22/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isScattered: Bool = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
    }
    
    
    
    
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
}

