//
//  TACMarsSolCollectionViewCell.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACMarsSolCollectionViewCell.h"
#import "TACCache.h"
#import "TACFetchPhotoOperation.h"
#import "NSURL+NSURL_TACUsingHTTPS.h"

@interface TACMarsSolCollectionViewCell ()

@property (nonatomic, nonnull) TACCache *cache;
@property (nonatomic, nonnull) NSOperationQueue *photoFetchQueue;

@end

@implementation TACMarsSolCollectionViewCell

- (instancetype) init {
    self = [super init];
    if (self) {
        _cache = [[TACCache alloc] init];
    }
    return self;
}

- (void)configureCellWithSol:(TACMarsSol *)sol {
    UIImage *image = [self.cache itemForKey:sol.idNumber];
    if (image) {
        self.solImageView.image = image;
    } else {
        NSURL *url = [[NSURL URLWithString:sol.imageURL] urlUSingHTTPS];
        [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                return;
            }
            if (!data) {
                return;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.solImageView.image = [UIImage imageWithData:data];
                [self.cache cacheItem:image forkey:sol.idNumber];
            });
        }] resume];
    }
}


@end
