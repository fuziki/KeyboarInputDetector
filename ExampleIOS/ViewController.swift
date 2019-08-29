//
//  ViewController.swift
//  ExampleIOS
//
//  Created by fuziki on 2019/08/28.
//  Copyright © 2019 fuziki.factory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("start")
        KeyboarInputDetectorViewController.keyCommandString = "wedcxzaq" + "ufhrytjn" + "lvog"

        
        
        let vc = KeyboarInputDetectorViewController()
        vc.view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        vc.view.backgroundColor = .clear
        vc.onKeyInput(handler: { [weak self] (input: String) in
            print(input)
        })
        self.view.addSubview(vc.view)
        
//        let vc = KeyboarInputDetectorViewController(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        self.view.addSubview(vc)
        

    }
}

class KeyboarInputDetectorViewController2: UIViewController {
    static var keyCommandString: String = ""
    private var onKeyInputHandler: ((String) -> Void)? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        _ = self.becomeFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var keyCommands: [UIKeyCommand]? {
        return KeyboarInputDetectorViewController.keyCommandString.map({ (c: Character) -> UIKeyCommand in
            return UIKeyCommand(input: String(c), modifierFlags: [], action: #selector(handlerKeyInput(command:)))
        })
    }
    
    @objc private func handlerKeyInput(command: UIKeyCommand) {
        if let str = command.input {
            onKeyInputHandler?(str)
        }
    }
    
    public func onKeyInput(handler: @escaping (String) -> Void) {
        onKeyInputHandler = handler
    }
}


