//
//  UIViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Steven Chen on 10/5/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

extension UIViewController{
    @IBAction func luanchVideoCameraWithSender(sender: AnyObject){
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = UIImagePickerControllerSourceType.Camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        
        presentViewController(recordVideoController, animated: true, completion: nil)
    }
}

extension UIViewController: UINavigationControllerDelegate{
   
}
    
extension UIViewController: UIImagePickerControllerDelegate{
 
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String{
            let videoURL = info[UIImagePickerControllerMediaURL] as! NSURL
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path!, nil, nil, nil)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    public func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
