{
    "id": "ce8f44c3-5e5b-4727-b227-fd0f3657e7ce",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "ZipWriter",
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
    "copyToTargets": 105554163798254,
    "date": "2019-01-30 08:11:23",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "75350258-daf9-479b-9879-3f82c7141216",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "zip_writer.gml",
            "final": "",
            "functions": [
                {
                    "id": "5604d3ac-31be-4842-92ee-017e69ee1870",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_impl_crc32",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_impl_crc32",
                    "returnType": 2
                },
                {
                    "id": "299270b2-63f2-46af-b473-a562b39e0a50",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_impl_write",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_impl_write",
                    "returnType": 2
                },
                {
                    "id": "7d8a0df5-fbaf-4ebe-a47f-884aa39d8148",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "zip_create",
                    "help": "zip_create(compressionLevel:int = -1)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_create",
                    "returnType": 2
                },
                {
                    "id": "dee7b025-7428-4ca6-bfcd-33b544ca3dbf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "zip_destroy",
                    "help": "zip_destroy(this:zip)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_destroy",
                    "returnType": 2
                },
                {
                    "id": "52b03281-9270-48e3-b767-14a8bc10fcbb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_add_buffer_ext",
                    "help": "zip_add_buffer_ext(this:zip, path:string, buf:buffer, pos:int, len:int)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_add_buffer_ext",
                    "returnType": 2
                },
                {
                    "id": "4bec5527-87e7-40f1-97b8-92a97f72fa50",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_add_buffer",
                    "help": "zip_add_buffer(this:zip, path:string, buf:buffer)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_add_buffer",
                    "returnType": 2
                },
                {
                    "id": "e6f6e4ce-9fe9-4f20-904e-7d112537b867",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_add_file",
                    "help": "zip_add_file(this:zip, path:string, filePath:string)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_add_file",
                    "returnType": 2
                },
                {
                    "id": "615e45a1-2503-4343-b600-8df14dd13b7a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "zip_finalize",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_finalize",
                    "returnType": 2
                },
                {
                    "id": "de9de82b-015c-4603-b0db-a8a63a681266",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "zip_save",
                    "help": "zip_save(this:zip, path:string) : Finalizes and saves the contents of this ZIP to given file",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_save",
                    "returnType": 2
                },
                {
                    "id": "8492bd61-8a25-4c01-bdfd-3f1e30f56ac9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "zip_get_buffer",
                    "help": "zip_get_buffer(this:zip)->buffer : Finalizes and returns this ZIP's buffer (note: destroyed by zip_destroy - make a copy)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_get_buffer",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "5604d3ac-31be-4842-92ee-017e69ee1870",
                "299270b2-63f2-46af-b473-a562b39e0a50",
                "7d8a0df5-fbaf-4ebe-a47f-884aa39d8148",
                "dee7b025-7428-4ca6-bfcd-33b544ca3dbf",
                "52b03281-9270-48e3-b767-14a8bc10fcbb",
                "4bec5527-87e7-40f1-97b8-92a97f72fa50",
                "e6f6e4ce-9fe9-4f20-904e-7d112537b867",
                "615e45a1-2503-4343-b600-8df14dd13b7a",
                "de9de82b-015c-4603-b0db-a8a63a681266",
                "8492bd61-8a25-4c01-bdfd-3f1e30f56ac9"
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
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "F3D00DAD3DDB83EFFDD568E8093FC7AA",
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