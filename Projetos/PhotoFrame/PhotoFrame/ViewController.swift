//
//  ViewController.swift
//  PhotoFrame
//
//  Created by amasiero on 21/01/21.
//

import UIKit

class ViewController: UIViewController {

  
  
    @IBOutlet weak var ImgBoat: UIImageView!
    @IBOutlet weak var StackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImgBoat.layer.borderWidth = 5
        ImgBoat.layer.borderColor = UIColor.brown.cgColor
        StackView.layer.borderWidth = 5
        StackView.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
       
    }
  
}

