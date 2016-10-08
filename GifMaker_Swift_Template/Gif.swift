//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Steven Chen on 10/8/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class Gif {
    let url: NSURL
    let videoURL: NSURL
    let caption: String?
    let gifImage: UIImage?
    var gifData: NSData?
    
    init(url:NSURL, videoURL: NSURL, caption: String?) {
        
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gifURL(url.absoluteString)!
        self.gifData = nil
    }
    
    init(name: String){
        self.gifImage = UIImage.gifURL(name)
    }
}
