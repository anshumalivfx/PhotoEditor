//
//  AnshIFiltersPackNew.swift
//  PhotoEditing
//
//  Created by Anshumali Karna on 12/02/23.
//

import CoreImage
import UIKit

final class Filter {
    private let oryginalImage: CIImage
    private let filter = CIFilter(name: "CIColorControls")!
    init(with image: UIImage) {
        oryginalImage = CIImage(image: image)!
        filter.setValue(oryginalImage, forKey: "inputImage")
    }
    
    func filter(saturation: NSNumber) -> CIImage {
        filter.setValue(saturation, forKey: kCIInputSaturationKey)
        return filter.outputImage!
    }
}


