//
//  CiteCellVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/17/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class CityCellVM: PCityCellVM {
    func getName() -> String { content.nameEn }
    func onSelect() {
        select(content)
    }
    var needToUpdateCallback: (() -> Void)?
    var cellIdentifire: String = CityCell.getCellIdentifier()
    var cellHeight: Float = 50.0
    var content: CityModel
    private var select: ((CityModel) -> Void)

    init(_ cellContent: CityModel, selectedModel: @escaping ((CityModel) -> Void)) {
        self.content = cellContent
        self.select = selectedModel
    }
}
