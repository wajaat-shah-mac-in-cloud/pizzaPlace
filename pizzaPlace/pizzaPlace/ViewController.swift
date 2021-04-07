//
//  ViewController.swift
//  pizzaPlace
//
//  Created by user192603 on 3/14/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var pizzaName: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    
    @IBAction func anotherButton(_ sender: UIButton) {
        updateUI()
    }
    
    var sound: AVAudioPlayer!

    var pizzaArr = [Pizza]()
    func populatePizzas(){
        let p1a = Pizza()
        p1a.name = "New York Style"
        p1a.size = "Small"
        p1a.price = 10.00
        p1a.img = "ny.jpeg"
        pizzaArr.append(p1a)
        
        let p1b = Pizza()
        p1b.name = "New York Style"
        
        p1b.size = "Medium"
        p1b.price = 13.00
        p1b.img = "ny.jpeg"
        pizzaArr.append(p1b)

        let p1c = Pizza()
        p1c.name = "New York Style"
        p1c.size = "Large"
        p1c.price = 15.00
        p1c.img = "ny.jpeg"
        pizzaArr.append(p1c)
        
        let p2a = Pizza()
        p2a.name = "Chicago Style"
        p2a.size = "Small"
        p2a.price = 16.00
        p2a.img = "chi.jpeg"
        pizzaArr.append(p2a)
        
        let p2b = Pizza()
        p2b.name = "Chicago Style"
        p2b.size = "Medium"
        p2b.price = 18.00
        p2b.img = "chi.jpeg"
        pizzaArr.append(p2b)

        let p2c = Pizza()
        p2c.name = "Chicago Style"
        p2c.size = "Large"
        p2c.price = 19.00
        p2c.img = "chi.jpeg"
        pizzaArr.append(p2c)
        
        let p3a = Pizza()
        p3a.name = "Neopolitan Style"
        p3a.size = "Small"
        p3a.price = 12.00
        p3a.img = "itl.jpg"
        pizzaArr.append(p3a)
        
        let p3b = Pizza()
        p3b.name = "Neopolitan Style"
        p3b.size = "Medium"
        p3b.price = 14.00
        p3b.img = "itl.jpg"
        pizzaArr.append(p3b)
        
        let p3c = Pizza()
        p3c.name = "Neopolitan Style"
        p3c.size = "Large"
        p3c.price = 17.00
        p3c.img = "itl.jpg"
        pizzaArr.append(p3c)
    }
    
    func rotateIcon() {
        UIView.animate(withDuration: 0.8, animations: ({
            self.logo.transform = self.logo.transform.rotated(by: CGFloat((180.0 * .pi) / 180.0))
        }))
    }
    
    func updateUI(){
        let randomPizza = pizzaArr.randomElement()
        pizzaName.text = randomPizza!.name
        lblSize.text = randomPizza?.size
        let i = randomPizza!.price
        lblPrice.text = "$ " + String(i)
        picture.image = UIImage(named: randomPizza!.img)
        rotateIcon()
        sound.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sound = try?
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "wav")!))
        self.view.backgroundColor = UIColor.lightGray
        logo.image = UIImage(named: "logo2.png")
        populatePizzas()
        updateUI()
    }
}

