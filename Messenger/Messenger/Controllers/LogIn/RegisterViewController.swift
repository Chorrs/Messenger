//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Chorrs on 23.01.24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill.questionmark.rtl")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private  let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First Name..."
        /* Здесь создается новый экземпляр UIView с заданными размерами (ширина 5, высота 0) и устанавливается в качестве представления слева (leftView) для текстового поля (field). leftView — это представление, которое отображается слева внутри текстового поля. В данном случае, создается пустая "инвидуальная" область слева от текстового поля шириной в 5 единиц, которая может использоваться, например, для добавления отступа.
         */
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private  let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Last Name..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private  let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private  let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        /* Здесь создается новый экземпляр UIView с заданными размерами (ширина 5, высота 0) и устанавливается в качестве представления слева (leftView) для текстового поля (field). leftView — это представление, которое отображается слева внутри текстового поля. В данном случае, создается пустая "инвидуальная" область слева от текстового поля шириной в 5 единиц, которая может использоваться, например, для добавления отступа.
         */
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    
     private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
         button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"
        view.backgroundColor = .white
        
        let regButton = UIBarButtonItem(
            title: "Register",
            style: .done,
            target: self,
            action: #selector(didTapRegister)
        )
        regButton.tintColor = #colorLiteral(red: 0, green: 0.637983311, blue: 1, alpha: 1)
        
        navigationItem.rightBarButtonItem = regButton
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            title: "Register",
//            style: .done,
//            target: self,
//            action: #selector(didTapRegister)
//      )
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
    // MARK: Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        let gesture = UIGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        
        imageView.addGestureRecognizer(gesture)
    }
    
    @objc func didTapChangeProfilePic() {
        
    }
    /*
     Функция viewDidLayoutSubviews в UIViewController вызывается после того, как иерархия представлений (view hierarchy) была обновлена. Это происходит, например, когда изменяется размер экрана или при первом появлении контроллера на экране. Именно в этот момент вы можете уверенно настраивать расположение и размеры элементов на экране.
     */
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        // Создается переменная size, которая равна трети ширины scrollView (view.frame.size.width). Это значение используется для определения размеров imageView.
        let size = scrollView.width/3
       // Устанавливается новый CGRect для imageView. В этом контексте, CGRect определяет прямоугольную область, в которой будет располагаться imageView.
        /*
         x: (view.frame.size.width - size)/2:

         Это устанавливает координату x для верхнего левого угла imageView. (view.frame.size.width - size)/2 означает, что imageView будет центрирован по горизонтали на экране.
         y: 20:

         Это устанавливает координату y для верхнего левого угла imageView. В данном случае, 20 - это вертикальное смещение от верхнего края экрана.
         width: size:

         Это устанавливает ширину imageView равной size.
         height: size:

         Это устанавливает высоту imageView равной size.
         */
        
        /*
         Выражение (scrollView.width - size)/2 представляет собой расчет координаты x (горизонтальной координаты верхнего левого угла) так, чтобы центр элемента оказался посередине scrollView.         scrollView.width:

         Это ширина scrollView.
         size:

         Это значение, равное трети ширины scrollView (согласно предыдущему коду).
         (scrollView.width - size):

         Это разность между шириной scrollView и size. Это значение представляет собой доступное пространство по горизонтали с обеих сторон от элемента.
         (scrollView.width - size)/2:

         Это деление на 2, что означает, что мы берем половину доступного пространства с обеих сторон от элемента. Таким образом, мы получаем смещение от левого края scrollView, чтобы центрировать элемент.
         */
        imageView.frame = CGRect(
            x: (scrollView.width - size)/2,
            y: 20,
            width: size,
            height: size
        )
        firstNameField.frame = CGRect(
            x: 30,
            y: imageView.bottom+10,
            width: scrollView.width-60,
            height: 52
        )
        lastNameField.frame = CGRect(
            x: 30,
            y: firstNameField.bottom+10,
            width: scrollView.width-60,
            height: 52
        )
        emailField.frame = CGRect(
            x: 30,
            y: lastNameField.bottom+10,
            width: scrollView.width-60,
            height: 52
        )
        passwordField.frame = CGRect(
            x: 30,
            y: emailField.bottom+10,
            width: scrollView.width-60,
            height: 52
        )
        registerButton.frame = CGRect(
            x: 30,
            y: passwordField.bottom+10,
            width: scrollView.width-60,
            height: 52
        )
        
    }
    
    @objc private func registerButtonPressed() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              password.count >= 6 else {
            alertUserLoginError()
            return
        }
        // MARK: Fierbase login
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Woops", message: "Please enter all information to create a new account.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @objc private func didTapRegister() {
        let registerVC = RegisterViewController()
        registerVC.title = "Create Account"
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            registerButtonPressed()
        }
   return true
    }
}
