//
//  ProductsModel.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 18/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import Foundation

struct ApiResponse: Decodable {
    let products: [Products]    
}

struct Products: Decodable {
    let id: Int?
    let title: String?
    let tags: String?
    let variants: [Variants]?
    let images: [Images]?
    let options: [options]?
}

struct Variants: Decodable {
    let title: String?
    let price: String?
}

struct Images:Decodable {
    let src: String?
}

struct options: Decodable {
    let values: [String]?
}

//"products": [
//{
//    "id": 2759137027,
//    "title": "Aerodynamic Concrete Clock",
//    "body_html": "Transition rich vortals",
//    "vendor": "Jenkins, Orn and Blick",
//    "product_type": "Clock",
//    "created_at": "2015-09-23T20:48:54-04:00",
//    "handle": "aerodynamic-concrete-clock",
//    "updated_at": "2018-12-17T13:52:16-05:00",
//    "published_at": "2015-09-23T20:48:54-04:00",
//    "template_suffix": null,
//    "published_scope": "web",
//    "tags": "Aerodynamic, Clock, Concrete",
//    "admin_graphql_api_id": "gid://shopify/Product/2759137027",
//    "variants": [
//        {
//            "id": 8041741187,
//            "product_id": 2759137027,
//            "title": "Mint green",
//            "price": "4.32",
//            "sku": "",
//            "position": 1,
//            "inventory_policy": "deny",
//            "compare_at_price": null,
//            "fulfillment_service": "manual",
//            "inventory_management": null,
//            "option1": "Mint green",
//            "option2": null,
//            "option3": null,
//            "created_at": "2015-09-23T20:48:54-04:00",
//            "updated_at": "2018-12-17T13:52:15-05:00",
//            "taxable": true,
//            "barcode": null,
//            "grams": 4917,
//            "image_id": null,
//            "weight": 4.917,
//            "weight_unit": "kg",
//            "inventory_item_id": 6015629699,
//            "inventory_quantity": 134,
//            "old_inventory_quantity": 134,
//            "requires_shipping": true,
//            "admin_graphql_api_id": "gid://shopify/ProductVariant/8041741187"
//        },
//        {
//            "id": 8041741251,
//            "product_id": 2759137027,
//            "title": "Violet",
//            "price": "76.67",
//            "sku": "",
//            "position": 2,
//            "inventory_policy": "deny",
//            "compare_at_price": null,
//            "fulfillment_service": "manual",
//            "inventory_management": null,
//            "option1": "Violet",
//            "option2": null,
//            "option3": null,
//            "created_at": "2015-09-23T20:48:54-04:00",
//            "updated_at": "2018-12-17T13:52:16-05:00",
//            "taxable": true,
//            "barcode": null,
//            "grams": 8081,
//            "image_id": null,
//            "weight": 8.081,
//            "weight_unit": "kg",
//            "inventory_item_id": 931603459,
//            "inventory_quantity": 112,
//            "old_inventory_quantity": 112,
//            "requires_shipping": true,
//            "admin_graphql_api_id": "gid://shopify/ProductVariant/8041741251"
//        }
//    ],
//    "options": [
//        {
//            "id": 3321582851,
//            "product_id": 2759137027,
//            "name": "Title",
//            "position": 1,
//            "values": [
//                "Mint green",
//                "Violet"
//            ]
//        }
//    ],
//    "images": [
//        {
//            "id": 5641966979,
//            "product_id": 2759137027,
//            "position": 1,
//            "created_at": "2015-09-23T20:48:54-04:00",
//            "updated_at": "2015-09-23T20:48:54-04:00",
//            "alt": null,
//            "width": 300,
//            "height": 300,
//            "src": "https://cdn.shopify.com/s/files/1/1000/7970/products/Aerodynamic_20Concrete_20Clock.png?v=1443055734",
//            "variant_ids": [],
//            "admin_graphql_api_id": "gid://shopify/ProductImage/5641966979"
//        }
//    ],
//    "image": {
//        "id": 5641966979,
//        "product_id": 2759137027,
//        "position": 1,
//        "created_at": "2015-09-23T20:48:54-04:00",
//        "updated_at": "2015-09-23T20:48:54-04:00",
//        "alt": null,
//        "width": 300,
//        "height": 300,
//        "src": "https://cdn.shopify.com/s/files/1/1000/7970/products/Aerodynamic_20Concrete_20Clock.png?v=1443055734",
//        "variant_ids": [],
//        "admin_graphql_api_id": "gid://shopify/ProductImage/5641966979"
//    }
//},
