//
//  ProgressStepView.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/17/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class StepView: UIView {

    lazy var circleView = { () -> UIView in
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 28.0).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28.0).isActive = true
        view.layer.cornerRadius = 14.0
        view.layer.masksToBounds = true
        view.addSubview(imageView)
        view.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -7.0).isActive = true
        view.leftAnchor.constraint(equalTo: imageView.leftAnchor, constant: -7.0).isActive = true
        view.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: 7.0).isActive = true
        view.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 7.0).isActive = true
        return view
    }()
    
    var imageView = { () -> UIImageView in
        let view = UIImageView()
        view.image = UIImage(named: "dot")
        view.tintColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let textLabel = { () -> UILabel in
        let label = UILabel()
        label.textColor = UIColor.black
//        label.font = UIFont.customFont(.medium, ofSize: 15)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    private func configure() {
        let stack = UIStackView(arrangedSubviews: [circleView, textLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 4.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        topAnchor.constraint(equalTo: stack.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: stack.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: stack.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: stack.bottomAnchor).isActive = true
    }
    
}

class ProgressStepsView: UIView {
    
    func configure(with stepNames: [String], activeIndex: Int) {
        var stepViews = [StepView]()
        for (index, name) in stepNames.enumerated() {
            let stepView = StepView()
            if index == activeIndex {
                stepView.circleView.backgroundColor = UIColor(named: "MainBlue")!.withAlphaComponent(0.2)

            }
            if index > activeIndex {
                stepView.textLabel.textColor = UIColor(named: "Grey")
            }
            stepView.imageView.image = { () -> UIImage in
                if index > activeIndex {
                    return UIImage(named: "greyOval")!
                }
                return UIImage(named: "dot")!
            }()
            stepView.textLabel.text = name
            stepViews.append(stepView)
        }
        let stackView = UIStackView(arrangedSubviews: stepViews)
        stackView.distribution = .fillEqually
        stepViews.first?.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, constant: -16.0).isActive = true
        for index in 0..<(stepViews.count - 1) {
            let fst = stepViews[index]
            let snd = stepViews[index + 1]
            let lineView = { () -> UIView in
                let view = UIView()
                view.backgroundColor = UIColor(named: "Grey")
                view.translatesAutoresizingMaskIntoConstraints = false
                view.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
                return view
            }()
            addSubview(lineView)
            fst.circleView.rightAnchor.constraint(equalTo: lineView.leftAnchor, constant: -4.0).isActive = true
            lineView.rightAnchor.constraint(equalTo: snd.circleView.leftAnchor, constant: -4.0).isActive = true
            fst.circleView.centerYAnchor.constraint(equalTo: lineView.centerYAnchor).isActive = true
            snd.circleView.centerYAnchor.constraint(equalTo: lineView.centerYAnchor).isActive = true
        }
    }
    
}
