//
//  TACMarsSol.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TACMarsCamera.h"

NS_ASSUME_NONNULL_BEGIN

@interface TACMarsSol : NSObject

@property (nonatomic, readonly) NSNumber *idNumber;
@property (nonatomic, readonly) NSNumber *sol;
@property (nonatomic,readonly,copy) NSString *imageURL;
@property (nonatomic, readonly) TACMarsCamera *camera;
@property (nonatomic, readonly) NSDate *earthDate;


-(instancetype) initWithIdNumber:(NSNumber *)idNumber
                             sol:(NSNumber *)sol
                        imageURL:(NSString *)imageURL
                          camera:(TACMarsCamera *)camera
                       earthDate:(NSDate *)earthDate;


-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
