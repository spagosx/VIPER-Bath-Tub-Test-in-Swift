//
//  Presenter.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import Foundation

class Presenter: NSObject {
    weak var view: View!
    var interactor: Interactor
    
    init(interactor: Interactor) {
        self.interactor = interactor
        super.init()
    }
}

extension Presenter: InteractorDelegate {
    
}