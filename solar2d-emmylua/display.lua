---@meta display

---Solar2D display API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/display/
---@class display
display = {}

---@see https://docs.coronalabs.com/api/library/display/actualContentHeight.html
---@type number
display.actualContentHeight = nil

---@see https://docs.coronalabs.com/api/library/display/actualContentWidth.html
---@type number
display.actualContentWidth = nil

---@see https://docs.coronalabs.com/api/library/display/api.html
---@type any
display.api = nil

---Captures a portion of the screen as a display object
---@see https://docs.coronalabs.com/api/library/display/capture.html
---@param displayObject DisplayObject
---@param options? table Table of options
---@return DisplayObject
function display.capture(displayObject, options) end

---@see https://docs.coronalabs.com/api/library/display/captureBounds.html
---@return any
function display.captureBounds() end

---@see https://docs.coronalabs.com/api/library/display/captureScreen.html
---@return any
function display.captureScreen() end

---@see https://docs.coronalabs.com/api/library/display/colorSample.html
---@type any
display.colorSample = nil

---@see https://docs.coronalabs.com/api/library/display/contentCenterX.html
---@type number
display.contentCenterX = nil

---@see https://docs.coronalabs.com/api/library/display/contentCenterY.html
---@type number
display.contentCenterY = nil

---@see https://docs.coronalabs.com/api/library/display/contentHeight.html
---@type number
display.contentHeight = nil

---@see https://docs.coronalabs.com/api/library/display/contentScaleX.html
---@type number
display.contentScaleX = nil

---@see https://docs.coronalabs.com/api/library/display/contentScaleY.html
---@type number
display.contentScaleY = nil

---@see https://docs.coronalabs.com/api/library/display/contentWidth.html
---@type number
display.contentWidth = nil

---@see https://docs.coronalabs.com/api/library/display/currentStage.html
---@type any
display.currentStage = nil

---@see https://docs.coronalabs.com/api/library/display/fps.html
---@type any
display.fps = nil

---Gets the currentstage value
---@see https://docs.coronalabs.com/api/library/display/getCurrentStage.html
---@return any
function display.getCurrentStage() end

---Gets the default value
---@see https://docs.coronalabs.com/api/library/display/getDefault.html
---@return any
function display.getDefault() end

---Gets the safeareainsets value
---@see https://docs.coronalabs.com/api/library/display/getSafeAreaInsets.html
---@return any
function display.getSafeAreaInsets() end

---@see https://docs.coronalabs.com/api/library/display/imageSuffix.html
---@type number
display.imageSuffix = nil

---Loads a remoteimage
---@see https://docs.coronalabs.com/api/library/display/loadRemoteImage.html
---@return any
function display.loadRemoteImage() end

---Creates a new Circle display object
---@see https://docs.coronalabs.com/api/library/display/newCircle.html
---@param x number X coordinate position
---@param y number Y coordinate position
---@param radius number Radius in pixels
---@return DisplayObject
function display.newCircle(x, y, radius) end

---Creates a new Container display object
---@see https://docs.coronalabs.com/api/library/display/newContainer.html
---@return any
function display.newContainer() end

---Creates a new EmbossedText display object
---@see https://docs.coronalabs.com/api/library/display/newEmbossedText.html
---@return any
function display.newEmbossedText() end

---Creates a new Emitter display object
---@see https://docs.coronalabs.com/api/library/display/newEmitter.html
---@return any
function display.newEmitter() end

---Creates a new Group display object
---@see https://docs.coronalabs.com/api/library/display/newGroup.html
---@return GroupObject
function display.newGroup() end

---Creates a new Image display object
---@see https://docs.coronalabs.com/api/library/display/newImage.html
---@param filename string Path to the file
---@param x? number X coordinate position
---@param y? number Y coordinate position
---@return DisplayObject
function display.newImage(filename, x, y) end

---Creates a new ImageRect display object
---@see https://docs.coronalabs.com/api/library/display/newImageRect.html
---@param filename string Path to the file
---@param width number Width in pixels
---@param height number Height in pixels
---@return DisplayObject
function display.newImageRect(filename, width, height) end

---Creates a new Line display object
---@see https://docs.coronalabs.com/api/library/display/newLine.html
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return DisplayObject
function display.newLine(x1, y1, x2, y2) end

---Creates a new Mesh display object
---@see https://docs.coronalabs.com/api/library/display/newMesh.html
---@return any
function display.newMesh() end

---Creates a new Polygon display object
---@see https://docs.coronalabs.com/api/library/display/newPolygon.html
---@param x number X coordinate position
---@param y number Y coordinate position
---@param vertices table
---@return DisplayObject
function display.newPolygon(x, y, vertices) end

---Creates a new Rect display object
---@see https://docs.coronalabs.com/api/library/display/newRect.html
---@param x number X coordinate position
---@param y number Y coordinate position
---@param width number Width in pixels
---@param height number Height in pixels
---@return DisplayObject
function display.newRect(x, y, width, height) end

---Creates a new RoundedRect display object
---@see https://docs.coronalabs.com/api/library/display/newRoundedRect.html
---@return any
function display.newRoundedRect() end

---Creates a new Snapshot display object
---@see https://docs.coronalabs.com/api/library/display/newSnapshot.html
---@return any
function display.newSnapshot() end

---Creates a new Sprite display object
---@see https://docs.coronalabs.com/api/library/display/newSprite.html
---@return any
function display.newSprite() end

---Creates a new Text display object
---@see https://docs.coronalabs.com/api/library/display/newText.html
---@param text string Text content
---@param x number X coordinate position
---@param y number Y coordinate position
---@param font? any Font name or font object
---@param fontSize? number Font size in pixels
---@return TextObject
function display.newText(text, x, y, font, fontSize) end

---@see https://docs.coronalabs.com/api/library/display/pixelHeight.html
---@type number
display.pixelHeight = nil

---@see https://docs.coronalabs.com/api/library/display/pixelWidth.html
---@type number
display.pixelWidth = nil

---Removes a display object from the display hierarchy
---@see https://docs.coronalabs.com/api/library/display/remove.html
---@param object DisplayObject Display object
---@return nil
function display.remove(object) end

---@see https://docs.coronalabs.com/api/library/display/safeActualContentHeight.html
---@type number
display.safeActualContentHeight = nil

---@see https://docs.coronalabs.com/api/library/display/safeActualContentWidth.html
---@type number
display.safeActualContentWidth = nil

---@see https://docs.coronalabs.com/api/library/display/safeScreenOriginX.html
---@type number
display.safeScreenOriginX = nil

---@see https://docs.coronalabs.com/api/library/display/safeScreenOriginY.html
---@type number
display.safeScreenOriginY = nil

---@see https://docs.coronalabs.com/api/library/display/save.html
---@type any
display.save = nil

---@see https://docs.coronalabs.com/api/library/display/screenOriginX.html
---@type number
display.screenOriginX = nil

---@see https://docs.coronalabs.com/api/library/display/screenOriginY.html
---@type number
display.screenOriginY = nil

---Sets the default value
---@see https://docs.coronalabs.com/api/library/display/setDefault.html
---@return any
function display.setDefault() end

---Sets the drawmode value
---@see https://docs.coronalabs.com/api/library/display/setDrawMode.html
---@return any
function display.setDrawMode() end

---Sets the statusbar value
---@see https://docs.coronalabs.com/api/library/display/setStatusBar.html
---@return any
function display.setStatusBar() end

---@see https://docs.coronalabs.com/api/library/display/statusBarHeight.html
---@type number
display.statusBarHeight = nil

---@see https://docs.coronalabs.com/api/library/display/topStatusBarContentHeight.html
---@type number
display.topStatusBarContentHeight = nil

---@see https://docs.coronalabs.com/api/library/display/viewableContentHeight.html
---@type number
display.viewableContentHeight = nil

---@see https://docs.coronalabs.com/api/library/display/viewableContentWidth.html
---@type number
display.viewableContentWidth = nil
