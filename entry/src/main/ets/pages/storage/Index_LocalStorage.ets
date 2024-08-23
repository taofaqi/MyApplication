//TODO     LocalStorage：页面级UI状态存储
//TODO     https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/arkts-localstorage-V5#%E5%BA%94%E7%94%A8%E9%80%BB%E8%BE%91%E4%BD%BF%E7%94%A8localstorage

class StorageUser {
  name?: string
  age?: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}

const storage = new LocalStorage(new StorageUser('Tom', 18))

@Component
@Entry(storage)
struct IndexLocalStorage {
  @LocalStorageProp('user')
  user: StorageUser = new StorageUser('Tom', 18)

  build() {
    Column() {
      Text(`${this.user.name} + ${this.user.age}`)
        .onClick(() => {
          this.user.age!++
        })

      ChildStorage()
    }
  }
}

@Component
struct ChildStorage {
  @LocalStorageProp('user')
  user: StorageUser = new StorageUser('Tom', 18)

  build() {
    Text(`${this.user.name} + ${this.user.age}`)
      .onClick(() => {
        this.user.age!++
      })
  }
}