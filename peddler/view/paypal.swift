//
//  paypal.swift
//  peddler
//
//  Created by Mac-Mini-2021 on 12/12/2021.
//

import UIKit
import Braintree

class paypal: UIViewController {
    
    var braintreeClient: BTAPIClient!

    override func viewDidLoad() {
        super.viewDidLoad()
// Do any additional setup after loading the view.
        braintreeClient = BTAPIClient(authorization: "sandbox_8h4t47ng_88hhhc/knwkbyzds")
        
    }
    
    
    
    @IBAction func clikedBtnpay(_ sender: Any) {
        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient)
        payPalDriver.viewControllerPresentingDelegate = self
        payPalDriver.appSwitchDelegate = self // Optional
        // Specify the transaction amount here. "2.32" is used in this example.
                let request = BTPayPalRequest(amount: "2.32")
                request.currencyCode = "USD" // Optional; see BTPayPalRequest.h for more options

                payPalDriver.requestOneTimePayment(request) { (tokenizedPayPalAccount, error) in
                    if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                        print("Got a nonce: \(tokenizedPayPalAccount.nonce)")

                        // Access additional information
                        let email = tokenizedPayPalAccount.email
                        let firstName = tokenizedPayPalAccount.firstName
                        let lastName = tokenizedPayPalAccount.lastName
                        let phone = tokenizedPayPalAccount.phone

                        // See BTPostalAddress.h for details
                        let billingAddress = tokenizedPayPalAccount.billingAddress
                        let shippingAddress = tokenizedPayPalAccount.shippingAddress
                    } else if let error = error {
                        // Handle error here...
                    } else {
                        // Buyer canceled payment approval
                    }
                }
        
    }
    
    

    }
extension UIViewController :BTViewControllerPresentingDelegate{
    public func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        
    }
    
    public func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
    
    }
    
    
}
extension UIViewController : BTAppSwitchDelegate{
    public func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
        
    }
    
    public func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
        
    }
    
    public func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
        
    }
    
    
}


