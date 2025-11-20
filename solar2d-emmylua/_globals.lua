---@meta _globals

---Solar2D Global Variables
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/

---Display library for creating and manipulating display objects
---@type display
display = {}

---Audio library for playing sounds and music
---@type audio
audio = {}

---Timer library for delayed/repeated execution
---@type timer
timer = {}

---Transition library for animating display objects
---@type transition
transition = {}

---Physics library for Box2D physics simulation
---@type physics
physics = {}

---System library for system information and functions
---@type system
system = {}

---Network library for HTTP requests and downloads
---@type network
network = {}

---Native library for native UI elements
---@type native
native = {}

---Composer library for scene management
---@type composer
composer = {}

---Runtime object for app-wide events
---@class Runtime
Runtime = {}

---Adds an event listener to the Runtime object
---@param eventName string Event name (e.g., enterFrame, system, tap)
---@param listener function Callback function to handle the event
---@return nil
function Runtime:addEventListener(eventName, listener) end

---Removes an event listener from the Runtime object
---@param eventName string Event name
---@param listener function Callback function to remove
---@return nil
function Runtime:removeEventListener(eventName, listener) end

---Dispatches an event to Runtime listeners
---@param event Event Event object to dispatch
---@return nil
function Runtime:dispatchEvent(event) end

---Graphics library
---@type graphics
graphics = {}

---Easing library for transition easing functions
---@type easing
easing = {}

---Widget library for UI widgets
---@type widget
widget = {}

---Crypto library for cryptographic operations
---@type crypto
crypto = {}

---JSON library
---@type json
json = {}

---SQLite library
---@type sqlite3
sqlite3 = {}

---Store library for in-app purchases
---@type store
store = {}

---GameNetwork library
---@type gameNetwork
gameNetwork = {}

---Ads library
---@type ads
ads = {}

---Facebook library
---@type facebook
facebook = {}

---Media library for camera and photo access
---@type media
media = {}
