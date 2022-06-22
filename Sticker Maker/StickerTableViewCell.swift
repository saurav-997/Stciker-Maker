//
//  StickerTableViewCell.swift
//  Sticker Maker
//
//  Created by Saurav Sharma on 15/06/22.
//

import UIKit
import CoreData


class StickerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellCollectionView.delegate = self
        cellCollectionView.dataSource = self
        cellCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        cellCollectionView.reloadData()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension StickerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ImageViewController.shared.stickerPack.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(data: MainViewController.shared.sourceImg)
        createData()
        return cell
    }
    
    
}
extension StickerTableViewCell {
    func createData(){
           
           //As we know that container is set up in the AppDelegates so we need to refer that container.
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
           
           //We need to create a context from this container
           let managedContext = appDelegate.persisentContainer.viewContext
           
           //Now let’s create an entity and new user records.
           let userEntity = NSEntityDescription.entity(forEntityName: "StickPacks", in: managedContext)!
           
           //final, we need to add some data to our newly created record for each keys using
           //here adding 5 data with loop
           
        for i in 1...5 {
               
//               let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
//
//            let stickerData : UIImage = UIImage(data: MainViewController.shared.sourceImg)!
//            let strBase64 = stickerData.base64EncodedData(options: .lineLength64Characters)
//            user.setValue("Saurav Sharma", forKey: "data")
           }

           //Now we have set all the values. The next step is to save them inside the Core Data
           
           do {
               try managedContext.save()
              
           } catch let error as NSError {
               print("Could not save. \(error), \(error.userInfo)")
           }
       }
}
