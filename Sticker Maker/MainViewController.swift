//
//  ViewController.swift
//  Sticker Maker
//
//  Created by Saurav Sharma on 07/05/22.
//

import UIKit
import Hero

class MainViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    var imagePicker = UIImagePickerController()
    static let shared = MainViewController()
    var sourceImg = Data()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func createAction(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true) {
                self.emptyLabel.removeFromSuperview()
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let indicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        indicatorView.center = self.view.center
        indicatorView.color = UIColor(red: 0.51, green: 0.88, blue: 0.66, alpha: 1.00)
        indicatorView.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
        self.view.addSubview(indicatorView)
        indicatorView.startAnimating()
        self.dismiss(animated: true) {
            indicatorView.stopAnimating()
            indicatorView.removeFromSuperview()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "imageStoryboard") as! ImageViewController
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .coverVertical
            vc.hero.modalAnimationType = .pull(direction: .right) // to do hero
            vc.view.addSubview(indicatorView)
            indicatorView.startAnimating()
            self.present(vc, animated: true) {
                let image = info[.originalImage] as? UIImage
                if let image_download = image {
                    let resizedImage = image_download.resized(to: CGSize(width: 170.66, height: 170.66))
                    let webp = YYCGImageCreateEncodedWebPData(resizedImage.cgImage!, false, 1.0, 6, .icon)
                    MainViewController.shared.sourceImg = webp?.takeUnretainedValue() as! Data
                    indicatorView.stopAnimating()
                    indicatorView.removeFromSuperview()
                    vc.imageView.image = image
                }
            }
        }
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
