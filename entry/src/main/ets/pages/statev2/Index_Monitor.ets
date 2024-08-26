import { promptAction } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index_Monitor {
  @Local message: string = "Hello World";
  @Local name: string = "Tom";
  @Local age: number = 24;
  @Monitor("message", "name")
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      console.log(`${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`)

      promptAction.showToast({ message: `${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}` })
    })
  }
  build() {
    Column() {
      Button("change string")
        .onClick(() => {
          this.message += "!";
          this.name = "Jack";
        })
    }.margin({ top: 100, })
  }
}