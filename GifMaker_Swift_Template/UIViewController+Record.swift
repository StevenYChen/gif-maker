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

let frameCount = 16
let delayTime: Float = 0.2
let loopCount = 0       // 0 means loop forever

extension UIViewController{
    @IBAction func luanchVideoCameraWithSender(_ sender: AnyObject){
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = UIImagePickerControllerSourceType.camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
    }
    
    func convertVideoToGif(videoURL: URL){
        let regift = Regift(sourceFileURL: videoURL, frameCount: frameCount, delayTime: delayTime, loopCount:loopCount)
        let gifURL = regift.createGif()
        let gif = Gif(url: gifURL! as NSURL, videoURL: videoURL as NSURL, caption: nil)
        displayGIF(gif: gif)
    }
    
    func displayGIF(gif: Gif){
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gif = gif
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
}

extension UIViewController: UINavigationControllerDelegate{
   
}
    
extension UIViewController: UIImagePickerControllerDelegate{
 
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String{
            let videoURL = info[UIImagePickerControllerMediaURL] as! URL
            UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, nil, nil, nil)
            dismiss(animated: true, completion: nil)
            convertVideoToGif(videoURL: videoURL)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
