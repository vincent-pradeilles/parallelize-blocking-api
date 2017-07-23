//
//  BlockingOrchestration.swift
//  ParallelizeBlockingAPI
//
//  Created by Vincent on 21/07/2017.
//  Copyright © 2017 Vincent Pradeilles. All rights reserved.
//

import Foundation

struct BlockingOrchestration {
    static func getShippingStatus(for user: User) -> [ShippingStatus] {
        var shippingStatus: [ShippingStatus] = []

        for orderId in BlockingAPI.getOrderIds(for: user) {
            
            let order = BlockingAPI.getOrder(orderId: orderId)
            
            for product in order.products {
                shippingStatus.append(BlockingAPI.getStatus(for: product, in: order))
            }
        }
        
        return shippingStatus
    }
}
