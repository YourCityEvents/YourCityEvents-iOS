//
//  DetailEventVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 12/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class EventDetailsVC: ViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var peopleCountLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard var model = viewModel as? PEventDetailsVM else { return }
        model.callBackOnModel = { [weak self] event in
            DispatchQueue.main.async {
                self?.titleLabel.text = event.title
                self?.ownerLabel.text = event.owner?.fullName
                self?.dateLabel.text = event.date
                self?.locationLabel.text = event.detailLocation
                self?.priceLabel.text = String(event.price)
                self?.descriptionLabel.text = event.description
                self?.peopleCountLabel.text = String(event.visitors?.count ?? 0)
                if let url = event.imageUrl {
                    self?.eventImageView.downloaded(from: url, contentMode: .scaleAspectFill)
                }
            }
        }
        model.onLoad()
    }
}

