//
//  TACMarsCamera.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACMarsCamera.h"

@implementation TACMarsCamera


-(instancetype) initWithName:(NSString *)name fullName:(NSString *)fullName {
    self = [super init];
    if (self) {
        _name = name;
        _fullName = fullName;
    }
    return self;
}

-(instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"name"];
    NSString *fullName = dictionary[@"full_name"];
   self = [self initWithName:name fullName:fullName];
    return self;
}

@end
