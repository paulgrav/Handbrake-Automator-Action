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
	int tickInterval = 4;
	double roundedValue = round(sliderValue * tickInterval)/tickInterval;	
	
	[sender setDoubleValue:roundedValue];
	
	quality = fabs(roundedValue - 51);
	NSString *qualityText = [NSString stringWithFormat:@"RF: %.2f", quality];

	// save quality in the string
	[self.parameters setValue:[NSNumber numberWithDouble:quality] forKey:@"quality"];
	
	[qualityTextField setStringValue:qualityText];
}

@end
