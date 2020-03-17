//
//  CameraViewController.swift
//  Parstagram
//
//  Created by EatMoreOranges on 3/11/20.
//  Copyright © 2020 EatMoreOranges. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage // so you can resize the image to upload to heroku

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        //option 1
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        //check if camera is available
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300) // import alamofireimage so you can resize the image to upload to heroku
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "Posts")// this is the table with the name "post"
        
        //bellow are the dictionary entries for the Posts table
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground { (Success, Error) in
            if Success {
                self.dismiss(animated: true, completion: nil)
                print("Saved Successfully!")
            } else {
                print("Error!")
            }
        }
        
        
        
        
    }
    
}
