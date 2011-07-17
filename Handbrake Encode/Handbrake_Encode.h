//
//  Handbrake_Encode.h
//  Handbrake Encode
//
//  Created by Paul Grave on 17/07/2011.
//  Copyright 2011 SkySports.com. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface Handbrake_Encode : AMBundleAction

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
