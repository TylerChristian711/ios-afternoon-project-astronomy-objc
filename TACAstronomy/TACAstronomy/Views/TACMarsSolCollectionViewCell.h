//
//  TACMarsSolCollectionViewCell.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TACMarsSol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TACMarsSolCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *solImageView;
@property (nonatomic, readonly) TACMarsSol *sol;

- (void)configureCellWithImageURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
