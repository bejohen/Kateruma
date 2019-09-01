import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var textNama: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textHP: UITextField!
    @IBOutlet weak var textNomorRekening: UITextField!
    @IBOutlet weak var textNamaPemilik: UITextField!
    @IBOutlet weak var textBank: UITextField!
    
    @IBOutlet weak var buttonKtp: UIButton!
    @IBOutlet weak var buttonFotoDiri: UIButton!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textNama.frame.size.height = 48
        self.textEmail.frame.size.height = 48
        self.textHP.frame.size.height = 48
        self.textNamaPemilik.frame.size.height = 48
        self.textNomorRekening.frame.size.height = 48
        
            self.textBank.frame.size.height = 48
        
        buttonStyle()
    }
    
    
    func buttonStyle (){
    buttonKtp.layer.cornerRadius = 5
    buttonKtp.backgroundColor = .clear
    buttonKtp.layer.borderWidth = 0.1
     
        
    buttonFotoDiri.layer.cornerRadius = 5
        buttonFotoDiri.backgroundColor = .clear
        buttonFotoDiri.layer.borderWidth = 0.1
        buttonSubmit.layer.cornerRadius = 5
        buttonSubmit.layer.borderWidth = 0.1
    }
  
  @IBAction func buttonBackTapped(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
}
