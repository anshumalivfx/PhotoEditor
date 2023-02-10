//
//  ViewController.swift
//  PhotoEditing
//
//  Created by Anshumali Karna on 06/02/23.
//

import UIKit

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var imagePicker = UIImagePickerController()
    
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        imagePicker.allowsEditing = false
        
        // Do any additional setup after loading the view.
    }
    @IBAction func galleryButton(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    @IBAction func cameraButton(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.image = userImage
            
                    
        }
        
        dismiss(animated: true)
        
        performSegue(withIdentifier: "toEditor", sender: self)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toEditor" {
            let mainEditorViewController = segue.destination as? MainEditorViewController
            mainEditorViewController?.image = self.image
        }
       
        
        
    }
}




class AnotherViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
    }
}

class ThirdViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Lol"
    }
}

