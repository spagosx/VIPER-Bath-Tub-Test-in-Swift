//
//  Interactor.swift
//  BathTubTest
//
//  Created by Daniele Spagnolo on 18/12/14.
//  Copyright (c) 2014 spagosx. All rights reserved.
//

import UIKit

protocol InteractorDelegate : class {
    
}

class Interactor: NSObject {
    weak var delegate: InteractorDelegate? = nil
}
