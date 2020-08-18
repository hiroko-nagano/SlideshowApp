//
//  ViewController.swift
//  SlideshowApp
//
//  Created by hiroko nagano on 2020/08/17.
//  Copyright © 2020 hiroko.nagano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var startstopbutton: UIButton!
    
    var image1 = UIImage(named: "photo1")
    var image2 = UIImage(named: "photo2")
    var image3 = UIImage(named: "photo3")
    var image4 = UIImage(named: "photo4")
    var images: [UIImage] = [UIImage(named: "photo1")!, UIImage(named: "photo2")!, UIImage(named: "photo3")!, UIImage(named: "photo4")!]
    var count:Int = 1
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ImageView.image = image1
        
    }
    
    @IBOutlet weak var nextview: UIButton!
    @IBAction func next(_ sender: Any) {
        
        if count  == 1 {
            ImageView.image = images[1]
        } else if count == 2 {
            ImageView.image = images[2]
        } else if count == 3 {
            ImageView.image = images[3]
        } else if count == 4 {
            ImageView.image = images[0]
            count = 0
        }
        count += 1
        
    }
    
    
    @IBOutlet weak var backview: UIButton!
    @IBAction func back(_ sender: Any) {
        if count  == 3 {
            ImageView.image = images[1]
        } else if count == 2 {
            ImageView.image = images[0]
        } else if count == 1 {
            ImageView.image = images[3]
        } else if count == 0 {
            ImageView.image = images[2]
            count = 4
        }
        count -= 1
    }
    
    @IBAction func Button1(_ sender: Any) {
        if self.timer == nil {
            
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeimage), userInfo: nil, repeats: true)
            startstopbutton.setTitle("停止", for: .normal)
            nextview.isHidden = true
            nextview.isEnabled = false
            backview.isHidden = true
            backview.isEnabled = false
            
        } else {
            self.timer.invalidate()
            self.timer = nil
            startstopbutton.setTitle("再生", for: .normal)
            nextview.isHidden = false
            nextview.isEnabled = true
            backview.isHidden = false
            backview.isEnabled = true
        }
    }
    
    
    @objc func changeimage() {
        count += 1
        if (count == 5) {
            count = 1
        }
        ImageView.image = images[count - 1]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if timer != nil {
            self.timer.invalidate()
            self.timer = nil
            startstopbutton.setTitle("再生", for: .normal)
            nextview.isHidden = false
            nextview.isEnabled = true
            backview.isHidden = false
            backview.isEnabled = true
        }
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.x = ImageView.image
    }
    
    @IBAction func unwind(_segue: UIStoryboardSegue){
    }
    
}
