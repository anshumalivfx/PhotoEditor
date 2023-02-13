//
//  Ext.h
//  PhotoEditing
//
//  Created by Anshumali Karna on 12/02/23.
//

#ifndef Ext_h
#define Ext_h
#import <UIKit/UIKit.h>

@interface AnshiFilterPack : UIImage
+ (UIImage *)BB_imageByAdjustingSaturationOfImage:(UIImage *)image delta:(CGFloat)delta;
- (UIImage *)BB_imageByAdjustingSaturationBy:(CGFloat)delta;
@end


#endif /* Ext_h */
