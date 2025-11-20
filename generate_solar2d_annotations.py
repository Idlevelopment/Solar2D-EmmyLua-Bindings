#!/usr/bin/env python3
"""
Solar2D EmmyLua Annotation Generator
Scrapes Solar2D documentation and generates EmmyLua annotation files
Auto-generated from: https://docs.coronalabs.com/api/
"""

import re
import json
import os
from typing import Dict, List, Set, Optional, Tuple
from urllib.request import urlopen, Request
from urllib.parse import urljoin
from html.parser import HTMLParser
import time
import sys

class Solar2DDocParser(HTMLParser):
    """Parse Solar2D documentation HTML to extract API information"""

    def __init__(self):
        super().__init__()
        self.current_tag = None
        self.current_attrs = {}
        self.capture_text = False
        self.text_buffer = []
        self.metadata = {}
        self.in_syntax = False
        self.in_description = False

    def handle_starttag(self, tag, attrs):
        self.current_tag = tag
        self.current_attrs = dict(attrs)

    def handle_data(self, data):
        if self.capture_text:
            self.text_buffer.append(data.strip())

    def get_captured_text(self):
        return ' '.join(self.text_buffer).strip()

def fetch_url(url: str, retries: int = 3) -> Optional[str]:
    """Fetch URL content with retries"""
    for attempt in range(retries):
        try:
            req = Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            with urlopen(req, timeout=10) as response:
                return response.read().decode('utf-8')
        except Exception as e:
            if attempt == retries - 1:
                print(f"Failed to fetch {url}: {e}", file=sys.stderr)
                return None
            time.sleep(1)
    return None

def parse_api_index(html: str) -> Dict[str, List[str]]:
    """Parse the API index page to get all API namespaces and functions"""

    # Known valid Solar2D namespaces - whitelist approach
    VALID_NAMESPACES = {
        'display', 'audio', 'timer', 'transition', 'physics', 'system',
        'network', 'native', 'composer', 'graphics', 'easing', 'widget',
        'crypto', 'json', 'sqlite3', 'store', 'gameNetwork', 'ads',
        'facebook', 'media', 'math', 'string', 'table', 'io', 'os',
        'package', 'lfs', 'socket', 'mime', 'ltn12'
    }

    apis = {}

    # Extract all API links - they follow pattern like "audio.dispose()"
    # Only match if namespace is at least 3 characters (avoids 'a', '1', etc.)
    pattern = r'\b([a-zA-Z][a-zA-Z0-9_]{2,})\.([a-zA-Z][a-zA-Z0-9_]+)\(\)'
    matches = re.findall(pattern, html)

    for namespace, func in matches:
        # Only add if it's a known valid namespace
        if namespace in VALID_NAMESPACES:
            if namespace not in apis:
                apis[namespace] = []
            if func not in apis[namespace]:
                apis[namespace].append(func)

    # Also find properties (no parentheses) - more strict pattern
    prop_pattern = r'\b([a-zA-Z][a-zA-Z0-9_]{2,})\.([a-zA-Z][a-zA-Z0-9_]+)\b(?!\()'
    prop_matches = re.findall(prop_pattern, html)

    for namespace, prop in prop_matches:
        # Only add if it's a known valid namespace
        if namespace in VALID_NAMESPACES:
            if namespace not in apis:
                apis[namespace] = []
            # Avoid duplicates and private properties
            if prop not in apis[namespace] and not prop.startswith('_'):
                apis[namespace].append(prop)

    # Filter out any that ended up empty
    apis = {k: v for k, v in apis.items() if v}

    return apis

def infer_type_from_name(name: str) -> str:
    """Infer EmmyLua type from parameter/property name"""
    name_lower = name.lower()

    # Boolean patterns
    if name_lower.startswith(('is', 'has', 'can', 'should', 'enable', 'disable')):
        return 'boolean'

    # Number patterns
    if any(word in name_lower for word in ['width', 'height', 'x', 'y', 'scale', 
                                              'alpha', 'rotation', 'angle', 'size',
                                              'time', 'delay', 'duration', 'count',
                                              'index', 'id', 'volume', 'speed']):
        return 'number'

    # String patterns
    if any(word in name_lower for word in ['name', 'text', 'url', 'path', 'key',
                                              'type', 'mode', 'source', 'label']):
        return 'string'

    # Function patterns
    if any(word in name_lower for word in ['listener', 'callback', 'handler', 'function']):
        return 'function'

    # Table/object patterns
    if any(word in name_lower for word in ['params', 'options', 'data', 'event',
                                             'object', 'table']):
        return 'table'

    return 'any'

def generate_description(namespace: str, func_name: str) -> Optional[str]:
    """Generate a brief description based on function name patterns"""
    name_lower = func_name.lower()

    # Display object creators
    if namespace == 'display':
        if func_name.startswith('new'):
            obj_type = func_name[3:]  # Remove 'new'
            return f"Creates a new {obj_type} display object"
        elif func_name == 'remove':
            return "Removes a display object from the display hierarchy"
        elif func_name == 'save':
            return "Saves a display object as an image file"
        elif func_name == 'capture':
            return "Captures a portion of the screen as a display object"

    # Audio functions
    elif namespace == 'audio':
        if func_name == 'play':
            return "Plays audio on a channel"
        elif func_name == 'stop':
            return "Stops audio playback on a channel"
        elif func_name == 'pause':
            return "Pauses audio playback on a channel"
        elif func_name == 'resume':
            return "Resumes paused audio playback"
        elif func_name == 'loadSound':
            return "Loads an audio file for short sound effects"
        elif func_name == 'loadStream':
            return "Loads an audio file for streaming (music)"
        elif func_name == 'dispose':
            return "Releases audio memory for a loaded sound"
        elif func_name == 'setVolume':
            return "Sets the volume for a channel or master volume"
        elif func_name == 'rewind':
            return "Rewinds audio to the beginning"
        elif func_name == 'seek':
            return "Seeks to a specific time position in audio"

    # Timer functions
    elif namespace == 'timer':
        if func_name == 'performWithDelay':
            return "Calls a function after a specified delay"
        elif func_name == 'cancel':
            return "Cancels a timer"
        elif func_name == 'pause':
            return "Pauses a timer"
        elif func_name == 'resume':
            return "Resumes a paused timer"

    # Transition functions
    elif namespace == 'transition':
        if func_name == 'to':
            return "Animates display object properties to target values"
        elif func_name == 'from':
            return "Animates display object properties from specified values"
        elif func_name == 'cancel':
            return "Cancels a transition"
        elif func_name == 'pause':
            return "Pauses a transition"
        elif func_name == 'resume':
            return "Resumes a paused transition"

    # Physics functions
    elif namespace == 'physics':
        if func_name == 'start':
            return "Starts the physics simulation"
        elif func_name == 'stop':
            return "Stops the physics simulation"
        elif func_name == 'pause':
            return "Pauses the physics simulation"
        elif func_name == 'addBody':
            return "Adds a physics body to a display object"
        elif func_name == 'removeBody':
            return "Removes the physics body from a display object"
        elif func_name == 'setGravity':
            return "Sets the gravity vector for the physics world"
        elif func_name == 'setDrawMode':
            return "Sets the debug draw mode for physics bodies"
        elif func_name == 'setScale':
            return "Sets the pixels-per-meter ratio for physics"

    # System functions
    elif namespace == 'system':
        if func_name == 'getInfo':
            return "Gets system information (platform, model, etc.)"
        elif func_name == 'getTimer':
            return "Gets milliseconds since app start"
        elif func_name == 'pathForFile':
            return "Gets the full path to a file in a system directory"
        elif func_name == 'openURL':
            return "Opens a URL in the default browser or app"
        elif func_name == 'setIdleTimer':
            return "Enables or disables the idle timer"
        elif func_name == 'vibrate':
            return "Vibrates the device"

    # Network functions
    elif namespace == 'network':
        if func_name == 'request':
            return "Makes an asynchronous HTTP/HTTPS network request"
        elif func_name == 'download':
            return "Downloads a file from a URL"

    # Native functions
    elif namespace == 'native':
        if func_name == 'showAlert':
            return "Displays a native alert dialog"
        elif func_name == 'newTextField':
            return "Creates a native text input field"
        elif func_name == 'newTextBox':
            return "Creates a native multi-line text box"
        elif func_name == 'newWebView':
            return "Creates a native web view"
        elif func_name == 'requestExit':
            return "Requests the app to exit (Android only)"
        elif func_name == 'cancelAlert':
            return "Cancels a displayed alert dialog"

    # Composer functions
    elif namespace == 'composer':
        if func_name == 'gotoScene':
            return "Transitions to a different scene"
        elif func_name == 'newScene':
            return "Creates a new scene object"
        elif func_name == 'removeScene':
            return "Removes a scene from memory"
        elif func_name == 'showOverlay':
            return "Shows an overlay scene on top of current scene"
        elif func_name == 'hideOverlay':
            return "Hides the currently displayed overlay scene"

    # Generic patterns
    if func_name.startswith('get'):
        return f"Gets the {func_name[3:].lower()} value"
    elif func_name.startswith('set'):
        return f"Sets the {func_name[3:].lower()} value"
    elif func_name.startswith('new'):
        return f"Creates a new {func_name[3:].lower()} object"
    elif func_name.startswith('load'):
        return f"Loads a {func_name[4:].lower()}"
    elif func_name.startswith('show'):
        return f"Shows the {func_name[4:].lower()}"
    elif func_name.startswith('hide'):
        return f"Hides the {func_name[4:].lower()}"

    return None

def add_parameter_hint(param_name: str) -> str:
    """Generate a helpful hint for a parameter"""
    name_lower = param_name.lower()

    hints = {
        'x': 'X coordinate position',
        'y': 'Y coordinate position',
        'width': 'Width in pixels',
        'height': 'Height in pixels',
        'radius': 'Radius in pixels',
        'filename': 'Path to the file',
        'text': 'Text content',
        'font': 'Font name or font object',
        'fontSize': 'Font size in pixels',
        'delay': 'Delay in milliseconds',
        'listener': 'Callback function',
        'iterations': 'Number of times to repeat (0 or -1 for infinite)',
        'target': 'Display object to animate',
        'params': 'Table of parameters',
        'options': 'Table of options',
        'channel': 'Audio channel number',
        'volume': 'Volume level (0.0 to 1.0)',
        'url': 'URL string',
        'method': 'HTTP method (GET, POST, etc.)',
        'baseDir': 'Base directory constant',
        'object': 'Display object',
        'bodyType': 'Physics body type (dynamic, static, kinematic)',
        'gx': 'Gravity X component',
        'gy': 'Gravity Y component',
        'mode': 'Mode string',
        'title': 'Alert title text',
        'message': 'Alert message text',
        'buttons': 'Array of button labels',
        'sceneName': 'Name of the scene',
        'effect': 'Transition effect name',
        'time': 'Duration in milliseconds',
        'eventName': 'Event name (e.g., enterFrame, system, tap)',
    }

    return hints.get(param_name, '')

def generate_function_annotation(namespace: str, func_name: str, 
                                 params: List[Tuple[str, str, bool]] = None,
                                 return_type: str = 'any') -> str:
    """Generate EmmyLua annotation for a function with description and parameter hints"""
    lines = []

    # Add description
    description = generate_description(namespace, func_name)
    if description:
        lines.append(f"---{description}")

    # Add documentation link
    lines.append(f"---@see https://docs.coronalabs.com/api/library/{namespace}/{func_name}.html")

    # Add parameters with hints
    if params:
        for param_name, param_type, is_optional in params:
            hint = add_parameter_hint(param_name)
            if hint:
                lines.append(f"---@param {param_name}{'?' if is_optional else ''} {param_type} {hint}")
            else:
                lines.append(f"---@param {param_name}{'?' if is_optional else ''} {param_type}")

    # Add return type
    lines.append(f"---@return {return_type}")

    # Function signature
    param_names = [p[0] for p in params] if params else []
    param_str = ', '.join(param_names)
    lines.append(f"function {namespace}.{func_name}({param_str}) end")

    return '\n'.join(lines)

def generate_property_annotation(namespace: str, prop_name: str, 
                                 prop_type: str = 'any') -> str:
    """Generate EmmyLua annotation for a property"""
    return f"---@see https://docs.coronalabs.com/api/library/{namespace}/{prop_name}.html\n---@type {prop_type}\n{namespace}.{prop_name} = nil"

class Solar2DAnnotationGenerator:
    """Main generator for Solar2D EmmyLua annotations"""

    def __init__(self, base_url: str = "https://docs.coronalabs.com"):
        self.base_url = base_url
        self.api_index_url = f"{base_url}/api/"
        self.apis: Dict[str, List[str]] = {}
        self.annotations: Dict[str, List[str]] = {}

    def fetch_api_list(self):
        """Fetch and parse the main API index"""
        print("Fetching API index...")
        html = fetch_url(self.api_index_url)
        if not html:
            print("Failed to fetch API index", file=sys.stderr)
            return

        self.apis = parse_api_index(html)
        print(f"Found {len(self.apis)} valid API namespaces")
        for ns in sorted(self.apis.keys()):
            print(f"  - {ns} ({len(self.apis[ns])} members)")

    def generate_basic_annotations(self):
        """Generate basic annotations based on API names and common patterns"""

        # Common Solar2D function patterns with known signatures
        known_signatures = {
            'display': {
                'newRect': ([('x', 'number', False), ('y', 'number', False),
                            ('width', 'number', False), ('height', 'number', False)], 'DisplayObject'),
                'newCircle': ([('x', 'number', False), ('y', 'number', False),
                              ('radius', 'number', False)], 'DisplayObject'),
                'newImage': ([('filename', 'string', False), ('x', 'number', True),
                             ('y', 'number', True)], 'DisplayObject'),
                'newText': ([('text', 'string', False), ('x', 'number', False),
                            ('y', 'number', False), ('font', 'any', True),
                            ('fontSize', 'number', True)], 'TextObject'),
                'newGroup': ([], 'GroupObject'),
                'remove': ([('object', 'DisplayObject', False)], 'nil'),
                'newImageRect': ([('filename', 'string', False), ('width', 'number', False),
                                 ('height', 'number', False)], 'DisplayObject'),
                'newPolygon': ([('x', 'number', False), ('y', 'number', False),
                               ('vertices', 'table', False)], 'DisplayObject'),
                'newLine': ([('x1', 'number', False), ('y1', 'number', False),
                            ('x2', 'number', False), ('y2', 'number', False)], 'DisplayObject'),
                'save': ([('displayObject', 'DisplayObject', False), ('options', 'table', True)], 'table'),
                'capture': ([('displayObject', 'DisplayObject', False), ('options', 'table', True)], 'DisplayObject'),
            },
            'audio': {
                'play': ([('soundHandle', 'any', False), ('options', 'table', True)], 'number'),
                'stop': ([('channel', 'number', True)], 'nil'),
                'pause': ([('channel', 'number', True)], 'nil'),
                'resume': ([('channel', 'number', True)], 'nil'),
                'dispose': ([('soundHandle', 'any', False)], 'nil'),
                'loadSound': ([('filename', 'string', False), ('baseDir', 'any', True)], 'any'),
                'loadStream': ([('filename', 'string', False), ('baseDir', 'any', True)], 'any'),
                'setVolume': ([('volume', 'number', False), ('options', 'table', True)], 'boolean'),
                'rewind': ([('options', 'table', True)], 'boolean'),
                'seek': ([('time', 'number', False), ('options', 'table', True)], 'number'),
            },
            'timer': {
                'performWithDelay': ([('delay', 'number', False), ('listener', 'function', False),
                                     ('iterations', 'number', True)], 'any'),
                'cancel': ([('timerID', 'any', False)], 'nil'),
                'pause': ([('timerID', 'any', False)], 'nil'),
                'resume': ([('timerID', 'any', False)], 'nil'),
            },
            'transition': {
                'to': ([('target', 'DisplayObject', False), ('params', 'table', False)], 'any'),
                'from': ([('target', 'DisplayObject', False), ('params', 'table', False)], 'any'),
                'cancel': ([('transitionID', 'any', True)], 'nil'),
                'pause': ([('transitionID', 'any', True)], 'nil'),
                'resume': ([('transitionID', 'any', True)], 'nil'),
            },
            'physics': {
                'start': ([], 'nil'),
                'stop': ([], 'nil'),
                'pause': ([], 'nil'),
                'addBody': ([('object', 'DisplayObject', False), ('bodyType', 'string', True),
                            ('options', 'table', True)], 'nil'),
                'removeBody': ([('object', 'DisplayObject', False)], 'nil'),
                'setGravity': ([('gx', 'number', False), ('gy', 'number', False)], 'nil'),
                'setDrawMode': ([('mode', 'string', False)], 'nil'),
                'setScale': ([('scale', 'number', False)], 'nil'),
            },
            'system': {
                'getInfo': ([('param', 'string', False)], 'any'),
                'getTimer': ([], 'number'),
                'pathForFile': ([('filename', 'string', False), ('baseDir', 'any', True)], 'string'),
                'openURL': ([('url', 'string', False)], 'boolean'),
                'setIdleTimer': ([('enabled', 'boolean', False)], 'nil'),
                'vibrate': ([], 'nil'),
            },
            'network': {
                'request': ([('url', 'string', False), ('method', 'string', False),
                            ('listener', 'function', False), ('params', 'table', True)], 'any'),
                'download': ([('url', 'string', False), ('method', 'string', False),
                             ('listener', 'function', False), ('params', 'table', True),
                             ('filename', 'string', False)], 'any'),
            },
            'native': {
                'showAlert': ([('title', 'string', False), ('message', 'string', False),
                              ('buttons', 'table', False), ('listener', 'function', True)], 'any'),
                'newTextField': ([('x', 'number', False), ('y', 'number', False),
                                 ('width', 'number', False), ('height', 'number', False)], 'TextFieldObject'),
                'newTextBox': ([('x', 'number', False), ('y', 'number', False),
                               ('width', 'number', False), ('height', 'number', False)], 'TextBoxObject'),
                'newWebView': ([('x', 'number', False), ('y', 'number', False),
                               ('width', 'number', False), ('height', 'number', False)], 'WebViewObject'),
                'requestExit': ([], 'nil'),
                'cancelAlert': ([('alertId', 'any', False)], 'nil'),
            },
            'composer': {
                'gotoScene': ([('sceneName', 'string', False), ('options', 'table', True)], 'nil'),
                'newScene': ([('sceneName', 'string', True)], 'table'),
                'removeScene': ([('sceneName', 'string', False), ('shouldRecycle', 'boolean', True)], 'boolean'),
                'showOverlay': ([('sceneName', 'string', False), ('options', 'table', True)], 'nil'),
                'hideOverlay': ([('shouldRecycle', 'boolean', True), ('effect', 'string', True),
                                ('time', 'number', True)], 'nil'),
            }
        }

        # Generate annotations for each namespace
        for namespace, members in sorted(self.apis.items()):
            annotations = []
            annotations.append(f"---@meta {namespace}")
            annotations.append("")
            annotations.append(f"---Solar2D {namespace} API")
            annotations.append(f"---Auto-generated from Solar2D documentation")
            annotations.append(f"---@see https://docs.coronalabs.com/api/library/{namespace}/")
            annotations.append(f"---@class {namespace}")
            annotations.append(f"{namespace} = {{}}")
            annotations.append("")

            for member in sorted(members):
                # Check if it's a function (has common function name patterns)
                is_function = any(verb in member.lower() for verb in 
                                ['get', 'set', 'new', 'load', 'create', 'add', 'remove',
                                 'play', 'stop', 'pause', 'resume', 'cancel', 'start',
                                 'init', 'show', 'hide', 'fade', 'capture', 'request',
                                 'goto', 'perform', 'seek', 'rewind', 'open', 'close',
                                 'vibrate', 'download', 'upload'])

                if is_function:
                    # Use known signature if available, otherwise infer
                    if namespace in known_signatures and member in known_signatures[namespace]:
                        params, return_type = known_signatures[namespace][member]
                        ann = generate_function_annotation(namespace, member, params, return_type)
                    else:
                        # Infer basic signature
                        ann = generate_function_annotation(namespace, member, None, 'any')
                    annotations.append(ann)
                else:
                    # Treat as property
                    prop_type = infer_type_from_name(member)
                    ann = generate_property_annotation(namespace, member, prop_type)
                    annotations.append(ann)

                annotations.append("")

            self.annotations[namespace] = annotations

    def generate_display_object_class(self):
        """Generate DisplayObject base class annotations"""
        annotations = [
            "---@meta DisplayObject",
            "",
            "---Solar2D DisplayObject base class",
            "---Auto-generated from Solar2D documentation",
            "---@see https://docs.coronalabs.com/api/type/DisplayObject/",
            "---@class DisplayObject",
            "---@field x number X coordinate position",
            "---@field y number Y coordinate position",
            "---@field width number Width in content coordinates",
            "---@field height number Height in content coordinates",
            "---@field rotation number Rotation in degrees",
            "---@field alpha number Opacity (0.0 to 1.0)",
            "---@field isVisible boolean Visibility flag",
            "---@field xScale number Horizontal scale factor",
            "---@field yScale number Vertical scale factor",
            "---@field anchorX number Horizontal anchor point (0.0 to 1.0)",
            "---@field anchorY number Vertical anchor point (0.0 to 1.0)",
            "---@field parent GroupObject|nil Parent group object",
            "---@field contentWidth number Content width in pixels",
            "---@field contentHeight number Content height in pixels",
            "---@field contentBounds table Bounds in content coordinates",
            "---@field name string Object identifier name",
            "DisplayObject = {}",
            "",
            "---Removes this object from the display hierarchy",
            "---@return nil",
            "function DisplayObject:removeSelf() end",
            "",
            "---Rotates the object by the specified angle",
            "---@param deltaAngle number Rotation angle in degrees",
            "---@return nil",
            "function DisplayObject:rotate(deltaAngle) end",
            "",
            "---Scales the object",
            "---@param sx number Horizontal scale factor",
            "---@param sy number Vertical scale factor",
            "---@return nil",
            "function DisplayObject:scale(sx, sy) end",
            "",
            "---Translates the object position",
            "---@param deltaX number X offset",
            "---@param deltaY number Y offset",
            "---@return nil",
            "function DisplayObject:translate(deltaX, deltaY) end",
            "",
            "---Sets the fill color",
            "---@param r number Red component (0.0 to 1.0)",
            "---@param g number Green component (0.0 to 1.0)",
            "---@param b number Blue component (0.0 to 1.0)",
            "---@param a number? Alpha component (0.0 to 1.0)",
            "---@return nil",
            "function DisplayObject:setFillColor(r, g, b, a) end",
            "",
            "---Sets the stroke (border) color",
            "---@param r number Red component (0.0 to 1.0)",
            "---@param g number Green component (0.0 to 1.0)",
            "---@param b number Blue component (0.0 to 1.0)",
            "---@param a number? Alpha component (0.0 to 1.0)",
            "---@return nil",
            "function DisplayObject:setStrokeColor(r, g, b, a) end",
            "",
            "---Adds an event listener",
            "---@param eventName string Event name (e.g., 'tap', 'touch')",
            "---@param listener function Callback function",
            "---@return nil",
            "function DisplayObject:addEventListener(eventName, listener) end",
            "",
            "---Removes an event listener",
            "---@param eventName string Event name",
            "---@param listener function Callback function to remove",
            "---@return nil",
            "function DisplayObject:removeEventListener(eventName, listener) end",
            "",
            "---@class GroupObject : DisplayObject",
            "---@field numChildren number Number of child objects",
            "GroupObject = {}",
            "",
            "---Inserts an object into the group",
            "---@param object DisplayObject Object to insert",
            "---@return nil",
            "function GroupObject:insert(object) end",
            "",
            "---Removes an object from the group",
            "---@param indexOrObject number|DisplayObject Index or object to remove",
            "---@return nil",
            "function GroupObject:remove(indexOrObject) end",
            "",
            "---@class TextObject : DisplayObject",
            "---@field text string Text content",
            "---@field size number Font size in pixels",
            "---@field font any Font name or font object",
            "TextObject = {}",
            "",
            "---@class TextFieldObject : DisplayObject",
            "---@field text string Text content",
            "---@field size number Font size",
            "---@field font any Font name or font object",
            "---@field isSecure boolean Password field flag",
            "TextFieldObject = {}",
            "",
            "---@class TextBoxObject : DisplayObject",
            "---@field text string Text content",
            "---@field size number Font size",
            "---@field font any Font name or font object",
            "TextBoxObject = {}",
            "",
            "---@class WebViewObject : DisplayObject",
            "WebViewObject = {}",
            "",
        ]
        self.annotations['DisplayObject'] = annotations

    def generate_event_class(self):
        """Generate Event base class annotations"""
        annotations = [
            "---@meta Event",
            "",
            "---Solar2D Event base class",
            "---Auto-generated from Solar2D documentation",
            "---@see https://docs.coronalabs.com/api/type/Event/",
            "---@class Event",
            "---@field name string Event name",
            "---@field target any Event target object",
            "---@field phase string|nil Event phase",
            "---@field time number Event timestamp",
            "Event = {}",
            "",
            "---@class TouchEvent : Event",
            "---@field x number Touch X coordinate",
            "---@field y number Touch Y coordinate",
            "---@field xStart number Starting X coordinate",
            "---@field yStart number Starting Y coordinate",
            "---@field id any Touch ID for multitouch",
            "TouchEvent = {}",
            "",
            "---@class TapEvent : Event",
            "---@field x number Tap X coordinate",
            "---@field y number Tap Y coordinate",
            "---@field numTaps number Number of taps",
            "TapEvent = {}",
            "",
            "---@class CollisionEvent : Event",
            "---@field object1 DisplayObject First colliding object",
            "---@field object2 DisplayObject Second colliding object",
            "---@field contact table Contact point data",
            "---@field force number Collision force",
            "---@field friction number Collision friction",
            "CollisionEvent = {}",
            "",
        ]
        self.annotations['Event'] = annotations

    def generate_global_variables(self):
        """Generate global variables and constants"""
        annotations = [
            "---@meta _globals",
            "",
            "---Solar2D Global Variables",
            "---Auto-generated from Solar2D documentation",
            "---@see https://docs.coronalabs.com/api/",
            "",
            "---Display library for creating and manipulating display objects",
            "---@type display",
            "display = {}",
            "",
            "---Audio library for playing sounds and music",
            "---@type audio",
            "audio = {}",
            "",
            "---Timer library for delayed/repeated execution",
            "---@type timer",
            "timer = {}",
            "",
            "---Transition library for animating display objects",
            "---@type transition",
            "transition = {}",
            "",
            "---Physics library for Box2D physics simulation",
            "---@type physics",
            "physics = {}",
            "",
            "---System library for system information and functions",
            "---@type system",
            "system = {}",
            "",
            "---Network library for HTTP requests and downloads",
            "---@type network",
            "network = {}",
            "",
            "---Native library for native UI elements",
            "---@type native",
            "native = {}",
            "",
            "---Composer library for scene management",
            "---@type composer",
            "composer = {}",
            "",
            "---Runtime object for app-wide events",
            "---@class Runtime",
            "Runtime = {}",
            "",
            "---Adds an event listener to the Runtime object",
            "---@param eventName string Event name (e.g., enterFrame, system, tap)",
            "---@param listener function Callback function to handle the event",
            "---@return nil",
            "function Runtime:addEventListener(eventName, listener) end",
            "",
            "---Removes an event listener from the Runtime object",
            "---@param eventName string Event name",
            "---@param listener function Callback function to remove",
            "---@return nil",
            "function Runtime:removeEventListener(eventName, listener) end",
            "",
            "---Dispatches an event to Runtime listeners",
            "---@param event Event Event object to dispatch",
            "---@return nil",
            "function Runtime:dispatchEvent(event) end",
            "",
            "---Graphics library",
            "---@type graphics",
            "graphics = {}",
            "",
            "---Easing library for transition easing functions",
            "---@type easing",
            "easing = {}",
            "",
            "---Widget library for UI widgets",
            "---@type widget",
            "widget = {}",
            "",
            "---Crypto library for cryptographic operations",
            "---@type crypto",
            "crypto = {}",
            "",
            "---JSON library",
            "---@type json",
            "json = {}",
            "",
            "---SQLite library",
            "---@type sqlite3",
            "sqlite3 = {}",
            "",
            "---Store library for in-app purchases",
            "---@type store",
            "store = {}",
            "",
            "---GameNetwork library",
            "---@type gameNetwork",
            "gameNetwork = {}",
            "",
            "---Ads library",
            "---@type ads",
            "ads = {}",
            "",
            "---Facebook library",
            "---@type facebook",
            "facebook = {}",
            "",
            "---Media library for camera and photo access",
            "---@type media",
            "media = {}",
            "",
        ]
        self.annotations['_globals'] = annotations

    def write_annotations(self, output_dir: str = "solar2d-emmylua"):
        """Write all annotations to files"""
        os.makedirs(output_dir, exist_ok=True)

        for namespace, annotations in self.annotations.items():
            filename = f"{namespace}.lua"
            filepath = os.path.join(output_dir, filename)

            with open(filepath, 'w', encoding='utf-8') as f:
                f.write('\n'.join(annotations))

            print(f"Generated {filepath}")

        print(f"\nGenerated {len(self.annotations)} annotation files in '{output_dir}/'")

    def run(self, output_dir: str = "solar2d-emmylua"):
        """Run the complete generation process"""
        print("Solar2D EmmyLua Annotation Generator")
        print("=" * 50)
        print(f"Source: {self.base_url}")
        print()

        self.fetch_api_list()
        self.generate_basic_annotations()
        self.generate_display_object_class()
        self.generate_event_class()
        self.generate_global_variables()
        self.write_annotations(output_dir)

        print("\nDone! To use these annotations:")
        print(f"1. Copy the '{output_dir}/' folder to your project")
        print("2. Configure your Lua language server to recognize these files")
        print("3. Start coding with autocomplete and type hints!")

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Generate EmmyLua annotations for Solar2D")
    parser.add_argument('-o', '--output', default='solar2d-emmylua',
                       help='Output directory (default: solar2d-emmylua)')
    parser.add_argument('--base-url', default='https://docs.coronalabs.com',
                       help='Base URL for documentation')

    args = parser.parse_args()

    generator = Solar2DAnnotationGenerator(base_url=args.base_url)
    generator.run(output_dir=args.output)
