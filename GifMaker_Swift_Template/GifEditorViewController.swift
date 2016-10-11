//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Steven Chen on 10/5/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var gifImageView:UIImageView!
    
    var gif:Gif?
    
    override func viewWillAppear(_ animated: Bool) {
        gifImageView.image = gif?.gifImage
        subscribeToKeyboardNotifications()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentPreview(_ sender: AnyObject) {
        let previewVC = self.storyboard?.instantiateViewController(withIdentifier: "GifPreviewViewController") as? GifPreviewViewController
        self.gif?.caption = self.captionTextField.text;
        
        let regift = Regift(sourceFileURL: self.gif?.videoURL as! URL, destinationFileURL: nil, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        
        
        let captionFont = self.captionTextField.font;
        let gifURL = regift.createGif(caption: self.captionTextField.text, font: captionFont)
        
        let newGif = Gif(url: gifURL! as NSURL, videoURL: (self.gif?.videoURL)!, caption: self.captionTextField.text)
        previewVC?.gif = newGif;
    
        self.navigationController?.pushViewController(previewVC!, animated: true)
    }
    
    // Textfield delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}

extension GifEditorViewController {
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(GifEditorViewController.keyboardWillShow(notification:)),
                                                         name: NSNotification.Name.UIKeyboardWillShow,
                                                         object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(GifEditorViewController.keyboardWillHide(notification:)),
                                                         name: NSNotification.Name.UIKeyboardWillHide,
                                                         object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if view.frame.origin.y >= 0 {
            view.frame.origin.y -= getKeyboardHeight(notification: notification)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if (self.view.frame.origin.y < 0) {
            view.frame.origin.y += getKeyboardHeight(notification: notification)
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
}
