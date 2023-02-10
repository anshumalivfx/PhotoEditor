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
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 0){
            
            
            
            self.view.addSubview(editorView)
        }
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
