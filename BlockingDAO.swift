//
//  BlockingDAO.swift
//  ParallelizeBlockingAPI
//
//  Created by Vincent on 21/07/2017.
//  Copyright © 2017 Vincent Pradeilles. All rights reserved.
//

import Foundation

/* Data Model */

struct User {
    
}

struct Order {
    let products: [Product]
}

struct Product {
    
}

enum ShippingStatus {
    case inProgress(Product, Order)
    case delivered(Product, Order)
}

/* Blocking API */

fileprivate let daoAccessTime: TimeInterval = 0.1 // s

struct BlockingAPI {
    static func getOrderIds(for user: User) -> [Int] {
        Thread.sleep(forTimeInterval: daoAccessTime)
        
        return [1, 2, 3, 4, 5]
    }
    
    static func getOrder(orderId: Int) -> Order {
        Thread.sleep(forTimeInterval: daoAccessTime * 4)
        
        switch orderId {
        case 1:
            return Order(products: [Product(), Product(), Product()])
        case 2:
            return Order(products: [Product(), Product()])
        case 3:
            return Order(products: [Product()])
        case 4:
            return Order(products: [Product(), Product(), Product(), Product(), Product(), Product(), Product()])
        case 5:
            return Order(products: [Product(), Product(), Product()])
        default:
            return Order(products: [])
        }
    }
    
    static func getStatus(for product: Product, in order: Order) -> ShippingStatus {
        Thread.sleep(forTimeInterval: daoAccessTime)
        
        return (arc4random_uniform(2) == 0) ? .inProgress(product, order) : .delivered(product, order)
    }
}
