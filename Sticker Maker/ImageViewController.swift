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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nextAction.isHidden = false
    }
    
    @IBAction func nextAction(_ sender: Any) {
        createStcikerPack()
    }
    static let shared = ImageViewController()
    var stickerPack = [StickerPack]()
    
    func createStcikerPack(){
        do {
            ImageViewController.shared.stickerPack.append(try StickerPack(identifier: "com.sh.Sticker-Maker",
            name: "stickerMaker",
            publisher: "Saurav Sharma",
            trayImageFileName: "tray_Cuppy.png", animatedStickerPack: false,
            publisherWebsite: nil,
            privacyPolicyWebsite: nil,
            licenseAgreementWebsite: nil))
            
//            try stickerPack.addSticker(contentsOfFile: "14_CatOnTheLaptop.webp", emojis: ["👍🏼","❤️","🤣"])
//            try stickerPack.addSticker(contentsOfFile: "01_SendingLove.webp", emojis: ["🪚","❤️","🤣"])
//            try stickerPack.addSticker(contentsOfFile: "15_WorkingFromHomeF.webp", emojis: ["👍🏼","👾","🤣"])

            let imgdata = MainViewController.shared.sourceImg
            try ImageViewController.shared.stickerPack[0].addSticker(imageData: imgdata, type: .webp, emojis: ["👍🏼","😍","🤣"])
//            try stickerPack.addSticker(imageData: imgdata, type: .webp, emojis: ["👍🏼","😍","🤣"])
//            try stickerPack.addSticker(imageData: imgdata, type: .webp, emojis: ["👍🏼","😍","🤣"])
//
//            stickerPack.sendToWhatsApp { _ in
//
//            }
            self.dismiss(animated: true) {
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(identifier: "MainVC") as! MainViewController
//                vc.modalPresentationStyle = .fullScreen
//                vc.modalTransitionStyle = .crossDissolve
//                self.present(vc,animated: true)
            }
        }
        catch {
            print("error:- \(error.localizedDescription)")
        }
        
    }
   
}
