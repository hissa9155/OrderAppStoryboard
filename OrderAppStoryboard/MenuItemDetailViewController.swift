//
//  MenuItemDetailViewController.swift
//  OrderAppStoryboard
//
//  Created by H.Namikawa on 2023/05/16.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var priceLabel: UILabel!
  @IBOutlet var detailTextLabel: UILabel!
  @IBOutlet var addToOrderButton: UIButton!
  
  let menuItem: MenuItem
  
  init?(coder: NSCoder, menuItem: MenuItem){
    self.menuItem = menuItem
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  private func updateUI(){
    nameLabel.text = menuItem.name
    priceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
    detailTextLabel.text = menuItem.detailText
    
    Task.init {
      if let image = try? await MenuController.shared.fetchImage(from: menuItem.imageURL) {
        imageView.image = image
      }
    }
  }
  
  
  @IBAction func orderButtonTapped(_ sender: UIButton) {
    
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, animations: {
      self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
      self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }, completion: nil)
    
    MenuController.shared.order.menuItems.append(menuItem)
  }
  
}
