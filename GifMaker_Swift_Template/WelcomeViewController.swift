//
//  WelcomeViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Steven Chen on 10/5/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController{
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let proofOfConceptGif = UIImage.gifName(name: "hotlineBling")
        
        gifImageView.image = proofOfConceptGif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
