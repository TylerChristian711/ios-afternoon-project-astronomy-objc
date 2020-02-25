//
//  TACSolFetcher.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(TACSolFetcherCompletion) (NSArray *_Nullable sols, NSError *_Nullable error);

@interface TACSolFetcher : NSObject



-(void)fetchPhotosForRover:(NSString *)rover
                withSol:(NSNumber *)sol
               completion:(TACSolFetcherCompletion)completion;

@end

NS_ASSUME_NONNULL_END
