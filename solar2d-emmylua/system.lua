---@meta system

---Solar2D system API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/system/
---@class system
system = {}

---@see https://docs.coronalabs.com/api/library/system/ApplicationSupportDirectory.html
---@type number
system.ApplicationSupportDirectory = nil

---@see https://docs.coronalabs.com/api/library/system/CachesDirectory.html
---@type number
system.CachesDirectory = nil

---@see https://docs.coronalabs.com/api/library/system/DocumentsDirectory.html
---@type number
system.DocumentsDirectory = nil

---@see https://docs.coronalabs.com/api/library/system/ResourceDirectory.html
---@type number
system.ResourceDirectory = nil

---@see https://docs.coronalabs.com/api/library/system/TemporaryDirectory.html
---@type number
system.TemporaryDirectory = nil

---@see https://docs.coronalabs.com/api/library/system/activate.html
---@type any
system.activate = nil

---@see https://docs.coronalabs.com/api/library/system/api.html
---@type any
system.api = nil

---@see https://docs.coronalabs.com/api/library/system/canOpenURL.html
---@return any
function system.canOpenURL() end

---@see https://docs.coronalabs.com/api/library/system/cancelNotification.html
---@return any
function system.cancelNotification() end

---@see https://docs.coronalabs.com/api/library/system/deactivate.html
---@type any
system.deactivate = nil

---@see https://docs.coronalabs.com/api/library/system/deletePreferences.html
---@type any
system.deletePreferences = nil

---Gets the idletimer value
---@see https://docs.coronalabs.com/api/library/system/getIdleTimer.html
---@return any
function system.getIdleTimer() end

---Gets system information (platform, model, etc.)
---@see https://docs.coronalabs.com/api/library/system/getInfo.html
---@param param string
---@return any
function system.getInfo(param) end

---Gets the inputdevices value
---@see https://docs.coronalabs.com/api/library/system/getInputDevices.html
---@return any
function system.getInputDevices() end

---Gets the preference value
---@see https://docs.coronalabs.com/api/library/system/getPreference.html
---@return any
function system.getPreference() end

---Gets milliseconds since app start
---@see https://docs.coronalabs.com/api/library/system/getTimer.html
---@return number
function system.getTimer() end

---@see https://docs.coronalabs.com/api/library/system/hasEventSource.html
---@type boolean
system.hasEventSource = nil

---Creates a new eventdispatcher object
---@see https://docs.coronalabs.com/api/library/system/newEventDispatcher.html
---@return any
function system.newEventDispatcher() end

---Opens a URL in the default browser or app
---@see https://docs.coronalabs.com/api/library/system/openURL.html
---@param url string URL string
---@return boolean
function system.openURL(url) end

---@see https://docs.coronalabs.com/api/library/system/orientation.html
---@type any
system.orientation = nil

---@see https://docs.coronalabs.com/api/library/system/pathForFile.html
---@type string
system.pathForFile = nil

---@see https://docs.coronalabs.com/api/library/system/scheduleNotification.html
---@type any
system.scheduleNotification = nil

---Sets the accelerometerinterval value
---@see https://docs.coronalabs.com/api/library/system/setAccelerometerInterval.html
---@return any
function system.setAccelerometerInterval() end

---Sets the gyroscopeinterval value
---@see https://docs.coronalabs.com/api/library/system/setGyroscopeInterval.html
---@return any
function system.setGyroscopeInterval() end

---Enables or disables the idle timer
---@see https://docs.coronalabs.com/api/library/system/setIdleTimer.html
---@param enabled boolean
---@return nil
function system.setIdleTimer(enabled) end

---Sets the locationaccuracy value
---@see https://docs.coronalabs.com/api/library/system/setLocationAccuracy.html
---@return any
function system.setLocationAccuracy() end

---Sets the locationthreshold value
---@see https://docs.coronalabs.com/api/library/system/setLocationThreshold.html
---@return any
function system.setLocationThreshold() end

---Sets the preferences value
---@see https://docs.coronalabs.com/api/library/system/setPreferences.html
---@return any
function system.setPreferences() end

---Sets the tapdelay value
---@see https://docs.coronalabs.com/api/library/system/setTapDelay.html
---@return any
function system.setTapDelay() end

---Vibrates the device
---@see https://docs.coronalabs.com/api/library/system/vibrate.html
---@return nil
function system.vibrate() end
