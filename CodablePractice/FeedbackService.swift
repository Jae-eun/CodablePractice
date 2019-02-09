//
//  FeedbackService.swift
//  CodablePractice
//
//  Created by 이재은 on 09/02/2019.
//  Copyright © 2019 이재은. All rights reserved.
//

import Foundation

final class FeedbackService: FeedbackServiceType {
  
  let jsonManager: JSONManagerType?
  
  init(jsonManager: JSONManagerType) {
    self.jsonManager = jsonManager
  }
  
  
}
