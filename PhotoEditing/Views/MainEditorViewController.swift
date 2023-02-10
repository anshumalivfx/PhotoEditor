//
//  MainEditorViewController.swift
//  PhotoEditing
//
//  Created by Anshumali Karna on 10/02/23.
//

import UIKit

class MainEditorViewController: UIViewController, UINavigationBarDelegate, UITabBarDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var image:UIImage!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var tabBar: UITabBar!

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
    func addHeightConstraintToTabbar() -> Void {
        let heightConstant:CGFloat = self.view.safeAreaInsets.bottom + 49.0
        tabBar.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
    
    var editorBarHidden : Bool = false
    
    private var editorView = UIView()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationBar.delegate = self
        tabBar.delegate = self
        
    
        
        imageView.image = self.image
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 50, height: 500)
        imageView.center = self.view.center
        imageView.contentMode = .scaleAspectFit
        
        editorView.backgroundColor = #colorLiteral(red: 0.2601505816, green: 0.2649644017, blue: 0.2606576681, alpha: 1)
        editorView.frame = CGRect(x: 0, y: self.view.frame.size.height - 130, width: self.view.frame.width, height: 50)
        
        editorView.alpha = 0
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 0){
            let mySlider = UISlider(frame:CGRect(x: 10, y: 15, width: editorView.frame.width - 30, height: 20))
            mySlider.minimumValue = 0
            mySlider.maximumValue = 100
            mySlider.isContinuous = true
            mySlider.tintColor = UIColor.green
            mySlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
            
            editorView.addSubview(mySlider)
            
            UIView.transition(with: self.editorView, duration: 0.3) { [weak self] in
                
                self?.editorView.alpha = 1.0
                
            }
            
            
            
            
            self.view.addSubview(editorView)
        }
        if(item.tag == 1){
            
            
            UIView.transition(with: self.editorView, duration: 0.3) { [weak self] in
                
                self?.editorView.alpha = 1.0
                
            }
            
            
            
            self.view.addSubview(editorView)
        }
        if(item.tag == 2){
            
            
            UIView.transition(with: self.editorView, duration: 0.3) { [weak self] in
                
                self?.editorView.alpha = 1.0
                
            }
            
            
            
            
            self.view.addSubview(editorView)
        }
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
        {
            print("Slider value changed")
            
            // Use this code below only if you want UISlider to snap to values step by step
            
            
            print("Slider step value \(Int(sender.value))")
        }
    
    @IBAction func touchFinished(_ sender: UIBarButtonItem) {
        print("hello")
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
           return .topAttached
       }
    
    @objc func clickButton(){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
