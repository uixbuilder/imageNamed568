#Install
1) Add UIImage+Additions_568.h and UIImage+Additions_568.m to your project
2) Make call *[UIImage patchImageNamedToSupport568Resources]* somevere in your main.h or delegate.
####main.h

	#import <UIKit/UIKit.h>
	#import "AppDelegate.h"
	#import "UIImage+Additions_568.h"
	
	int main(int argc, char *argv[])
	{
	    @autoreleasepool {
	        [UIImage patchImageNamedToSupport568Resources];
	        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	    }
	}

	

#Usage
Use your pathced *imageNamed* used in the same way as before
####exapmle
	NSLog(@"%f",[UIImage imageNamed:@"Default"].size.height); // make sure you have loaded taller version of image in iphone 5 simulator :)