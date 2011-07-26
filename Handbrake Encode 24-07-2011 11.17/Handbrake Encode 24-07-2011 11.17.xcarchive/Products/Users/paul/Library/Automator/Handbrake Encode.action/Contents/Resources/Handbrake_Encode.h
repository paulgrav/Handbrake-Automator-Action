//
//  Handbrake_Encode.h
//  Handbrake Encode
//
//  Created by Paul Grave on 17/07/2011.
//  Copyright 2011 Paul Grave. All rights reserved.
//

#import <Automator/AMShellScriptAction.h>

@interface Handbrake_Encode : AMShellScriptAction {
	NSTextField *qualityTextField;
	double quality;
}

@property (assign) IBOutlet NSTextField *qualityTextField;

- (IBAction)sliderMove:(id)sender;


@end
