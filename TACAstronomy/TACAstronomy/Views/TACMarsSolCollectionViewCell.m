//
//  TACMarsSolCollectionViewCell.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACMarsSolCollectionViewCell.h"

@implementation TACMarsSolCollectionViewCell

- (void)configureCellWithImageURL:(NSURL *)url {
    [self loadImageForURL:url];
}

- (void)loadImageForURL:(NSURL *)url {
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return;
        }
        
        if (!data) {
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.solImageView.image = [UIImage imageWithData:data];
        });
    }] resume];
}

@end
