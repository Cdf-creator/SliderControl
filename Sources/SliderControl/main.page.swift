import ScadeKit

class Pic: EObject {
  let url: String
  init(_ filename: String) {

    self.url = "./Assets/\(filename)"
  }
}

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    self.slider1.elementProvider = SCDWidgetsElementProvider { (item: Pic, template) in
      guard let image = template.getWidgetByName("image1") as? SCDWidgetsImage else { return }
      image.url = item.url
      image.contentPriority = false
    }
    // items are contained in the mode of the slider, the data is displayed.
    self.slider1.items = [Pic("1.jpeg"), Pic("2.jpeg"), Pic("3.jpeg"), Pic("4.jpeg")]

    // use the onSlide handler to handle slide event.
    self.slider1.onSlide.append(SCDWidgetsSlideEventHandler { e in print(e!.from, e!.to) })

  }

  override func show(view: SCDLatticeView?) {
    super.show(view: view)

    //selected only works in the show function
    self.slider1.selected = 2
  }

}
