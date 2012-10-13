#Install
* Add UIImage+Additions_568.h and UIImage+Additions_568.m to your project 
* Make call *[UIImage patchImageNamedToSupport568Resources]* somewhere in your main.h or AppDelegate.

####example of main.h

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
Use your patched *imageNamed* in the same way as before
####example of usage
	NSLog(@"%f",[UIImage imageNamed:@"Default"].size.height); // make sure you have loaded taller version of image in iphone 5 simulator :)