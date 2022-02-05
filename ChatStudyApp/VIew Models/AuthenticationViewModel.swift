//
//  AuthenticationViewModel.swift
//  ChatStudyApp
//
//  Created by IwasakIYuta on 2022/02/05.
//

import RxSwift
import RxCocoa

class AuthenticationViewModel {

    private let disposeBag = DisposeBag()

    // MARK: observable//監視可能 PublishSubjectはアウトプットもインプットも両方行ける認識
    var nameTextOutput = PublishSubject<String>()
    var emailTextOutput = PublishSubject<String>()
    var passwordTextOutput = PublishSubject<String>()
    
    var validRegisterSubject = BehaviorSubject<Bool>(value: false)
    var validLoginSubject = BehaviorSubject<Bool>(value: false)


    // MARK: observer
    var nameTextInput: Observable<String> {
        nameTextOutput.asObservable()
    }

    var emailTextInput: Observable<String> {
        emailTextOutput.asObservable()
    }

    var passwordTextInput: Observable<String> {
        passwordTextOutput.asObservable()
    }
    
    var validRegisterDriver: Driver<Bool> = Driver.never()
    var validLoginDriver: Driver<Bool> = Driver.never()


    init() {
        
        validRegisterDriver = validRegisterSubject
                    .asDriver(onErrorDriveWith: Driver.empty())
    
        validLoginDriver = validLoginSubject
                    .asDriver(onErrorDriveWith: Driver.empty())

        let nameVaild = nameTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 1 && !text.isEmpty
            }
     

        let emailVaild = emailTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }
        

        let passwordVaild = passwordTextOutput
            .asObservable()
            .map { text -> Bool in
                return text.count >= 5
            }
        //最新の発行どうしが結合　引数の最新の状態だけを取得する
        Observable.combineLatest(nameVaild, emailVaild, passwordVaild) { $0 && $1 && $2 }.subscribe { vaildAll in
            self.validRegisterSubject.onNext(vaildAll)
        }.disposed(by: disposeBag)
        
        Observable.combineLatest(emailVaild, passwordVaild) { $0 && $1 }.subscribe { vaildAll in
            self.validLoginSubject.onNext(vaildAll)
        }.disposed(by: disposeBag)
    }

}

