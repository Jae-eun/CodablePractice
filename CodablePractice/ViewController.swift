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
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    requestFeedbacks()
    setLabel()
  }

  var dustFeedback: DustFeedback?
  let path = Bundle.main.path(forResource: "DustFeedback", ofType: "json")
  
  func requestFeedbacks() {
    let jsonDecoder: JSONDecoder = JSONDecoder()
    if let path = path {
      do {
        guard let data = try String(contentsOfFile: path).data(using: .utf8) else { return }
        let dustFeedbacks = try jsonDecoder.decode([DustFeedback].self, from: data)
        titleLabel.text = dustFeedbacks[0].title
        authorLabel.text = dustFeedbacks[0].author
        dateLabel.text = dustFeedbacks[0].date
        contentsLabel.text = dustFeedbacks[0].contents
      } catch {
        print("error: \(error)")
      }
    }
  }
  
  func setLabel() {
//    titleLabel.text = dustFeedback[0].title
//    authorLabel.text = dustFeedback[0].author
//
  }
}

