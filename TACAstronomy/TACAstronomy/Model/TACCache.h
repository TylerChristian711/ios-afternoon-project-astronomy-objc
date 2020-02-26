//
//  TACCache.h
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Cache)
@interface TACCache : NSObject

-(void)cacheItem:(id)value forkey:(NSNumber *)key;
-(id _Nullable)itemForKey:(NSNumber *)key;
-(id _Nullable)removeItemForKey:(NSNumber *)key;
-(void)clear;

@end

NS_ASSUME_NONNULL_END
