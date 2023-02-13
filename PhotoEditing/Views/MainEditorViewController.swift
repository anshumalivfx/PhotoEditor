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
    
    private var saturationEditingView = UIView()
    private var brightnessAndContrast = UIView()

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var navigationBarItems: UINavigationItem!
    
    
    private var filter: Filter?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let backButtonImage = UIImage(systemName: "xmark")
        backButtonImage?.withTintColor(.white)
        filter = Filter(with: image)
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.screenWidth - 50, height: 500)
        imageView.center = self.view.center
        imageView.contentMode = .scaleAspectFit
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonAction))
        navigationBar.delegate = self
        navigationBarItems.leftBarButtonItems = [backButton]
        navigationBarItems.leftBarButtonItem?.tintColor = .white
        tabBar.delegate = self
        saturationEditingView.backgroundColor = #colorLiteral(red: 0.2601505816, green: 0.2649644017, blue: 0.2606576681, alpha: 1)
        saturationEditingView.frame = CGRect(x: 0, y: self.view.frame.size.height - 130, width: self.view.frame.width, height: 50)
        
        saturationEditingView.alpha = 0
        let mySlider = UISlider(frame:CGRect(x: 10, y: 15, width: saturationEditingView.frame.width - 30, height: 20))
        mySlider.minimumValue = 0
        mySlider.maximumValue = 1
        mySlider.isContinuous = true
        mySlider.tintColor = UIColor(named: "primaryColor")
        mySlider.addTarget(self, action: #selector(self.saturationSliderChange(_:)), for: .valueChanged)
        saturationEditingView.addSubview(mySlider)
        
        brightnessAndContrast.backgroundColor = #colorLiteral(red: 0.2601505816, green: 0.2649644017, blue: 0.2606576681, alpha: 1)
        brightnessAndContrast.frame = CGRect(x: 0, y: self.view.frame.size.height - 130, width: self.view.frame.width, height: 50)
        
        brightnessAndContrast.alpha = 0
        let contrastLabel = UILabel(frame: CGRect(x: 10, y: 5, width: brightnessAndContrast.frame.width - 30, height: 20))
        contrastLabel.text = "Contrast"
        contrastLabel.textColor = .white
        
        self.brightnessAndContrast.addSubview(contrastLabel)
        let brightnessSlider = UISlider(frame:CGRect(x: 10, y: 15, width: brightnessAndContrast.frame.width - 30, height: 20))
        brightnessSlider.minimumValue = 0
        brightnessSlider.maximumValue = 3
        brightnessSlider.value = 1
        brightnessSlider.tintColor = UIColor(named: "primaryColor")
        brightnessSlider.addTarget(self, action: #selector(self.brightness(_:)), for: .valueChanged)
        
        self.brightnessAndContrast.addSubview(brightnessSlider)
        
        self.view.addSubview(brightnessAndContrast)
        
        self.view.addSubview(saturationEditingView)
        // Do any additional setup after loading the view.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.tag == 0){
            UIView.transition(with: self.saturationEditingView, duration: 0.3) { [weak self] in
                if(self?.saturationEditingView.alpha == 1.0){
                    self?.saturationEditingView.alpha = 0
                    self?.brightnessAndContrast.alpha = 0
                }
                else {
                    self?.saturationEditingView.alpha = 1.0
                    self?.brightnessAndContrast.alpha = 0
                }
                
            }
        }
        if(item.tag == 1){
            
        }
        if(item.tag == 2){
            
            UIView.transition(with: self.saturationEditingView, duration: 0.3) { [weak self] in
                if(self?.brightnessAndContrast.alpha == 1.0){
                    self?.saturationEditingView.alpha = 0
                    self?.brightnessAndContrast.alpha = 0
                }
                else {
                    self?.brightnessAndContrast.alpha = 1.0
                    self?.saturationEditingView.alpha = 0
                }
            }
            
        }
    }
    
    @objc func brightness(_ sender: UISlider!){
        self.imageView.image = increaseContrast(self.image, value: CGFloat(sender.value))
    }
    
    
    @objc func backButtonAction(){
        let alert = UIAlertController(title: "Discard", message: "You Wanna Discard This Masterpiece?", preferredStyle: .alert)
        
        let yesButton = UIAlertAction(title: "Yes", style: .cancel) { UIAlertAction in
            self.performSegue(withIdentifier: "discardEditing", sender: self)
        }
        
        let noButton = UIAlertAction(title: "No", style: .default)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        
        alert.modalPresentationStyle = .formSheet
        
        present(alert, animated: true)
        
        
    }
    
    func increaseContrast(_ image: UIImage, value: CGFloat) -> UIImage {
        let inputImage = CIImage(image: image)!
        let parameters =
        [
           "inputContrast": NSNumber(value: value) // set how many contrast you want
        ]
        let outputImage = inputImage.applyingFilter("CIColorControls",
             parameters: parameters)
        let context = CIContext(options: nil)
        let img = context.createCGImage(outputImage, from: outputImage.extent)!
        return UIImage(cgImage: img)
    }
    
    func imageContrast(imgView : UIImageView , sliderValue : CGFloat, image: UIImage){

            let aUIImage = image
            let aCGImage = aUIImage.cgImage

            var aCIImage = CIImage(cgImage: aCGImage!)
            var context = CIContext(options: nil)
            var contrastFilter = CIFilter(name: "CIColorControls")
            contrastFilter!.setValue(aCIImage, forKey: "inputImage")

            aCIImage = CIImage(cgImage: aCGImage!)
            context = CIContext(options: nil)
            contrastFilter = CIFilter(name: "CIColorControls")
            contrastFilter!.setValue(aCIImage, forKey: "inputImage")
            contrastFilter!.setValue(sliderValue, forKey: "inputContrast")
            let outputImage = contrastFilter!.outputImage!
            let cgimg = context.createCGImage(outputImage, from: outputImage.extent)
            let newUIImage = UIImage(cgImage: cgimg!)
            imgView.image = newUIImage
            print("contrast")
        }
    
    
    
    @objc func saturationSliderChange(_ sender:UISlider!){
        guard let filter = filter else { return }
        self.imageView.image = UIImage(ciImage: filter.filter(saturation: NSNumber(value: sender.value)))
        
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
