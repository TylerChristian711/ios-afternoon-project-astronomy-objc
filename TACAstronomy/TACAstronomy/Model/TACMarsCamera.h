//
//  TACMarsCamera.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TACMarsCamera : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *fullName;


-(instancetype) initWithName:(NSString *)name
                    fullName:(NSString *)fullName;

-(instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
