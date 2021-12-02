//
//  ViewController.swift
//  TakePicture
//
//  Created by Deepika Jha on 01/12/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

   
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var btnLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the button label as localized language
        
        btnLabel.titleLabel?.text = strTakePicture
    }

    
    @IBAction func takePic(_ sender: UIButton) {
        let alertController=UIAlertController(title: "Take Picture", message: "Choose Image", preferredStyle: .alert)
        let cameraAction=UIAlertAction(title: "Camera", style:.default) { action  in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker=UIImagePickerController()
                imagePicker.delegate=self
                imagePicker.sourceType=UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing=false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let photoLibraryAction=UIAlertAction(title: "PhotoLibrary", style: .default) { action in
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
                let imagePicker=UIImagePickerController();
                imagePicker.delegate=self
                imagePicker.sourceType=UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing=false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let cancel=UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("user cancelled the action")
        }
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancel)
        
        self.present(alertController,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage=info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        if ((selectedImage) != nil) {
            imgView.image=selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
  


}

