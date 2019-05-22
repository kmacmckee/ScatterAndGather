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
    
    let image = UIImage(named: "lambdaLogo")
    
    
    let originalLCenter = (26.75, 38.25)
    let originalA1Center = (92.5, 38.25)
    let originalMCenter = (158.25, 38.25)
    let originalBCenter = (223.75, 38.25)
    let originalDCenter = (289.5, 38.25)
    let originalA2Center = (355.25, 38.25)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = image
        
    }

    @IBAction func toggleButtonPressed(_ sender: Any) {
        if isScattered {
            fadeInImage()
            
            gatherLetters(label: lLabel, originalCenter: originalLCenter)
            gatherLetters(label: a1Label, originalCenter: originalA1Center)
            gatherLetters(label: mLabel, originalCenter: originalMCenter)
            gatherLetters(label: bLabel, originalCenter: originalBCenter)
            gatherLetters(label: dLabel, originalCenter: originalDCenter)
            gatherLetters(label: a2Label, originalCenter: originalA2Center)
            
            
            isScattered = !isScattered
        } else {
            
            fadeOutImage()
            
            scatterLetters(label: lLabel)
            scatterLetters(label: a1Label)
            scatterLetters(label: mLabel)
            scatterLetters(label: bLabel)
            scatterLetters(label: dLabel)
            scatterLetters(label: a2Label)
            
            isScattered = !isScattered
        }
    }
    
    
    
//                                  --Animations--
    
    
    func fadeOutImage() {
        logoImageView.alpha = 1
        
        UIView.animate(withDuration: 1.5) {
            self.logoImageView.alpha = 0
        }
        
    }
    
    func fadeInImage() {
        logoImageView.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.logoImageView.alpha = 1
        }
    }
    
    func scatterLetters(label: UILabel) {
        
        let minX = Int(self.view.bounds.minX)
        let maxX = Int(self.view.bounds.maxX - 50)
        
        let minY = Int(self.view.bounds.minY)
        let maxY = Int(self.view.bounds.maxY - 150)
        
        let randomX = Int.random(in: minX...maxX)
        let randomY = Int.random(in: minY...maxY)
        
        let randomPoint = CGPoint(x: randomX, y: randomY)
        
        UIView.animate(withDuration: 2.5) {
            label.center = randomPoint
            label.transform = CGAffineTransform(rotationAngle: CGFloat(Int.random(in: -180...180)).toRadians())
            label.textColor = self.generateRandomColor()
            label.backgroundColor = self.generateRandomColor()
        
        }
    }
    
    
    func gatherLetters(label: UILabel, originalCenter: (x: Double, y: Double)) {
        let center = CGPoint(x: originalCenter.x, y: originalCenter.y)
        
        UIView.animate(withDuration: 1.5) {
            label.center = center
            label.transform = CGAffineTransform(rotationAngle: 0)
            label.textColor = .black
            label.backgroundColor = .white
        }
        
    }
    
    
    func generateRandomColor() -> UIColor {
        let hue: CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation: CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness: CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    
    
    
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var a1Label: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var a2Label: UILabel!
    
    @IBOutlet weak var logoImageView: UIImageView!
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
