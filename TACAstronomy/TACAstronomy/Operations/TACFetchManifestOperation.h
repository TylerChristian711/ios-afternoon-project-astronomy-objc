//
//  TACFetchManifestOperation.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TACManifestFetcher.h"
#import "TACMarsMissionManifest.h"

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(FetchManifestOperation)
@interface TACFetchManifestOperation : NSOperation

@property (nonatomic, nonnull, readonly) TACManifestFetcher *manifestFetcher;
@property (nonatomic, nullable) TACMarsMissionManifest *manifest;

-(instancetype) initWithManifestFetcher:(TACManifestFetcher *)manifestFetcher;

@end

NS_ASSUME_NONNULL_END
