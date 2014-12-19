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
        let interactor = Interactor()
        let presenter = Presenter(interactor: interactor)
        interactor.delegate = presenter
        view.presenter = presenter
        presenter.view = view
    }
    
}
