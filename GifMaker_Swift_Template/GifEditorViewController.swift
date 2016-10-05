//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Steven Chen on 10/5/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {
    
    @IBOutlet weak var gifImageView:UIImageView!
    var gifURL:URL? = nil
    
    override func viewWillAppear(_ animated: Bool) {
   
        super.viewWillAppear(animated)
        
        if let gifURL = gifURL{
            let gifFromRecording = UIImage.gifURL(gifURL.absoluteString)
            gifImageView.image = gifFromRecording
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
