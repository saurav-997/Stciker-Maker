//
//  ImageViewController.swift
//  Sticker Maker
//
//  Created by Saurav Sharma on 07/05/22.
//

import Foundation
import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextAction: UIButton!
    
    @IBAction func nextAction(_ sender: Any) {
        createStcikerPack()
    }
    
    func createStcikerPack(){
        do {
            let stickerPack = try StickerPack(identifier: "com.sh.Sticker-Maker",
            name: "stickerMaker",
            publisher: "Saurav Sharma",
            trayImageFileName: "tray_Cuppy.png", animatedStickerPack: false,
            publisherWebsite: nil,
            privacyPolicyWebsite: nil,
            licenseAgreementWebsite: nil)
            
//            try stickerPack.addSticker(contentsOfFile: "14_CatOnTheLaptop.webp", emojis: ["👍🏼","❤️","🤣"])
////            try stickerPack.addSticker(contentsOfFile: "01_SendingLove.webp", emojis: ["🪚","❤️","🤣"])
//            try stickerPack.addSticker(contentsOfFile: "15_WorkingFromHomeF.webp", emojis: ["👍🏼","👾","🤣"])
//
            let imgdata = MainViewController.shared.sourceImg
            try stickerPack.addSticker(imageData: imgdata, type: .webp, emojis: ["👍🏼","😍","🤣"])
            try stickerPack.addSticker(imageData: imgdata, type: .webp, emojis: ["👍🏼","😍","🤣"])
            try stickerPack.addSticker(imageData: imgdata, type: .webp, emojis: ["👍🏼","😍","🤣"])
            
            stickerPack.sendToWhatsApp { _ in
                
            }
        }
        catch {
            print("error:- \(error.localizedDescription)")
        }
        
    }
   
}
