---@meta transition

---Solar2D transition API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/transition/
---@class transition
transition = {}

---@see https://docs.coronalabs.com/api/library/transition/api.html
---@type any
transition.api = nil

---@see https://docs.coronalabs.com/api/library/transition/blink.html
---@type any
transition.blink = nil

---Cancels a transition
---@see https://docs.coronalabs.com/api/library/transition/cancel.html
---@param transitionID? any
---@return nil
function transition.cancel(transitionID) end

---@see https://docs.coronalabs.com/api/library/transition/cancelAll.html
---@return any
function transition.cancelAll() end

---@see https://docs.coronalabs.com/api/library/transition/dissolve.html
---@type any
transition.dissolve = nil

---@see https://docs.coronalabs.com/api/library/transition/fadeIn.html
---@return any
function transition.fadeIn() end

---@see https://docs.coronalabs.com/api/library/transition/fadeOut.html
---@return any
function transition.fadeOut() end

---@see https://docs.coronalabs.com/api/library/transition/from.html
---@type any
transition.from = nil

---@see https://docs.coronalabs.com/api/library/transition/ignoreEmptyReference.html
---@type number
transition.ignoreEmptyReference = nil

---@see https://docs.coronalabs.com/api/library/transition/loop.html
---@type any
transition.loop = nil

---@see https://docs.coronalabs.com/api/library/transition/moveBy.html
---@type number
transition.moveBy = nil

---@see https://docs.coronalabs.com/api/library/transition/moveTo.html
---@type any
transition.moveTo = nil

---Pauses a transition
---@see https://docs.coronalabs.com/api/library/transition/pause.html
---@param transitionID? any
---@return nil
function transition.pause(transitionID) end

---@see https://docs.coronalabs.com/api/library/transition/pauseAll.html
---@return any
function transition.pauseAll() end

---Resumes a paused transition
---@see https://docs.coronalabs.com/api/library/transition/resume.html
---@param transitionID? any
---@return nil
function transition.resume(transitionID) end

---@see https://docs.coronalabs.com/api/library/transition/resumeAll.html
---@return any
function transition.resumeAll() end

---@see https://docs.coronalabs.com/api/library/transition/scaleBy.html
---@type number
transition.scaleBy = nil

---@see https://docs.coronalabs.com/api/library/transition/scaleTo.html
---@type number
transition.scaleTo = nil

---@see https://docs.coronalabs.com/api/library/transition/to.html
---@type any
transition.to = nil
