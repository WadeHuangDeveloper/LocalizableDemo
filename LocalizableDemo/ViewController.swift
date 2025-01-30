//
//  ViewController.swift
//  LocalizableDemo
//
//  Created by Huei-Der Huang on 2025/1/30.
//

import UIKit

class ViewController: UIViewController {
    private var helloLabel = UILabel()
    private var welcomeLabel = UILabel()
    private var locationButton = UIButton(type: .system)
    private var bluetoothButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initUI()
    }

    private func initUI() {
        helloLabel.text = NSLocalizedString("Hello", comment: "")
        helloLabel.font = .systemFont(ofSize: 60, weight: .bold)
        helloLabel.textAlignment = .center
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.text = NSLocalizedString("Welcome", comment: "")
        welcomeLabel.font = .systemFont(ofSize: 32, weight: .regular)
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationButton.addTarget(self, action: #selector(onLocationButtonClick), for: .touchUpInside)
        locationButton.setTitle(NSLocalizedString("Request_Location", comment: ""), for: .normal)
        locationButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        
        bluetoothButton.addTarget(self, action: #selector(onBluetoothButtonClick), for: .touchUpInside)
        bluetoothButton.setTitle(NSLocalizedString("Request_Bluetooth", comment: ""), for: .normal)
        bluetoothButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        bluetoothButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(helloLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(locationButton)
        view.addSubview(bluetoothButton)
        
        NSLayoutConstraint.activate([
            helloLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            helloLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            welcomeLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 20),
            
            locationButton.widthAnchor.constraint(equalToConstant: 200),
            locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 80),
            
            bluetoothButton.widthAnchor.constraint(equalToConstant: 200),
            bluetoothButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bluetoothButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 20),
        ])
    }
    
    @objc private func onLocationButtonClick() {
        LocationManager.shared.requestPermission()
    }
    
    @objc private func onBluetoothButtonClick() {
        BluetoothManager.shared.requestPermission()
    }
}

