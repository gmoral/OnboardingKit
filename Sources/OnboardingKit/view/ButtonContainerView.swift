//
//  File.swift
//  
//
//  Created by Guillermo Moral on 21/12/2022.
//

import UIKit
import SnapKit

class ButtonContainerView : UIView {
    
    var nextButtonDidTap: (() -> Void)?
    var getStartedButtonTap: (() -> Void)?
    
    private lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.layer.borderColor = viewTintColor.cgColor
        button.layer.borderWidth = 2
        button.setTitleColor(viewTintColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialBoundedMTBold", size: 16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var getStartedbutton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialBoundedMTBold", size: 16)
        button.layer.borderColor = viewTintColor.cgColor
        button.backgroundColor = viewTintColor
        button.layer.cornerRadius = 12
        button.layer.shadowColor = viewTintColor.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 8
        button.addTarget(self, action: #selector(getStartedButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nextButton, getStartedbutton])
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()
    
    private let viewTintColor : UIColor
    
    init(tintColor: UIColor) {
        self.viewTintColor = tintColor
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 24, left: 24, bottom: 36, right: 24))
            
        //make.leading.equalTo(snp.leading).offset(24)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(getStartedbutton.snp.width).multipliedBy(0.5)
        }
    }
    
    @objc private func nextButtonTapped() {
        nextButtonDidTap?()
    }
    
    @objc private func getStartedButton() {
        getStartedButtonTap?()
    }
}
