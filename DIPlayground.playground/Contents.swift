import UIKit

var greeting = "Hello, playground"

protocol UserService { }
protocol CatsService { }
protocol DogsService { }
protocol VeterenarService { }
protocol ShareSocialService { }
protocol OrderFoodService { }
protocol KeychainStorage { }
protocol Storage { }
// impls

class UserServiceImpl: UserService { }
class CatsServiceImpl: CatsService { }
class DogsServiceImpl: DogsService { }
class VeterenarServiceImpl: VeterenarService { }
class ShareSocialServiceImpl: ShareSocialService { }
class OrderFoodServiceImpl: OrderFoodService { }
class KeychainStorageImpl: KeychainStorage { }
class StorageImpl: Storage { }

// stubs

class DogsServiceStubImpl: DogsService { }


class ServiceLocator {
    let userService: UserService
    let catsService: CatsService
    let dogsService: DogsService
    let veterenarService: VeterenarService
    let shareSocialService: ShareSocialService
    let orderFoodService: OrderFoodService
    let keychainStorage: KeychainStorage
    let storage: Storage

    static let shared = ServiceLocator()

    init() {
        userService = UserServiceImpl()
        catsService = CatsServiceImpl()
        veterenarService = VeterenarServiceImpl()
        shareSocialService = ShareSocialServiceImpl()
        orderFoodService = OrderFoodServiceImpl()
        keychainStorage = KeychainStorageImpl()
        storage = StorageImpl()

        let isTesting = { true }()

        if isTesting {
            dogsService = DogsServiceStubImpl()
        } else {
            dogsService = DogsServiceImpl()
        }

    }

}

class ViewControllerA {

    var catsService: CatsService = ServiceLocator.shared.catsService

    var dogsService: DogsService = ServiceLocator.shared.dogsService

    var keychainStorage: KeychainStorage = ServiceLocator.shared.keychainStorage

    init() {

    }

}


class ViewControllerB {

    var catsService: CatsService = ServiceLocator.shared.catsService

    var dogsService: DogsService = ServiceLocator.shared.dogsService

    var keychainStorage: KeychainStorage = ServiceLocator.shared.keychainStorage

    init() {

    }

}

class ViewControllerC {

    var catsService: CatsService = ServiceLocator.shared.catsService

    var dogsService: DogsService = ServiceLocator.shared.dogsService

    var keychainStorage: KeychainStorage = ServiceLocator.shared.keychainStorage

    init() {

    }

}
