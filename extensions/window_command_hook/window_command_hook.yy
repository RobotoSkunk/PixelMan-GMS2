{
    "id": "aa95702e-334a-4a93-9048-d55e8055ca33",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "window_command_hook",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 113497714299118,
    "date": "2020-04-27 03:03:46",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "2f227f23-0b70-436d-9e73-3d6454b346b0",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 113497714299118,
            "filename": "window_command_hook.dll",
            "final": "window_command_cleanup",
            "functions": [
                {
                    "id": "90a134bb-1c8f-42d6-b2b7-1ffc7c17842f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "window_command_run_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_run_raw",
                    "returnType": 2
                },
                {
                    "id": "78588694-f50c-41c1-a227-c58fe8827762",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_command_cleanup",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_cleanup",
                    "returnType": 2
                },
                {
                    "id": "c97f4369-fef7-42be-a4c2-6e89970196b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "window_command_init_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_init_raw",
                    "returnType": 2
                },
                {
                    "id": "e10d756e-2b7d-4ff7-85f3-98dd79f75a95",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "window_command_bind_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_bind_raw",
                    "returnType": 2
                },
                {
                    "id": "de0440a6-741b-4317-8891-4f2048876e1b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_command_hook_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_hook_raw",
                    "returnType": 2
                },
                {
                    "id": "e43835c0-b6db-4f04-8824-aea2c214878d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_unhook_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_unhook_raw",
                    "returnType": 2
                },
                {
                    "id": "a29169dc-37fa-4af0-ab3c-b4c119170d36",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_command_get_active_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_get_active_raw",
                    "returnType": 2
                },
                {
                    "id": "e003ed4e-4b1a-4dee-be5f-493ae0a71b24",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        2,
                        2
                    ],
                    "externalName": "window_command_set_active_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_set_active_raw",
                    "returnType": 2
                },
                {
                    "id": "ff3f87e4-b603-4c95-b344-d1b754afbeb9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_check",
                    "help": "window_command_check(button) : Returns whether the given button was pressed since the last call to this function.",
                    "hidden": false,
                    "kind": 1,
                    "name": "window_command_check",
                    "returnType": 2
                },
                {
                    "id": "ed182716-2af0-4a4d-9da7-0cd37ef284bf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_topmost_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_topmost_raw",
                    "returnType": 2
                },
                {
                    "id": "f0f53822-758e-41ff-a715-97e855ce5676",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_get_background_redraw",
                    "help": "window_get_background_redraw()",
                    "hidden": false,
                    "kind": 1,
                    "name": "window_get_background_redraw",
                    "returnType": 2
                },
                {
                    "id": "41715260-e4c8-4baf-9200-6fc2daa0a2a2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_background_redraw_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_background_redraw_raw",
                    "returnType": 2
                },
                {
                    "id": "0cfc914e-98f0-42a1-a1be-bc7f642cef14",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_taskbar_button_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_taskbar_button_raw",
                    "returnType": 2
                },
                {
                    "id": "6e9f8883-afb4-4044-924e-d656a7750a27",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "window_get_taskbar_button_visible_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_get_taskbar_button_visible_raw",
                    "returnType": 2
                },
                {
                    "id": "bbae04a5-5185-480b-a65a-8284c62bd63d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "window_set_taskbar_button_visible_raw",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_set_taskbar_button_visible_raw",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\window_command_hook.dll",
            "uncompress": false
        },
        {
            "id": "42d52dd9-aeee-4866-a655-338be1677002",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "a4047d2b-c989-4abc-acfb-882a1ccd3dcc",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_close",
                    "hidden": false,
                    "value": "$F060"
                },
                {
                    "id": "c9964cf6-256a-42ba-817b-d1f6568e13d2",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_maximize",
                    "hidden": false,
                    "value": "$F030"
                },
                {
                    "id": "feb5bdfc-42a2-4505-8b30-606a1514ee7b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_minimize",
                    "hidden": false,
                    "value": "$F020"
                },
                {
                    "id": "a8106c27-863d-4cb4-85c9-662203ad4955",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_restore",
                    "hidden": false,
                    "value": "$F120"
                },
                {
                    "id": "8ae9b9ba-c8e9-4667-b5c6-1ed91766219d",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_resize",
                    "hidden": false,
                    "value": "$F000"
                },
                {
                    "id": "359add9e-7dfb-4f3f-98fb-59b0295e2234",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "window_command_move",
                    "hidden": false,
                    "value": "$F010"
                }
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "window_command_hook.gml",
            "final": "",
            "functions": [
                {
                    "id": "3cd41540-62c6-4739-b2f2-ae04b987039a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_command_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "window_command_init",
                    "returnType": 2
                },
                {
                    "id": "eb76fa41-2a94-4940-b616-ad04e90fec22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_hook",
                    "help": "window_command_hook(index): Hooks the specified command ",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_hook",
                    "returnType": 2
                },
                {
                    "id": "c134c3f9-7762-4844-9f38-e7915e851c9a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_unhook",
                    "help": "window_command_unhook(index):",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_unhook",
                    "returnType": 2
                },
                {
                    "id": "473faf9e-b100-4fb4-9dab-dc0de62fd683",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "window_command_run",
                    "help": "window_command_run(index, param = 0):",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_run",
                    "returnType": 2
                },
                {
                    "id": "559a11dc-3186-4896-948a-63464ffad6cd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_command_get_active",
                    "help": "window_command_get_active(command): Returns whether the given command is currently available.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_get_active",
                    "returnType": 2
                },
                {
                    "id": "b8c91de3-a82c-4f47-be9d-f19b95e3c419",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "window_command_set_active",
                    "help": "window_command_set_active(command, status:bool): Enables\/disables the command. Returns -1 if not possible.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_command_set_active",
                    "returnType": 2
                },
                {
                    "id": "1e4ae83c-8aed-4520-bf8b-e34ae41c6352",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_topmost",
                    "help": "window_set_topmost(stayontop:bool): Allows to set a window to show on top of the rest like with GM8.",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_topmost",
                    "returnType": 2
                },
                {
                    "id": "0e120e8c-50cb-4926-b807-5ae04ad7d0d9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_background_redraw",
                    "help": "window_set_background_redraw(redraw_enabled:bool)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_background_redraw",
                    "returnType": 2
                },
                {
                    "id": "30b94ad8-26dc-498c-a8ac-a027d3720595",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_taskbar_button",
                    "help": "window_set_taskbar_button(enable:bool)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_taskbar_button",
                    "returnType": 2
                },
                {
                    "id": "53834c2f-4464-48fa-b217-79285674e0e4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "window_set_taskbar_button_visible",
                    "help": "window_set_taskbar_button_visible(enable:bool)",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_set_taskbar_button_visible",
                    "returnType": 2
                },
                {
                    "id": "667a7df4-d77c-4404-96dc-df0371c700a7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "window_get_taskbar_button_visible",
                    "help": "window_get_taskbar_button_visible()->enabled?",
                    "hidden": false,
                    "kind": 2,
                    "name": "window_get_taskbar_button_visible",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Proprietary",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "F79C97955FD1AF4686EB4EF4EF90F0DB",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}