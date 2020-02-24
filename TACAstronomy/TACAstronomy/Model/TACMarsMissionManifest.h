//
//  TACMarsMissionManifest.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TACMarsMissionManifest : NSObject


@property (nonatomic,readonly,nonnull) NSArray *Sols;

-(instancetype _Nonnull )intitWithDictionary:(NSDictionary * _Nonnull) dictionary;


@end


