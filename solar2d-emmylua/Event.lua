---@meta Event

---Solar2D Event base class
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/type/Event/
---@class Event
---@field name string Event name
---@field target any Event target object
---@field phase string|nil Event phase
---@field time number Event timestamp
Event = {}

---@class TouchEvent : Event
---@field x number Touch X coordinate
---@field y number Touch Y coordinate
---@field xStart number Starting X coordinate
---@field yStart number Starting Y coordinate
---@field id any Touch ID for multitouch
TouchEvent = {}

---@class TapEvent : Event
---@field x number Tap X coordinate
---@field y number Tap Y coordinate
---@field numTaps number Number of taps
TapEvent = {}

---@class CollisionEvent : Event
---@field object1 DisplayObject First colliding object
---@field object2 DisplayObject Second colliding object
---@field contact table Contact point data
---@field force number Collision force
---@field friction number Collision friction
CollisionEvent = {}
