//
//  ViewController.swift
//  Sticker Maker
//
//  Created by Saurav Sharma on 07/05/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var emptyLabel: UILabel!
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func createAction(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true) {
                self.emptyLabel.removeFromSuperview()
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let indicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        indicatorView.center = self.view.center
        indicatorView.color = UIColor(red: 0.51, green: 0.88, blue: 0.66, alpha: 1.00)
        indicatorView.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
        self.view.addSubview(indicatorView)
        indicatorView.startAnimating()
        self.dismiss(animated: true) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "imageStoryboard") as! ImageViewController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            self.present(vc, animated: true) {
                indicatorView.stopAnimating()
                indicatorView.removeFromSuperview()
                vc.imageView.image = info[.originalImage] as? UIImage
            }
        }
    }
    
}

