//
//  JSONManager.swift
//  CodablePractice
//
//  Created by 이재은 on 09/02/2019.
//  Copyright © 2019 이재은. All rights reserved.
//

import Foundation

let DidReceiveFeedbackNotification = Notification.Name("DidReceiveFeedback")

final class JSONManager: JSONManagerType {
  
  var dustFeedbacks = [DustFeedback]()
  
  /// DustFeedbacks json 파싱하여 데이터를 가져옴.
  func requestDustFeedbacks() -> [DustFeedback] {
    guard let path = Bundle.main.path(forResource: "DustFeedback", ofType: "json") else { return [] }
    let jsonDecoder: JSONDecoder = JSONDecoder()
    do {
      guard let data = try String(contentsOfFile: path).data(using: .utf8) else { return [] }
      dustFeedbacks = try jsonDecoder.decode([DustFeedback].self, from: data)
      
      //      print(dustFeedbacks)
      
    } catch {
      print("error: \(error)")
    }
    return dustFeedbacks
  }
}
