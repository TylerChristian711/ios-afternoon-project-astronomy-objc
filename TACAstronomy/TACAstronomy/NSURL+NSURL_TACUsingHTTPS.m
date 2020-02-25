//
//  NSURL+NSURL_TACUsingHTTPS.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "NSURL+NSURL_TACUsingHTTPS.h"


@implementation NSURL (TACUsingHTTPS)

-(NSURL *)urlUSingHTTPS {
    NSURLComponents *components = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:YES];
    [components setScheme:@"https"];
    return components.URL;
}

@end
