---@meta DisplayObject

---Solar2D DisplayObject base class
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/type/DisplayObject/
---@class DisplayObject
---@field x number X coordinate position
---@field y number Y coordinate position
---@field width number Width in content coordinates
---@field height number Height in content coordinates
---@field rotation number Rotation in degrees
---@field alpha number Opacity (0.0 to 1.0)
---@field isVisible boolean Visibility flag
---@field xScale number Horizontal scale factor
---@field yScale number Vertical scale factor
---@field anchorX number Horizontal anchor point (0.0 to 1.0)
---@field anchorY number Vertical anchor point (0.0 to 1.0)
---@field parent GroupObject|nil Parent group object
---@field contentWidth number Content width in pixels
---@field contentHeight number Content height in pixels
---@field contentBounds table Bounds in content coordinates
---@field name string Object identifier name
DisplayObject = {}

---Removes this object from the display hierarchy
---@return nil
function DisplayObject:removeSelf() end

---Rotates the object by the specified angle
---@param deltaAngle number Rotation angle in degrees
---@return nil
function DisplayObject:rotate(deltaAngle) end

---Scales the object
---@param sx number Horizontal scale factor
---@param sy number Vertical scale factor
---@return nil
function DisplayObject:scale(sx, sy) end

---Translates the object position
---@param deltaX number X offset
---@param deltaY number Y offset
---@return nil
function DisplayObject:translate(deltaX, deltaY) end

---Sets the fill color
---@param r number Red component (0.0 to 1.0)
---@param g number Green component (0.0 to 1.0)
---@param b number Blue component (0.0 to 1.0)
---@param a number? Alpha component (0.0 to 1.0)
---@return nil
function DisplayObject:setFillColor(r, g, b, a) end

---Sets the stroke (border) color
---@param r number Red component (0.0 to 1.0)
---@param g number Green component (0.0 to 1.0)
---@param b number Blue component (0.0 to 1.0)
---@param a number? Alpha component (0.0 to 1.0)
---@return nil
function DisplayObject:setStrokeColor(r, g, b, a) end

---Adds an event listener
---@param eventName string Event name (e.g., 'tap', 'touch')
---@param listener function Callback function
---@return nil
function DisplayObject:addEventListener(eventName, listener) end

---Removes an event listener
---@param eventName string Event name
---@param listener function Callback function to remove
---@return nil
function DisplayObject:removeEventListener(eventName, listener) end

---@class GroupObject : DisplayObject
---@field numChildren number Number of child objects
GroupObject = {}

---Inserts an object into the group
---@param object DisplayObject Object to insert
---@return nil
function GroupObject:insert(object) end

---Removes an object from the group
---@param indexOrObject number|DisplayObject Index or object to remove
---@return nil
function GroupObject:remove(indexOrObject) end

---@class TextObject : DisplayObject
---@field text string Text content
---@field size number Font size in pixels
---@field font any Font name or font object
TextObject = {}

---@class TextFieldObject : DisplayObject
---@field text string Text content
---@field size number Font size
---@field font any Font name or font object
---@field isSecure boolean Password field flag
TextFieldObject = {}

---@class TextBoxObject : DisplayObject
---@field text string Text content
---@field size number Font size
---@field font any Font name or font object
TextBoxObject = {}

---@class WebViewObject : DisplayObject
WebViewObject = {}
