//
//  AppDelegate.swift
//  Sticker Maker
//
//  Created by Saurav Sharma on 07/05/22.
//

import UIKit
import Photos
import FirebaseCore
import IQKeyboardManagerSwift
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                } else {}
            })
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    lazy var persisentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StickerDatabase")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Error -> \(error)")
            }
        }
        return container
    }()
    func saveContext() {
        let context = persisentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            catch{
                let error = error as NSError?
                fatalError("Error -> Saving DB \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
}

