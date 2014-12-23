//
//  Wireframe.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

class Wireframe: NSObject {
    
    class func configureModules(view: View) {
        let bath = Bath()
        let interactor = Interactor()
        interactor.bath = bath
        let presenter = Presenter()
        presenter.interactor = interactor
        interactor.delegate = presenter
        view.presenter = presenter
        presenter.view = view
    }
    
}
