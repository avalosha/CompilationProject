//
//  ContactBookViewController.swift
//  Compilation
//
//  Created by Sferea-Lider on 11/05/23.
//

import UIKit

extension ContactBookViewController {
    /// Retorna una nueva instancia de la clase ContactBookViewController
    /// - Returns: Instancia de ContactBookViewController
    static func newInstance() -> ContactBookViewController? {
        let storyboard = UIStoryboard(name: "contactBook", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContactBookVC") as? ContactBookViewController
        return vc
    }
}

class ContactBookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSendMessageForWhatsappBtn(_ sender: Any) {
        sendMessageForWhatsapp()
    }
    
    private func sendMessageForWhatsapp() {
        let message = "Test Message for Whatsapp"
        var queryCharSet = NSCharacterSet.urlQueryAllowed
        
        // if your text message contains special characters like **+ and &** then add this line
        queryCharSet.remove(charactersIn: "+&")
        
        if let escapedString = message.addingPercentEncoding(withAllowedCharacters: queryCharSet) {
            if let whatsappURL = URL(string: "whatsapp://send?text=\(escapedString)") {
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.open(whatsappURL, options: [: ], completionHandler: nil)
                } else {
                    debugPrint("please install WhatsApp")
                }
            }
        }
    }
}
