---@meta native

---Solar2D native API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/native/
---@class native
native = {}

---@see https://docs.coronalabs.com/api/library/native/api.html
---@type any
native.api = nil

---@see https://docs.coronalabs.com/api/library/native/canShowPopup.html
---@return any
function native.canShowPopup() end

---Cancels a displayed alert dialog
---@see https://docs.coronalabs.com/api/library/native/cancelAlert.html
---@param alertId any
---@return nil
function native.cancelAlert(alertId) end

---@see https://docs.coronalabs.com/api/library/native/cancelWebPopup.html
---@return any
function native.cancelWebPopup() end

---Gets the fontnames value
---@see https://docs.coronalabs.com/api/library/native/getFontNames.html
---@return any
function native.getFontNames() end

---Gets the property value
---@see https://docs.coronalabs.com/api/library/native/getProperty.html
---@return any
function native.getProperty() end

---Gets the sync value
---@see https://docs.coronalabs.com/api/library/native/getSync.html
---@return any
function native.getSync() end

---Creates a new font object
---@see https://docs.coronalabs.com/api/library/native/newFont.html
---@return any
function native.newFont() end

---Creates a new mapview object
---@see https://docs.coronalabs.com/api/library/native/newMapView.html
---@return any
function native.newMapView() end

---Creates a native multi-line text box
---@see https://docs.coronalabs.com/api/library/native/newTextBox.html
---@param x number X coordinate position
---@param y number Y coordinate position
---@param width number Width in pixels
---@param height number Height in pixels
---@return TextBoxObject
function native.newTextBox(x, y, width, height) end

---Creates a native text input field
---@see https://docs.coronalabs.com/api/library/native/newTextField.html
---@param x number X coordinate position
---@param y number Y coordinate position
---@param width number Width in pixels
---@param height number Height in pixels
---@return TextFieldObject
function native.newTextField(x, y, width, height) end

---Creates a new video object
---@see https://docs.coronalabs.com/api/library/native/newVideo.html
---@return any
function native.newVideo() end

---Creates a native web view
---@see https://docs.coronalabs.com/api/library/native/newWebView.html
---@param x number X coordinate position
---@param y number Y coordinate position
---@param width number Width in pixels
---@param height number Height in pixels
---@return WebViewObject
function native.newWebView(x, y, width, height) end

---Requests the app to exit (Android only)
---@see https://docs.coronalabs.com/api/library/native/requestExit.html
---@return nil
function native.requestExit() end

---Sets the activityindicator value
---@see https://docs.coronalabs.com/api/library/native/setActivityIndicator.html
---@return any
function native.setActivityIndicator() end

---Sets the keyboardfocus value
---@see https://docs.coronalabs.com/api/library/native/setKeyboardFocus.html
---@return any
function native.setKeyboardFocus() end

---Sets the property value
---@see https://docs.coronalabs.com/api/library/native/setProperty.html
---@return any
function native.setProperty() end

---Sets the sync value
---@see https://docs.coronalabs.com/api/library/native/setSync.html
---@return any
function native.setSync() end

---Displays a native alert dialog
---@see https://docs.coronalabs.com/api/library/native/showAlert.html
---@param title string Alert title text
---@param message string Alert message text
---@param buttons table Array of button labels
---@param listener? function Callback function
---@return any
function native.showAlert(title, message, buttons, listener) end

---Shows the popup
---@see https://docs.coronalabs.com/api/library/native/showPopup.html
---@return any
function native.showPopup() end

---Shows the webpopup
---@see https://docs.coronalabs.com/api/library/native/showWebPopup.html
---@return any
function native.showWebPopup() end

---@see https://docs.coronalabs.com/api/library/native/systemFont.html
---@type number
native.systemFont = nil

---@see https://docs.coronalabs.com/api/library/native/systemFontBold.html
---@type number
native.systemFontBold = nil
