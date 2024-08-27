import http from '@ohos.net.http'

const req = http.createHttp()

req.request('https://taofaqi.github.io/testHtml/takeaway.json')
  .then(res => {
    console.log('MEITUAN', res.result.toString().replace(/\n/g, '').substr(0, 250)) // === 3  注意：字符长度大于1024字节，控制台不可见。
    const data: ESObject = JSON.parse(res.result as string)
    console.log('MEITUAN', data.length)
  })
  .catch(() => {
    console.error('MEITUAN', "error")
  })

@Entry
@Component
struct Http_demo_page {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('Http_demo_pageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }

}