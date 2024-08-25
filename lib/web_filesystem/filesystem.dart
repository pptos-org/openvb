import 'package:file_system_access_api/file_system_access_api.dart';
import 'package:web/web.dart' as web;
import 'package:openvb/console/console.dart';
import 'package:openvb/web_editor/editor.dart';
import 'package:openvb/web_localstorage/localstorage.dart';
import 'dart:html';
import 'dart:js_interop';

Console console = Console();
Editor editor = Editor();
LocalStorage localStorage = LocalStorage();

class File {
  bool isRoot = false;
  late FileSystemHandle handle;
  List<File> files = [];

  File(this.handle, {this.isRoot = false});

  Future<void> resolveFiles() async {
    if (isDirectory) {
      FileSystemDirectoryHandle directories =
          handle as FileSystemDirectoryHandle;

      await for (FileSystemHandle entry in directories.values) {
        files.add(File(entry));
      }

      for (File file in files) {
        await file.resolveFiles();
      }
    }

    _sortFiles();
  }

  void _sortFiles() {
    files.sort((a, b) {
      if (a.isDirectory && !b.isDirectory) {
        return -1;
      } else if (!a.isDirectory && b.isDirectory) {
        return 1;
      } else {
        return a.name.compareTo(b.name);
      }
    });

    for (File file in files) {
      file._sortFiles();
    }
  }

  Future<void> setCodeToEditor() async {
    String result = '';
    var fileHandle = handle as FileSystemFileHandle;
    var file = await fileHandle.getFile();
    FileReader reader = FileReader();
    reader.readAsText(file);
    reader.onLoad.listen((e) {
      result = reader.result as String;
      editor.setCode(result);
    });
  }

  String get name => isRoot ? '' : handle.name;
  bool get isDirectory => handle.kind == FileSystemKind.directory;

  web.HTMLDivElement toHTML({bool notHide = false, bool noPadding = false}) {
    if (isRoot) {
      web.HTMLDivElement rootDiv =
          web.document.createElement('div') as web.HTMLDivElement;
      rootDiv.className = 'filesystem-folder';
      rootDiv.style.marginLeft = '0';

      for (File file in files) {
        rootDiv.append(file.toHTML(notHide: true, noPadding: true));
      }

      return rootDiv;
    }

    if (isDirectory) {
      web.HTMLDivElement folderDiv =
          web.document.createElement('div') as web.HTMLDivElement;
      web.HTMLParagraphElement folderNameDiv =
          web.document.createElement('p') as web.HTMLParagraphElement;
      web.HTMLSpanElement folderIcon =
          web.document.createElement('span') as web.HTMLSpanElement;
      folderDiv.className =
          notHide ? 'filesystem-folder' : 'filesystem-folder hide';
      folderDiv.style.marginLeft = noPadding ? '0' : '10px';
      folderNameDiv.innerHTML =
          '<span class="material-symbols-outlined">folder</span>$name' as JSAny;

      folderNameDiv.append(folderIcon);
      folderDiv.append(folderNameDiv);

      // add event listener to toggle hide class
      folderNameDiv.onClick.listen((event) {
        // for all children of folderDiv
        for (var i = 1; i < folderDiv.children.length; i++) {
          // toggle hide class
          folderDiv.children.item(i)!.classList.toggle('hide');
        }
      });

      for (File file in files) {
        folderDiv.append(file.toHTML());
      }

      return folderDiv;
    } else {
      web.HTMLDivElement fileName =
          web.document.createElement('div') as web.HTMLDivElement;
      fileName.className = notHide ? 'filesystem-file' : 'filesystem-file hide';
      fileName.style.marginLeft = noPadding ? '0' : '10px';
      fileName.innerHTML =
          '<span class="material-symbols-outlined">description</span>$name'
              as JSAny;

      // add event listener to fileName
      fileName.onClick.listen((event) async {
        await setCodeToEditor();
      });
      return fileName;
    }
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'isDirectory': isDirectory,
      'files': files.map((file) => file.toJson()).toList()
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class FileSystem {
  late web.HTMLDivElement fileSystemDiv;
  String localStorageHandleKey = 'filesystem_previous_root_handle';

  FileSystem() {
    fileSystemDiv =
        web.document.querySelector('#filesystem') as web.HTMLDivElement;
  }

  Future<void> displayAsEmpty() async {
    web.HTMLDivElement wrapper =
        web.document.createElement('div') as web.HTMLDivElement;
    wrapper.className = 'filesystem-empty-wrapper';

    if (!fileSystemAccessSupported) {
      web.HTMLParagraphElement unsupportedMessage =
          web.document.createElement('p') as web.HTMLParagraphElement;
      unsupportedMessage.text =
          'Your browser does not support the File System Access API';

      wrapper.append(unsupportedMessage);
      fileSystemDiv.append(wrapper);
      return;
    }

    web.HTMLParagraphElement emptyMessage =
        web.document.createElement('p') as web.HTMLParagraphElement;
    emptyMessage.text = 'No folder opened';

    web.HTMLDivElement openFolderButton =
        web.document.createElement('div') as web.HTMLDivElement;
    openFolderButton.text = 'Open Folder';

    openFolderButton.onClick.listen((event) async {
      await openDirectory();
    });

    wrapper.append(emptyMessage);
    wrapper.append(openFolderButton);
    fileSystemDiv.append(wrapper);
  }

  void removeEmpty() {
    while (fileSystemDiv.firstChild != null) {
      fileSystemDiv.removeChild(fileSystemDiv.firstChild!);
    }
  }

  Future<void> openDirectory() async {
    if (!fileSystemAccessSupported) {
      return;
    }

    try {
      FileSystemDirectoryHandle directory =
          await window.showDirectoryPicker(mode: PermissionMode.readwrite);

      File root = File(directory, isRoot: true);
      await root.resolveFiles();

      removeEmpty();
      fileSystemDiv.append(root.toHTML());
    } catch (e) {
      print(e);
    }
  }

  bool get fileSystemAccessSupported => FileSystemAccess.supported;
}
