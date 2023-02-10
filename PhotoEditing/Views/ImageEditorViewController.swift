//
//  ImageEditorViewController.swift
//  PhotoEditing
//
//  Created by Anshumali Karna on 09/02/23.
//

import UIKit

class ImageEditorViewController: UIViewController {
    
    var image:UIImage? = nil
    
    private var saturationButton: UIButton {
        let saturationButton = UIButton()
        saturationButton.setTitle("Saturation", for: .normal)
        saturationButton.backgroundColor = .systemGray
        saturationButton.layer.cornerRadius = 30
        saturationButton.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        saturationButton.center = self.view.center
        saturationButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        return saturationButton
    }
    
    private var imageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 50, height: 500)
        imageView.center = self.view.center
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        self.view.addSubview(self.imageView)
        // Do any additional setup after loading the view.
    }
    
    @objc func selectorX() { }
    
    @objc func selectorName() {
        initPicture()
    }
    
    @objc func clickButton() {
        NSLog("%@", "Hello")
    }
    /*
     MARK: - Navigation
     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
