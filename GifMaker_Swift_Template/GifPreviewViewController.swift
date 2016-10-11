//
//  GifPreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Steven Chen on 10/11/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifPreviewViewController: UIViewController {
    
    @IBOutlet weak var gifPreview: UIImageView!
    var gif:Gif?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        gifPreview.image = gif?.gifImage
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func shareGif(sender: AnyObject) {
        let url: NSURL = (self.gif?.url)!
        let animatedGIF = NSData(contentsOf: url as URL)!
        let itemsToShare = [animatedGIF]
        
        let activityVC = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        activityVC.completionWithItemsHandler = {(activity, completed, items, error) in
            if (completed) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        navigationController?.present(activityVC, animated: true, completion: nil)
    }

}
