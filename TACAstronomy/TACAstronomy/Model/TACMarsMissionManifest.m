//
//  TACMarsMissionManifest.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACMarsMissionManifest.h"

@interface TACMarsMissionManifest ()

@property (nonatomic,nonnull) NSMutableArray *internalSols;


@end


@implementation TACMarsMissionManifest

-(instancetype) init {
    self = [super init];
    if (self) {
        _internalSols = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray *)Sols {
    return [_internalSols copy];
}


-(instancetype) intitWithDictionary:(NSDictionary *)dictionary {
    NSDictionary *manifest = dictionary[@"photo_manifest"];
    NSArray *photos = manifest[@"photos"];
    NSMutableArray *sols = [[NSMutableArray alloc] init];
    for (NSDictionary *solDictionary in photos) {
        NSNumber *sol = solDictionary[@"sol"];
        [sols addObject:sol];
     }
    self.internalSols = sols;
    return self;
}




@end
