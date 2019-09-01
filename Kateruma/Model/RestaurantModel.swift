// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - RestaurantModel
struct RestaurantModel: Codable {
  let restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable {
  let id: Int
  let name, neighborhood: String
  let photograph: [String]
  let address: String
  let latlang: Latlang
  let category: [String]
  let cuisineType: String
  let operatingHours: OperatingHours
  let products: [Product]
  
  enum CodingKeys: String, CodingKey {
    case id, name, neighborhood, photograph, address, latlang, category
    case cuisineType = "cuisine_type"
    case operatingHours = "operating_hours"
    case products
  }
}

// MARK: - Latlang
struct Latlang: Codable {
  let lat, lang: Double
}

// MARK: - OperatingHours
struct OperatingHours: Codable {
  let monday, tuesday, wednesday, thursday: String
  let friday, saturday, sunday: String
  
  enum CodingKeys: String, CodingKey {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
  }
}

// MARK: - Product
struct Product: Codable {
  let productID, restaurantID: Int
  let productName, productDescription: String
  let price: Int
  let ingredients: [String]
  let ratingTotal: String
  let reviews: [Review]
  
  enum CodingKeys: String, CodingKey {
    case productID = "productId"
    case restaurantID = "restaurantId"
    case productName
    case productDescription = "description"
    case price, ingredients, ratingTotal, reviews
  }
}

// MARK: - Review
struct Review: Codable {
  let name, date: String
  let ratingTaste, ratingHygiene, ratingService, ratingDelivery: Int
  let comments: String
}