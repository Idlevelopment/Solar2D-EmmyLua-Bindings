---@meta physics

---Solar2D physics API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/physics/
---@class physics
physics = {}

---Adds a physics body to a display object
---@see https://docs.coronalabs.com/api/library/physics/addBody.html
---@param object DisplayObject Display object
---@param bodyType? string Physics body type (dynamic, static, kinematic)
---@param options? table Table of options
---@return nil
function physics.addBody(object, bodyType, options) end

---@see https://docs.coronalabs.com/api/library/physics/api.html
---@type any
physics.api = nil

---@see https://docs.coronalabs.com/api/library/physics/engineVersion.html
---@type any
physics.engineVersion = nil

---@see https://docs.coronalabs.com/api/library/physics/fromMKS.html
---@type any
physics.fromMKS = nil

---Gets the averagecollisionpositions value
---@see https://docs.coronalabs.com/api/library/physics/getAverageCollisionPositions.html
---@return any
function physics.getAverageCollisionPositions() end

---Gets the debugerrorsenabled value
---@see https://docs.coronalabs.com/api/library/physics/getDebugErrorsEnabled.html
---@return any
function physics.getDebugErrorsEnabled() end

---Gets the gravity value
---@see https://docs.coronalabs.com/api/library/physics/getGravity.html
---@return any
function physics.getGravity() end

---Gets the mks value
---@see https://docs.coronalabs.com/api/library/physics/getMKS.html
---@return any
function physics.getMKS() end

---Gets the reportcollisionsincontentcoordinates value
---@see https://docs.coronalabs.com/api/library/physics/getReportCollisionsInContentCoordinates.html
---@return any
function physics.getReportCollisionsInContentCoordinates() end

---Gets the timescale value
---@see https://docs.coronalabs.com/api/library/physics/getTimeScale.html
---@return any
function physics.getTimeScale() end

---Creates a new joint object
---@see https://docs.coronalabs.com/api/library/physics/newJoint.html
---@return any
function physics.newJoint() end

---Creates a new particlesystem object
---@see https://docs.coronalabs.com/api/library/physics/newParticleSystem.html
---@return any
function physics.newParticleSystem() end

---Pauses the physics simulation
---@see https://docs.coronalabs.com/api/library/physics/pause.html
---@return nil
function physics.pause() end

---@see https://docs.coronalabs.com/api/library/physics/queryRegion.html
---@type number
physics.queryRegion = nil

---@see https://docs.coronalabs.com/api/library/physics/rayCast.html
---@type number
physics.rayCast = nil

---@see https://docs.coronalabs.com/api/library/physics/reflectRay.html
---@type number
physics.reflectRay = nil

---Removes the physics body from a display object
---@see https://docs.coronalabs.com/api/library/physics/removeBody.html
---@param object DisplayObject Display object
---@return nil
function physics.removeBody(object) end

---Sets the averagecollisionpositions value
---@see https://docs.coronalabs.com/api/library/physics/setAverageCollisionPositions.html
---@return any
function physics.setAverageCollisionPositions() end

---Sets the continuous value
---@see https://docs.coronalabs.com/api/library/physics/setContinuous.html
---@return any
function physics.setContinuous() end

---Sets the debugerrorsenabled value
---@see https://docs.coronalabs.com/api/library/physics/setDebugErrorsEnabled.html
---@return any
function physics.setDebugErrorsEnabled() end

---Sets the debug draw mode for physics bodies
---@see https://docs.coronalabs.com/api/library/physics/setDrawMode.html
---@param mode string Mode string
---@return nil
function physics.setDrawMode(mode) end

---Sets the gravity vector for the physics world
---@see https://docs.coronalabs.com/api/library/physics/setGravity.html
---@param gx number Gravity X component
---@param gy number Gravity Y component
---@return nil
function physics.setGravity(gx, gy) end

---Sets the mks value
---@see https://docs.coronalabs.com/api/library/physics/setMKS.html
---@return any
function physics.setMKS() end

---Sets the positioniterations value
---@see https://docs.coronalabs.com/api/library/physics/setPositionIterations.html
---@return any
function physics.setPositionIterations() end

---Sets the reportcollisionsincontentcoordinates value
---@see https://docs.coronalabs.com/api/library/physics/setReportCollisionsInContentCoordinates.html
---@return any
function physics.setReportCollisionsInContentCoordinates() end

---Sets the pixels-per-meter ratio for physics
---@see https://docs.coronalabs.com/api/library/physics/setScale.html
---@param scale number
---@return nil
function physics.setScale(scale) end

---Sets the timescale value
---@see https://docs.coronalabs.com/api/library/physics/setTimeScale.html
---@return any
function physics.setTimeScale() end

---Sets the timestep value
---@see https://docs.coronalabs.com/api/library/physics/setTimeStep.html
---@return any
function physics.setTimeStep() end

---Sets the velocityiterations value
---@see https://docs.coronalabs.com/api/library/physics/setVelocityIterations.html
---@return any
function physics.setVelocityIterations() end

---Starts the physics simulation
---@see https://docs.coronalabs.com/api/library/physics/start.html
---@return nil
function physics.start() end

---Stops the physics simulation
---@see https://docs.coronalabs.com/api/library/physics/stop.html
---@return nil
function physics.stop() end

---@see https://docs.coronalabs.com/api/library/physics/toMKS.html
---@type any
physics.toMKS = nil
