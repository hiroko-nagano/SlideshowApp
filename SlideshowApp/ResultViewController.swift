//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by hiroko nagano on 2020/08/17.
//  Copyright © 2020 hiroko.nagano. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var ResultImageView: UIImageView!
    
    var x = UIImage(named: "photo1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let resultimage = x
        ResultImageView.image = resultimage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
