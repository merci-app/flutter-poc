//
//  DockFlutter.swift
//  FlutterPOCSDK
//
//  Created by Rodrigo Brauwers on 26/09/23.
//

import Foundation
import Flutter

public class DockFlutter {
    
    public static let shared = DockFlutter()
    
    lazy var flutterEngine = FlutterEngine(name: "DockFlutter")
    
    public func setup() {
        flutterEngine.run()
    }
    
    public func start(host: UIViewController, param: String) {
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        host.show(flutterViewController, sender: nil)
    }
    
}
