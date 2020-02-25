//
//  TACFetchPhotoOperation.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TACMarsSol.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(FetchPhotoOperation)
@interface TACFetchPhotoOperation : NSOperation

@property (nonatomic, nonnull, readonly) TACMarsSol *sol;
@property (nonatomic, nullable) UIImage *image;

-(instancetype)initWithSol:(TACMarsSol *)sol;

@end

NS_ASSUME_NONNULL_END
