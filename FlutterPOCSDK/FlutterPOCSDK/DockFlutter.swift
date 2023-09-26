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
        //GeneratedPluginRegistrant.register(with: self)
    }
    
    public func start(host: UIViewController, param: String) {
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        let channel = FlutterMethodChannel(name: "flutter.poc.sdk",
                                                  binaryMessenger: flutterViewController.binaryMessenger)
        channel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "getParams" else {
                result(FlutterMethodNotImplemented)
                return
            }
            
            result("Param sent by iOS client: hello world.")
        })

        host.show(flutterViewController, sender: nil)
    }
    
}
