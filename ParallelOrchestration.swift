//
//  ParallelOrchestration.swift
//  ParallelizeBlockingAPI
//
//  Created by Vincent on 21/07/2017.
//  Copyright © 2017 Vincent Pradeilles. All rights reserved.
//

import Foundation
import RxSwift

struct ParallelOrchestration {
    static func getShippingStatus(for user: User) -> Observable<ShippingStatus> {
        return AsyncDAOFacade.getOrderIds(for: user)
            .flatMap(AsyncDAOFacade.getOrder)
            .flatMap { (order) in
               return Observable.from(order.products).flatMap { AsyncDAOFacade.getStatus(for: $0, in: order) }
            }
    }
}
