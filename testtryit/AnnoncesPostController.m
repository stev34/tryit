//
//  AnnoncesPostController.m
//  EdelMode
//
//  Created by jb on 29/01/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AnnoncesPostController.h"

#import <QuartzCore/QuartzCore.h>



@implementation AnnoncesPostController

- (id)init{
    if ((self = [super init])) {
        // Custom initialization
		NSLog(@"AnnoncesPostController alloc");

		
		self.navigationItem.title=NSLocalizedString(@"POSTWATCH",@"");
		

		

		//NSLog(@"preview: %@",mypreview);
    }
    return self;
}


- (void)loadView {
	NSLog(@"AnnoncesPostController loadView");
	UIScrollView*scroll=[[UIScrollView	alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    scroll.backgroundColor=[UIColor blueColor];
	[self setView:scroll];
	 pos=30;
	int width=self.view.frame.size.width;
	//int height=self.view.frame.size.height;
	
	UIView*tmp=[[UIView	alloc] initWithFrame:CGRectZero];
	tmp.backgroundColor=[UIColor colorWithRed:0.31 green:0.52 blue:0.857 alpha:1.0];
	tmp.alpha=0.2;
	
	int deb=pos;
	tmp.layer.cornerRadius=12;
	[scroll addSubview:tmp ];
	pos+=5;

	
	NSString *tmpn=[NSString stringWithFormat:@"%@%@" ,NSLocalizedString(@"IMG1",@""),@"*"];
	
	[self view:scroll label:tmpn alignement:UITextAlignmentLeft font:[UIFont boldSystemFontOfSize:17 ] color:[UIColor whiteColor ] ];
	pos+=30;
	UIButton *btn=[self view:scroll button:@"camera" action:@selector(image1pre)];
	btn.titleLabel.font=[UIFont systemFontOfSize:12];
	[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	btn.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.8];btn.layer.borderColor=[[UIColor colorWithRed:0.0 green:0.537 blue:0.890 alpha:1.0] CGColor];
	btn.layer.borderWidth=1.5;
	
	btn.frame=CGRectMake(30, pos, 100, 25);
	pos+=50;
	btn=[self view:scroll button:@"album" action:@selector(album1pre)];
	btn.titleLabel.font=[UIFont systemFontOfSize:12];
	[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	btn.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.8];btn.layer.borderColor=[[UIColor colorWithRed:0.0 green:0.537 blue:0.890 alpha:1.0] CGColor];
	btn.layer.borderWidth=1.5;
	
	btn.frame=CGRectMake(30, pos, 100, 25);
	pos+=50;
	btn=[self view:scroll button:@"clear" action:@selector(clear1pre)];
	btn.titleLabel.font=[UIFont systemFontOfSize:12];
	[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	btn.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.8];btn.layer.borderColor=[[UIColor colorWithRed:0.0 green:0.537 blue:0.890 alpha:1.0] CGColor];
	btn.layer.borderWidth=1.5;
	
	btn.frame=CGRectMake(30, pos, 100, 25);
	if (image1) { [image1 release];image1=nil; }
	if (!image1) {
		pos-=150;
		image1=[self viewforimageview:scroll];
    }else {
		[scroll addSubview:image1];
	}
	tmp.frame=CGRectMake(20, deb, width-40, pos-deb);
	[tmp release];
	pos+=3;
	
	
	pos+=30;
	
		
	[scroll setContentSize:CGSizeMake(width, pos) ];
	
	
	
	[scroll release ];
}

- (void)view:(UIView*)content label:(NSString*)thetitle alignement:(UITextAlignment)align font:(UIFont*)font color:(UIColor*)c{
	UILabel *lbltitre;
	int height,bord=40;
	
	int width=self.view.frame.size.width;

	lbltitre=[[UILabel alloc ]initWithFrame:CGRectMake(bord, pos, width-bord*2, 70) ];
	[lbltitre setFont:font];
	height= [thetitle   sizeWithFont:lbltitre.font constrainedToSize:CGSizeMake( width-bord*2,1000) lineBreakMode:UILineBreakModeWordWrap].height;
	[lbltitre setTextColor:c ];
	[lbltitre setFrame:CGRectMake(bord, pos,  width-bord*2, height)];
	lbltitre.numberOfLines=0;
	lbltitre.backgroundColor=[UIColor clearColor ];
	lbltitre.textAlignment=align;
	[lbltitre setText:thetitle];
	[content addSubview:lbltitre ];
	[lbltitre release];
	pos+=height+5;
}


-(UIButton*)view:(UIView*)content  button:(NSString*)thetitle  action:(SEL)action{
	NSLog(@"addButton: %@", thetitle);
	
	
	UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
	//[btn setBackgroundImage:[UIImage imageNamed:@"bouton_titanium_on.png" ] forState:UIControlStateHighlighted ];
	///[btn setBackgroundImage:[UIImage imageNamed:@"bouton_titanium_off.png" ] forState:UIControlStateNormal ];
	[btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside ];
	[btn setFrame:CGRectMake(15, pos, 110, 30) ];
	//[btn setFont:[UIFont fontWithName:@"Helvetica Neue" size:13.0 ] ];
	btn.backgroundColor=[UIColor colorWithWhite:0.25 alpha:0.8 ];
	//btn.alpha=0.5;
	btn.layer.cornerRadius=8;
	btn.titleLabel.font=[UIFont systemFontOfSize:15];
	[btn setTitle:thetitle forState:UIControlStateNormal ];
	[btn setTitleColor:[UIColor whiteColor ] forState:UIControlStateNormal ];
	[content addSubview:btn ];
	/*
	 UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(55, pos+8, 200, 50)];
	 [lbl setFont:[UIFont boldSystemFontOfSize: 15.0 ] ];
	 lbl.backgroundColor=[UIColor clearColor ];
	 lbl.textAlignment= UITextAlignmentLeft;
	 lbl.textColor=[UIColor whiteColor ];
	 //lbl.alpha=0.5;
	 lbl.numberOfLines=2;
	 [lbl setText:title ];
	 [content addSubview:lbl ];
	 [lbl release ];
	 */
	//pos+=40;
	return btn;
}



-(UIImageView*)viewforimageview:(UIView*)content {
	NSLog(@"addimageview: %@", @"imageview");
	UIImageView *txt=[[UIImageView alloc] initWithFrame:CGRectMake(140, pos, 150, 200)];
	txt.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.3];
	[content addSubview:txt ];
	pos+=210;
	
	return txt;
	
}



-(void)clear1pre {
	image1.image=nil;
}


-(void)image1pre {
	[self camerapre];
}


-(void)album1pre {
	[self albumpre];
}


-(void)albumpre{
	NSLog(@"albumpre");
[NSTimer scheduledTimerWithTimeInterval:0.20 target:self selector:@selector(album) userInfo:nil repeats:NO];
}
-(void)album{
	NSLog(@"album");
	
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
		
		UIImagePickerController*mypicker;
		mypicker = [[UIImagePickerController alloc] init];
		//picker = [[OwnImagePickerController alloc] init];
		mypicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		mypicker.navigationBar.tintColor=self.navigationController.navigationBar.tintColor;
		//picker.allowsImageEditing = YES;
		mypicker.delegate = self;
		///[picker setShowsCameraControls:NO ];
		
		
		
		
		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
		{
			
			//popover = [NSClassFromString(@"UIPopoverController") initWithContentViewController:mypicker];
			popover = [[UIPopoverController alloc] initWithContentViewController:mypicker];
			[popover presentPopoverFromRect:CGRectMake(100, 100, 400, 400) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
			popover.delegate=self;
		}else {
			
			[self presentModalViewController:mypicker animated:YES];
		}
		
		
		
		[mypicker release ];
		mypicker=nil;
		
	}
	
	
	//[progressInd stopAnimating];
}
- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController{
	
	NSLog(@"popoverControllerShouldDismissPopover");
	return YES;
}
																						
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
	NSLog(@"popoverControllerDidDismissPopover");
	popover.delegate=nil;
	[popover release ];
	popover=nil;
	
}

- (void)camerapreold
{
	NSLog(@"camerapre");
	BOOL iphone;
	NSLog(@"device: %@",[[UIDevice  currentDevice] model]);
	if ([[[UIDevice  currentDevice] model]  isEqualToString: @"iPhone"]) {
		NSLog(@"iPhone");
		iphone=YES;
	}else if ([@"iPod touch" isEqualToString:[[UIDevice currentDevice] model] ]) {
		NSLog(@"iPod touch");
		iphone=NO;
	}else {
		NSLog(@"unknown device or ipad");
		iphone=NO;	
	}
	if (iphone) {
	//[self camera];
		[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(camera) userInfo:nil repeats:NO];
	}else {
		UIAlertView *alert=[[UIAlertView alloc ]initWithTitle:NSLocalizedString(@"NO_CAMERA", @"") message:NSLocalizedString(@"DISABLED_FUNCTION", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil ];
		[alert show ];
		[alert release ];
		
		
	}
	
	
	
	
}

- (void)camerapre
{
	NSLog(@"camerapre");
    
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    	[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(camera) userInfo:nil repeats:NO];
        
    }else{
        
        UIAlertView *alert=[[UIAlertView alloc ]initWithTitle:NSLocalizedString(@"NO_CAMERA", @"") message:NSLocalizedString(@"DISABLED_FUNCTION", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil ];
		[alert show ];
		[alert release ];
        
    }
	
	
}

-(void)camera{
	NSLog(@"camera");
	
	
	int width=self.view.frame.size.width;
	int height=self.view.frame.size.width;
	
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		
		if (picker) {
            [picker release];
        }
        picker = [[UIImagePickerController alloc] init];
		//picker = [[OwnImagePickerController alloc] init];
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
		//picker.allowsImageEditing = YES;
		picker.delegate = self;
		picker.navigationBar.tintColor=self.navigationController.navigationBar.tintColor;
		[picker setShowsCameraControls:NO ];
		
        
        

		UIView *overlay=[[UIView alloc ]initWithFrame:CGRectMake(0, 0, width, height) ];
		
		NSMutableArray *toolButtons = [NSMutableArray arrayWithCapacity:5];
		
		UIBarButtonItem *btn;
		UIImage *btnImage;
		
		
		btnImage = [UIImage imageNamed:@"backportrait.png"];
		
		
		btn = [[UIBarButtonItem alloc] initWithImage:btnImage style:UIBarButtonItemStylePlain target:self action:@selector(removePicker)];
		[toolButtons addObject:btn];
		[btn release];
		
		
		
		
		btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
		[toolButtons addObject:btn];
		[btn release];
		
        btnImage = [UIImage imageNamed:@"shootportrait.png"];
        btn = [[UIBarButtonItem alloc] initWithImage:btnImage style:UIBarButtonItemStylePlain target:picker action:@selector(takePicture)];
        
        
        [toolButtons addObject:btn];
        [btn release];
        
        
        
      	
		
		
		btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
		[toolButtons addObject:btn];
		[btn release];
        

        if ([UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceFront ]) {
            btnImage = [UIImage imageNamed:@"turnportrait.png"];
            btn = [[UIBarButtonItem alloc] initWithImage:btnImage style:UIBarButtonItemStylePlain target:self action:@selector(turn)];
            [toolButtons addObject:btn];
            [btn release]; 
        }
        

        
		btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
		[toolButtons addObject:btn];
		[btn release];
		
		
		CGRect rect = [[UIScreen mainScreen]bounds];
		rect.origin.y = rect.size.height - 56;
		rect.size.height = 56;
		
		UIToolbar*toolBar = [[UIToolbar alloc] initWithFrame:rect]; 
		toolBar.items = toolButtons;
		toolBar.barStyle = UIBarStyleBlackTranslucent;
		//toolBar.tintColor=[UIColor colorWithRed:64.0/255.0 green:64.0/255.0 blue:0.0/255.0 alpha:1.0 ];
		//	toolBar.alpha=0.5;
		[overlay addSubview:toolBar];
		[toolBar release];
		
		
		
		
		[picker setCameraOverlayView:overlay];
		
		
		[overlay release];
		[self presentModalViewController:picker animated:YES];

	}
	
	
	
	
	
	
	
}

-(void)turn{
    if (picker.cameraDevice==UIImagePickerControllerCameraDeviceFront) {
        picker.cameraDevice=UIImagePickerControllerCameraDeviceRear;
        NSLog(@"UIImagePickerControllerCameraDeviceRear,  %d",UIImagePickerControllerCameraDeviceRear);        
        //NSLog(@"UIImagePickerControllerCameraDeviceRear, %@, %d",UIImagePickerControllerCameraDeviceRear,UIImagePickerControllerCameraDeviceRear);        
    } else {
        picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
        NSLog(@"UIImagePickerControllerCameraDeviceFront,  %d",UIImagePickerControllerCameraDeviceFront);        
        //NSLog(@"UIImagePickerControllerCameraDeviceFront,  %@",UIImagePickerControllerCameraDeviceFront);        
    }

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)CurrentPicker {
    //hide the picker if user cancels picking an image.
	[self.navigationController dismissModalViewControllerAnimated:YES];
    [picker release ];
    picker=nil;
	 
}
- (void)removePicker {
    //hide the picker if user cancels picking an image.
	[self.navigationController dismissModalViewControllerAnimated:YES]; 
    [picker release ];
    picker=nil;
}

- (void)imagePickerController:(UIImagePickerController *)thepicker didFinishPickingImage:(UIImage *)theimage editingInfo:(NSDictionary *)editingInfo{
	NSLog(@"size width: %f  height: %f",theimage.size.width,theimage.size.height);
	//we need to save each image and then show it in the interface!
	CGSize thesize=theimage.size;
	
	if (thesize.width>300.0) {
		thesize=CGSizeMake(300.0, (int)thesize.height*(300/thesize.width));
	}
	
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *iconname;
    NSString *pngFilePath;
    NSData *data1 ;
	UIImage *imageToSave;
	UIImageView*vue;
	
    NSLog(@"image1");
    vue=image1;
    
    
    

    iconname = @"image1";
    
    
	vue.frame=CGRectMake(vue.frame.origin.x, vue.frame.origin.y, thesize.width/2.0, thesize.height/2.0);
	vue.image=[self resizeImage:theimage size:thesize];
	
	imageToSave = vue.image;
	
	pngFilePath = [NSString stringWithFormat:@"%@/preview_%@.png",docDir,iconname];
	data1 = [NSData dataWithData:UIImagePNGRepresentation(imageToSave)];
	//[data1 writeToFile:pngFilePath atomically:YES];
	//	[mypreview setObject:pngFilePath forKey:iconname];
	//	
	
	[self.navigationController dismissModalViewControllerAnimated:YES];
	[popover dismissPopoverAnimated:YES];
	
	popover.delegate=nil;
	[popover release ];
	popover=nil;
	//[self check];
    [picker release ];
    picker=nil;
}

- (UIImage*)resizeImage:(UIImage*)theimage size:(CGSize)size
{	
	UIGraphicsBeginImageContext( size );
	[theimage drawInRect:CGRectMake(0,0,size.width ,size.height )];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}
/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	NSLog(@"AnnoncesPostController dealloc");
    [picker release ];
    picker=nil;
	[image1 release ];

    [super dealloc];
}


@end
