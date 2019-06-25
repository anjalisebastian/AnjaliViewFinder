//
//  NewPhotoViewController.swift
//  AnjaliViewFinder
//
//  Created by Apple on 6/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
    
    class NewPhotoViewController : UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
        
        
        var imagePicker = UIImagePickerController()
        
        
        @IBOutlet weak var newImage: UIImageView!
        
        @IBOutlet weak var captionText: UITextField!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            imagePicker.delegate = self
            
        }
        
        
        
        @IBAction func selfieButtonTapped(_ sender: Any) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated : true, completion: nil)
        }
        
        @IBAction func libraryButtonTapped(_ sender: Any) {
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated : true, completion: nil)
        }
        
        
        @IBAction func saveButtonTapped(_ sender: Any) {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext  {
                let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
                
                photoToSave.caption = captionText.text
                
                if let userImage = newImage.image {
                    if let userImageData = userImage.pngData() {
                        photoToSave.imageData = userImageData
                    }
                }
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                
                navigationController?.popViewController(animated: true)
                
            }

                    }
                }
                

       
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info : [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                
                newImage.image = selectedImage
            }
            imagePicker.dismiss(animated: true, completion: nil)
            
        }

    


