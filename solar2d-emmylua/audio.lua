---@meta audio

---Solar2D audio API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/audio/
---@class audio
audio = {}

---@see https://docs.coronalabs.com/api/library/audio/api.html
---@type any
audio.api = nil

---@see https://docs.coronalabs.com/api/library/audio/dispose.html
---@type any
audio.dispose = nil

---@see https://docs.coronalabs.com/api/library/audio/fade.html
---@return any
function audio.fade() end

---@see https://docs.coronalabs.com/api/library/audio/fadeOut.html
---@return any
function audio.fadeOut() end

---@see https://docs.coronalabs.com/api/library/audio/findFreeChannel.html
---@type any
audio.findFreeChannel = nil

---@see https://docs.coronalabs.com/api/library/audio/freeChannels.html
---@type any
audio.freeChannels = nil

---Gets the duration value
---@see https://docs.coronalabs.com/api/library/audio/getDuration.html
---@return any
function audio.getDuration() end

---Gets the maxvolume value
---@see https://docs.coronalabs.com/api/library/audio/getMaxVolume.html
---@return any
function audio.getMaxVolume() end

---Gets the minvolume value
---@see https://docs.coronalabs.com/api/library/audio/getMinVolume.html
---@return any
function audio.getMinVolume() end

---Gets the volume value
---@see https://docs.coronalabs.com/api/library/audio/getVolume.html
---@return any
function audio.getVolume() end

---@see https://docs.coronalabs.com/api/library/audio/isChannelActive.html
---@type boolean
audio.isChannelActive = nil

---@see https://docs.coronalabs.com/api/library/audio/isChannelPaused.html
---@return any
function audio.isChannelPaused() end

---@see https://docs.coronalabs.com/api/library/audio/isChannelPlaying.html
---@return any
function audio.isChannelPlaying() end

---Loads an audio file for short sound effects
---@see https://docs.coronalabs.com/api/library/audio/loadSound.html
---@param filename string Path to the file
---@param baseDir? any Base directory constant
---@return any
function audio.loadSound(filename, baseDir) end

---Loads an audio file for streaming (music)
---@see https://docs.coronalabs.com/api/library/audio/loadStream.html
---@param filename string Path to the file
---@param baseDir? any Base directory constant
---@return any
function audio.loadStream(filename, baseDir) end

---Pauses audio playback on a channel
---@see https://docs.coronalabs.com/api/library/audio/pause.html
---@param channel? number Audio channel number
---@return nil
function audio.pause(channel) end

---Plays audio on a channel
---@see https://docs.coronalabs.com/api/library/audio/play.html
---@param soundHandle any
---@param options? table Table of options
---@return number
function audio.play(soundHandle, options) end

---@see https://docs.coronalabs.com/api/library/audio/reserveChannels.html
---@type any
audio.reserveChannels = nil

---@see https://docs.coronalabs.com/api/library/audio/reservedChannels.html
---@type any
audio.reservedChannels = nil

---Resumes paused audio playback
---@see https://docs.coronalabs.com/api/library/audio/resume.html
---@param channel? number Audio channel number
---@return nil
function audio.resume(channel) end

---Rewinds audio to the beginning
---@see https://docs.coronalabs.com/api/library/audio/rewind.html
---@param options? table Table of options
---@return boolean
function audio.rewind(options) end

---Seeks to a specific time position in audio
---@see https://docs.coronalabs.com/api/library/audio/seek.html
---@param time number Duration in milliseconds
---@param options? table Table of options
---@return number
function audio.seek(time, options) end

---Sets the maxvolume value
---@see https://docs.coronalabs.com/api/library/audio/setMaxVolume.html
---@return any
function audio.setMaxVolume() end

---Sets the minvolume value
---@see https://docs.coronalabs.com/api/library/audio/setMinVolume.html
---@return any
function audio.setMinVolume() end

---Sets the volume for a channel or master volume
---@see https://docs.coronalabs.com/api/library/audio/setVolume.html
---@param volume number Volume level (0.0 to 1.0)
---@param options? table Table of options
---@return boolean
function audio.setVolume(volume, options) end

---Stops audio playback on a channel
---@see https://docs.coronalabs.com/api/library/audio/stop.html
---@param channel? number Audio channel number
---@return nil
function audio.stop(channel) end

---@see https://docs.coronalabs.com/api/library/audio/stopWithDelay.html
---@return any
function audio.stopWithDelay() end

---@see https://docs.coronalabs.com/api/library/audio/totalChannels.html
---@type any
audio.totalChannels = nil

---@see https://docs.coronalabs.com/api/library/audio/unreservedFreeChannels.html
---@type any
audio.unreservedFreeChannels = nil

---@see https://docs.coronalabs.com/api/library/audio/unreservedUsedChannels.html
---@type any
audio.unreservedUsedChannels = nil

---@see https://docs.coronalabs.com/api/library/audio/usedChannels.html
---@type any
audio.usedChannels = nil
