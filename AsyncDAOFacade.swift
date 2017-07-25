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
        return Observable.deferred { return Observable.from(BlockingAPI.getOrderIds(for: user)) }.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
    }
    
    static func getOrder(orderId: Int) -> Observable<Order> {
        return Observable.deferred { return Observable.just(BlockingAPI.getOrder(orderId: orderId)) }.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
    }
    
    static func getStatus(for product: Product, in order: Order) -> Observable<ShippingStatus> {
        return Observable.deferred { return Observable.just(BlockingAPI.getStatus(for: product, in: order)) }.subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
    }
}
