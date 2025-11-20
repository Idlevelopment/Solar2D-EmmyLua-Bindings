---@meta timer

---Solar2D timer API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/timer/
---@class timer
timer = {}

---@see https://docs.coronalabs.com/api/library/timer/allowInterationsWithinFrame.html
---@type any
timer.allowInterationsWithinFrame = nil

---@see https://docs.coronalabs.com/api/library/timer/api.html
---@type any
timer.api = nil

---Cancels a timer
---@see https://docs.coronalabs.com/api/library/timer/cancel.html
---@param timerID any
---@return nil
function timer.cancel(timerID) end

---@see https://docs.coronalabs.com/api/library/timer/cancelAll.html
---@return any
function timer.cancelAll() end

---Pauses a timer
---@see https://docs.coronalabs.com/api/library/timer/pause.html
---@param timerID any
---@return nil
function timer.pause(timerID) end

---@see https://docs.coronalabs.com/api/library/timer/pauseAll.html
---@return any
function timer.pauseAll() end

---Calls a function after a specified delay
---@see https://docs.coronalabs.com/api/library/timer/performWithDelay.html
---@param delay number Delay in milliseconds
---@param listener function Callback function
---@param iterations? number Number of times to repeat (0 or -1 for infinite)
---@return any
function timer.performWithDelay(delay, listener, iterations) end

---Resumes a paused timer
---@see https://docs.coronalabs.com/api/library/timer/resume.html
---@param timerID any
---@return nil
function timer.resume(timerID) end

---@see https://docs.coronalabs.com/api/library/timer/resumeAll.html
---@return any
function timer.resumeAll() end
