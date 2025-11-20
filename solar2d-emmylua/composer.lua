---@meta composer

---Solar2D composer API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/composer/
---@class composer
composer = {}

---@see https://docs.coronalabs.com/api/library/composer/api.html
---@type any
composer.api = nil

---Gets the scene value
---@see https://docs.coronalabs.com/api/library/composer/getScene.html
---@return any
function composer.getScene() end

---Gets the scenename value
---@see https://docs.coronalabs.com/api/library/composer/getSceneName.html
---@return any
function composer.getSceneName() end

---Gets the variable value
---@see https://docs.coronalabs.com/api/library/composer/getVariable.html
---@return any
function composer.getVariable() end

---Transitions to a different scene
---@see https://docs.coronalabs.com/api/library/composer/gotoScene.html
---@param sceneName string Name of the scene
---@param options? table Table of options
---@return nil
function composer.gotoScene(sceneName, options) end

---Hides the currently displayed overlay scene
---@see https://docs.coronalabs.com/api/library/composer/hideOverlay.html
---@param shouldRecycle? boolean
---@param effect? string Transition effect name
---@param time? number Duration in milliseconds
---@return nil
function composer.hideOverlay(shouldRecycle, effect, time) end

---@see https://docs.coronalabs.com/api/library/composer/isDebug.html
---@type boolean
composer.isDebug = nil

---Loads a scene
---@see https://docs.coronalabs.com/api/library/composer/loadScene.html
---@return any
function composer.loadScene() end

---Creates a new scene object
---@see https://docs.coronalabs.com/api/library/composer/newScene.html
---@param sceneName? string Name of the scene
---@return table
function composer.newScene(sceneName) end

---@see https://docs.coronalabs.com/api/library/composer/recycleAutomatically.html
---@type number
composer.recycleAutomatically = nil

---@see https://docs.coronalabs.com/api/library/composer/recycleOnLowMemory.html
---@type number
composer.recycleOnLowMemory = nil

---@see https://docs.coronalabs.com/api/library/composer/recycleOnSceneChange.html
---@type number
composer.recycleOnSceneChange = nil

---@see https://docs.coronalabs.com/api/library/composer/removeHidden.html
---@return any
function composer.removeHidden() end

---Removes a scene from memory
---@see https://docs.coronalabs.com/api/library/composer/removeScene.html
---@param sceneName string Name of the scene
---@param shouldRecycle? boolean
---@return boolean
function composer.removeScene(sceneName, shouldRecycle) end

---Sets the variable value
---@see https://docs.coronalabs.com/api/library/composer/setVariable.html
---@return any
function composer.setVariable() end

---Shows an overlay scene on top of current scene
---@see https://docs.coronalabs.com/api/library/composer/showOverlay.html
---@param sceneName string Name of the scene
---@param options? table Table of options
---@return nil
function composer.showOverlay(sceneName, options) end

---@see https://docs.coronalabs.com/api/library/composer/stage.html
---@type any
composer.stage = nil
