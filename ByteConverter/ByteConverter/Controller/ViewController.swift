//
//  ViewController.swift
//  ByteConverter
//
//  Created by Marlon Junior🦈⚓️ on 14/11/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, coinManagerDelegate {

    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(row)
    }
    
    func didUpDateByteCoin(_ CoinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitCoinLabel.text = coin.rateString
            self.quoteLabel.text = coin.coinQuote
            
        }
    }
    
    func didFailError(_ error: Error) {
        print(error)
    }
    
}

