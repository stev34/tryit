//
//  AnnoncesPostController.h
//  EdelMode
//
//  Created by jb on 29/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnnoncesPostController : UIViewController<UIPopoverControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
		
	UIPopoverController*popover;
	UIImageView*image1;
    int pos;
	UIImagePickerController*picker;
}
-(void)albumpre;
- (void)camerapre;
- (UIImage*)resizeImage:(UIImage*)theimage size:(CGSize)size;
-(UIImageView*)viewforimageview:(UIView*)content ;
-(UIButton*)view:(UIView*)content  button:(NSString*)thetitle  action:(SEL)action;
- (void)view:(UIView*)content label:(NSString*)thetitle alignement:(UITextAlignment)align font:(UIFont*)font color:(UIColor*)c;
@end
