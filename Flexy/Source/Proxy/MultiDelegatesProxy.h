//
//  DMMultiDelegatesProxy.h
//  MultiDelegatesProxyExample
//
//  Created by Daniele Margutti on 05/02/14.
//  Copyright (c) 2014 danielemargutti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MultiDelegatesProxy : NSProxy


@property (nonatomic,strong)	NSArray		*delegates;

@property (nonatomic,weak)	id			 mainDelegate;

+ (id) newProxyWithMainDelegate:(id) aMainDelegate other:(NSArray *) aDelegates;


@end
