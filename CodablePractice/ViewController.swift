//
//  ViewController.swift
//  CodablePractice
//
//  Created by 이재은 on 08/02/2019.
//  Copyright © 2019 이재은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var contentsLabel: UILabel!
  
  var dustFeedbacks: [DustFeedback] = []
  let requestFeedback = RequestFeedback()
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    NotificationCenter.default.addObserver(self, selector: #selector(didReceiveFeedbackNotification(_:)), name: DidReceiveFeedbackNotification, object: nil)
        requestFeedback.requestDustFeedbacks()
        setLabel()
  }
  
  @objc func didReceiveFeedbackNotification(_ noti: Notification) {
    guard let dustFeedbacks = noti.userInfo?["feedbacks"] as? [DustFeedback]
      else { return }
    
    self.dustFeedbacks = dustFeedbacks
  }
  
  func setLabel() {
    titleLabel.text = dustFeedbacks[0].title
    authorLabel.text = dustFeedbacks[0].author
    dateLabel.text = dustFeedbacks[0].date
    contentsLabel.text = dustFeedbacks[0].contents
  }
}

