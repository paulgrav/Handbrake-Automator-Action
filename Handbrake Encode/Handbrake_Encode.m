//
//  Handbrake_Encode.m
//  Handbrake Encode
//
//  Created by Paul Grave on 17/07/2011.
//  Copyright 2011 Paul Grave. All rights reserved.
//

#import "Handbrake_Encode.h"

@implementation Handbrake_Encode
@synthesize qualityTextField;

- (IBAction)sliderMove:(id)sender {
	if (![sender isKindOfClass:[NSSlider class]])
        return;
	
	double sliderValue = [(NSSlider *)sender doubleValue];
	
	// we're interested in quarters
	int tickInterval = 4;
	
	// round to the nearest 0.25
	double roundedValue = round(sliderValue * tickInterval)/tickInterval;	
	
	// make sure the slider only hits values rounded to 0.25
	[sender setDoubleValue:roundedValue];
	
	// we need to invert the scale since Handbrake's scale is 51 -> 0, whilst by default NSSlider is 0 -> 51
	quality = fabs(roundedValue - 51);
	NSString *qualityText = [NSString stringWithFormat:@"RF: %.2f", quality];

	// save quality in the string
	[self.parameters setValue:[NSNumber numberWithDouble:quality] forKey:@"quality"];
	
	[qualityTextField setStringValue:qualityText];
}

@end
