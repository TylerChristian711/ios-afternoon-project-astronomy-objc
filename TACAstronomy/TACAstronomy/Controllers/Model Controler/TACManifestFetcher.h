//
//  TACManifestFetcher.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TACMarsMissionManifest.h"

typedef void(^TACManifestFetcherCompletion)(TACMarsMissionManifest * _Nullable manifest, NSError  *_Nullable error);

NS_SWIFT_NAME(ManifestFetcher)
@interface TACManifestFetcher : NSObject

-(void)fetchManifestForRover:(NSString *_Nullable)rover
                  completion:(TACManifestFetcherCompletion _Nullable)completion;

@end

