//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Steven Chen on 10/5/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {
    
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var gifImageView:UIImageView!
    
    var gif:Gif?
    
    override func viewWillAppear(_ animated: Bool) {
   
        super.viewWillAppear(animated)
            gifImageView.image = gif?.gifImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
   
}
