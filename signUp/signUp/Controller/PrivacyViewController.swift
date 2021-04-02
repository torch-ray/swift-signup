import UIKit

class PrivacyViewController: UIViewController {
    
    private var privacyViewTitle: MainTitleLabel!
    private var privacyStackView = PrivacyStackView()
    private let validateManager = RegexValidManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMainView()
    }
    
    private func setUpMainView() {
        view.backgroundColor = UIColor.systemGray6
        configureTitle()
        configureMainStackView()
        setUpLabelAndTextField()
        setUpSegmentControl()
    }
}

//MARK: -configuration && Setup
extension PrivacyViewController {
    
    private func configureTitle() {
        privacyViewTitle = MainTitleLabel(frame: CGRect(x: 125, y: 60, width: 150, height: 40))
        privacyViewTitle.text = MainTitleContents.privacy
        view.addSubview(privacyViewTitle)
    }
    private func configureMainStackView() {
        privacyStackView.frame = CGRect(x: 40, y: 120, width: 300, height: 400)
        view.addSubview(privacyStackView)
    }
    
    private func setUpLabelAndTextField() {
        privacyStackView.birthdayInfo.infoLabel.text = PrivacyLabelContents.birthday
        privacyStackView.emailInfo.infoLabel.text = PrivacyLabelContents.email
        privacyStackView.cellPhoneInfo.infoLabel.text = PrivacyLabelContents.cellPhone
        privacyStackView.cellPhoneInfo.inputTextField.placeholder = PrivacyLabelContents.cellPhonePlaceholder
    }
    
    private func setUpSegmentControl() {
        privacyStackView.genderInfo.infoLabel.text = PrivacyLabelContents.gender
        privacyStackView.genderInfo.segmentControlInfo.addTarget(self, action: #selector(selectGenderInfo), for: .valueChanged)
    }
}

//MARK: -@objc Action
extension PrivacyViewController {
    
    @objc func selectGenderInfo() {
        //성별정보 저장구현 예정
    }
}

//MARK: -Regex

extension PrivacyViewController {
    
    private func isValidStateForEmail()  -> Bool {
        let email = privacyStackView.emailInfo
        if !validateManager.isValidStateForEmail(email.inputTextField.text) {
            privacyStackView.invalidTextFieldBoarder(textField: email.inputTextField)
            privacyStackView.inValidEmailFor(checkLabel: email.checkLabel)
            return false
        } else {
            privacyStackView.validTextFieldBoarder(textField: email.inputTextField)
            privacyStackView.validEmailFor(checkLabel: email.checkLabel)
            return true
        }
    }
}
