---@meta network

---Solar2D network API
---Auto-generated from Solar2D documentation
---@see https://docs.coronalabs.com/api/library/network/
---@class network
network = {}

---@see https://docs.coronalabs.com/api/library/network/api.html
---@type any
network.api = nil

---@see https://docs.coronalabs.com/api/library/network/canDetectNetworkStatusChanges.html
---@type boolean
network.canDetectNetworkStatusChanges = nil

---@see https://docs.coronalabs.com/api/library/network/cancel.html
---@return any
function network.cancel() end

---Downloads a file from a URL
---@see https://docs.coronalabs.com/api/library/network/download.html
---@param url string URL string
---@param method string HTTP method (GET, POST, etc.)
---@param listener function Callback function
---@param params? table Table of parameters
---@param filename string Path to the file
---@return any
function network.download(url, method, listener, params, filename) end

---Makes an asynchronous HTTP/HTTPS network request
---@see https://docs.coronalabs.com/api/library/network/request.html
---@param url string URL string
---@param method string HTTP method (GET, POST, etc.)
---@param listener function Callback function
---@param params? table Table of parameters
---@return any
function network.request(url, method, listener, params) end

---Sets the statuslistener value
---@see https://docs.coronalabs.com/api/library/network/setStatusListener.html
---@return any
function network.setStatusListener() end

---@see https://docs.coronalabs.com/api/library/network/upload.html
---@return any
function network.upload() end
