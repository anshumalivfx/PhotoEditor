//
//  Exts.m
//  PhotoEditing
//
//  Created by Anshumali Karna on 12/02/23.
//

#import <Foundation/Foundation.h>

#include "Ext.h"

@interface AnshiFilterPack ()


@end


@implementation AnshiFilterPack

+ (UIImage *)BB_imageByAdjustingSaturationOfImage:(UIImage *)image delta:(CGFloat)delta; {
    NSParameterAssert(image);
    
    CIFilter *filter = [CIFilter filterWithName:@"CIColorControls"];
    
    [filter setDefaults];
    [filter setValue:@(delta) forKey:@"inputSaturation"];
    [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
    
    CIImage *output = [filter valueForKey:@"outputImage"];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:output fromRect:output.extent];
    UIImage *retval = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    
    return retval;
}
- (UIImage *)BB_imageByAdjustingSaturationBy:(CGFloat)delta; {
    return [self.class BB_imageByAdjustingSaturationOfImage:self delta:delta];
}

@end
