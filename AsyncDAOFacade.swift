//
//  AsyncDAOFacade.swift
//  ParallelizeBlockingAPI
//
//  Created by Vincent on 21/07/2017.
//  Copyright © 2017 Vincent Pradeilles. All rights reserved.
//

import Foundation
import RxSwift

struct AsyncDAOFacade {
    static func getOrderIds(for user: User) -> Observable<Int> {
        return Observable.from(BlockingAPI.getOrderIds(for: user))
    }
    
    static func getOrder(orderId: Int) -> Observable<Order> {
        return Observable.just(BlockingAPI.getOrder(orderId: orderId))
    }
    
    static func getStatus(for product: Product, in order: Order) -> Observable<ShippingStatus> {
        return Observable.just(BlockingAPI.getStatus(for: product, in: order))
    }
}
