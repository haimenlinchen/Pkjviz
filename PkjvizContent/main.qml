import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import Pkjviz
import "."

// 该文件包含所有从Screen01.ui.qml中抽取出来的逻辑代码
Item {
    id: mainRoot
    anchors.fill: parent

    // 定义findChild函数用于查找子对象
    function findChild(objectName) {
        return mainScreen.findChild(objectName);
    }

    Screen01 {
        id: mainScreen
        anchors.fill: parent

        // 为Screen01添加findChild函数
        function findChild(objectName) {
            // 递归查找子对象的辅助函数
            function findItemByName(obj, name) {
                if (obj.objectName === name) {
                    return obj;
                }

                for (var i = 0; i < obj.children.length; i++) {
                    var child = obj.children[i];
                    var found = findItemByName(child, name);
                    if (found) {
                        return found;
                    }
                }

                return null;
            }

            return findItemByName(this, objectName);
        }
    }

    // 模式切换处理（离线、在线、演示）
    Connections {
        target: findChild("switchButtonOfflineMouseArea")
        function onClicked() {
            var switchButton = findChild("switchButton");
            if (switchButton) {
                switchButton.mode = 0; // 离线模式
            }
        }
    }

    Connections {
        target: findChild("switchButtonOnlineMouseArea")
        function onClicked() {
            var switchButton = findChild("switchButton");
            if (switchButton) {
                switchButton.mode = 1; // 在线模式
            }
        }
    }

    Connections {
        target: findChild("switchButtonDemoMouseArea")
        function onClicked() {
            var switchButton = findChild("switchButton");
            if (switchButton) {
                switchButton.mode = 2; // 演示模式
            }
        }
    }

    // 设备连接信号处理
    Connections {
        target: findChild("cancelButton")
        function onClicked() {
            findChild("connectionDialog").visible = false;
            findChild("deviceListView").currentIndex = -1;
        }
    }

    // 登录表单处理
    Connections {
        target: findChild("connectButton")
        function onClicked() {
            var connectionDialog = findChild("connectionDialog");
            var usernameField = findChild("usernameField");
            var passwordField = findChild("passwordField");

            if (connectionDialog && usernameField && passwordField) {
                var username = usernameField.text;
                var password = passwordField.text;

                if (username.trim() === "") {
                    console.error("用户名不能为空");
                    return;
                }

                if (password.trim() === "") {
                    console.error("密码不能为空");
                    return;
                }

                // 这里添加实际的登录逻辑
                console.log("尝试连接到设备: " + connectionDialog.deviceName);
                console.log("用户名: " + username);
                console.log("密码: " + password.replace(/./g, "*"));

                // 假设登录成功
                connectionDialog.visible = false;

                // 清空输入字段
                usernameField.text = "";
                passwordField.text = "";
            }
        }
    }

    // 工具面板收起/展开信号处理
    Connections {
        target: findChild("collapseMouseArea")
        function onClicked() {
            var onlineTools = findChild("onlineTools");
            onlineTools.isCollapsed = !onlineTools.isCollapsed;
        }
    }

    // 编辑器收起/展开信号处理
    Connections {
        target: findChild("editorsCollapseButtonMouseArea")
        function onClicked() {
            var onlineTools = findChild("onlineTools");
            onlineTools.editorsCollapsed = !onlineTools.editorsCollapsed;
        }
    }

    // 在线工具收起/展开信号处理
    Connections {
        target: findChild("onlineToolsCollapseButtonMouseArea")
        function onClicked() {
            var onlineTools = findChild("onlineTools");
            onlineTools.onlineToolsCollapsed = !onlineTools.onlineToolsCollapsed;
        }
    }

    // 工具尺寸调整处理
    Connections {
        target: findChild("mouseArea")
        function onNewHeightChanged() {
            var mouseArea = findChild("mouseArea");
            var resizeHandle = findChild("onlineToolsResizeHandle");
            if (mouseArea.isDragging)
                resizeHandle.toolsHeight = mouseArea.newHeight;
        }

        function onPressedChanged() {
            var mouseArea = findChild("mouseArea");
            var resizeHandle = findChild("onlineToolsResizeHandle");
            if (!mouseArea.pressed)
                resizeHandle.y = 0;
        }
    }

    // 设备列表选择处理
    Connections {
        target: findChild("deviceListItemMouseArea")
        function onClicked() {
            var deviceListView = findChild("deviceListView");
            var connectionDialog = findChild("connectionDialog");
            deviceListView.currentIndex = index;
            connectionDialog.visible = true;
            connectionDialog.deviceName = modelData;
        }
    }

    // 设备连接箭头点击处理
    Connections {
        target: findChild("arrowMouseArea")
        function onClicked() {
            var deviceListView = findChild("deviceListView");
            var connectionDialog = findChild("connectionDialog");
            var item = deviceListView.itemAt(mouse.x, mouse.y);
            if (item) {
                var index = deviceListView.indexAt(mouse.x, mouse.y);
                deviceListView.currentIndex = index;
                connectionDialog.visible = true;
                connectionDialog.deviceName = deviceListView.model[index];
            }
        }
    }

    // 命令行输入处理
    Connections {
        target: findChild("commandInput")
        function onAccepted() {
            var commandInput = findChild("commandInput");
            var terminalTextArea = findChild("terminalTextArea");
            if (commandInput.text.trim() !== "") {
                terminalTextArea.text += "$ " + commandInput.text + "\n";
                // 这里可以添加命令执行逻辑
                commandInput.text = "";
            }
        }
    }

    // 环境选择器相关处理
    Connections {
        target: findChild("environmentSelector")
        function onCurrentIndexChanged() {
            var selector = findChild("environmentSelector");
            // 这里添加环境切换的逻辑处理
            console.log("环境已切换为: " + selector.currentText);
        }
    }

    // 演示内容处理
    Connections {
        target: findChild("demoContentListView")
        function onCurrentIndexChanged() {
            var listView = findChild("demoContentListView");
            if (listView && listView.currentIndex >= 0) {
                console.log("选择了演示内容: " + listView.model[listView.currentIndex]);
            }
        }
    }

    // 播放按钮处理逻辑 - 这是一个通用处理函数，处理所有演示内容的播放按钮
    // 注意：由于演示按钮是动态创建的，我们需要在每次运行时动态绑定它们的信号
    function bindDemoPlayButtons() {
        var listView = findChild("demoContentListView");
        if (!listView)
            return;

        for (var i = 0; i < listView.model.length; i++) {
            var button = findChild("demoPlayButton_" + i);
            if (button) {
                // 这里需要创建一个函数闭包来捕获正确的索引值
                (function (index) {
                        button.clicked.connect(function () {
                            console.log("播放演示内容: " + listView.model[index]);
                            // 这里可以添加具体的播放逻辑
                        });
                    })(i);
            }
        }
    }

    // 文件列表项的点击处理
    function setupFileItemMouseAreaHandlers() {
        var fileListView = findChild("fileListView");
        if (!fileListView)
            return;

        for (var i = 0; i < fileListView.model.length; i++) {
            (function (index) {
                    var mouseArea = findChild("fileItemMouseArea_" + index);
                    if (mouseArea) {
                        mouseArea.clicked.connect(function (mouse) {
                            var fileListView = findChild("fileListView");
                            var isSelected = fileListView.selectedItems.includes(index);
                            var fileContextMenu = findChild("fileContextMenu");

                            if (mouse.button === Qt.LeftButton) {
                                if (mouse.modifiers & Qt.ControlModifier) {
                                    // Ctrl+点击：添加或移除选择
                                    if (isSelected) {
                                        // 移除当前项
                                        var newSelection = [];
                                        for (var i = 0; i < fileListView.selectedItems.length; i++) {
                                            if (fileListView.selectedItems[i] !== index) {
                                                newSelection.push(fileListView.selectedItems[i]);
                                            }
                                        }
                                        fileListView.selectedItems = newSelection;
                                    } else {
                                        // 添加当前项
                                        var newSelection = fileListView.selectedItems.slice();
                                        newSelection.push(index);
                                        fileListView.selectedItems = newSelection;
                                    }
                                } else {
                                    // 普通点击：仅选择当前项
                                    fileListView.selectedItems = [index];
                                }
                            } else if (mouse.button === Qt.RightButton) {
                                // 如果右击的项不在选择中，则单独选择它
                                if (!isSelected) {
                                    fileListView.selectedItems = [index];
                                }
                                if (fileContextMenu) {
                                    fileContextMenu.x = mouse.x;
                                    fileContextMenu.y = mouse.y;
                                    fileContextMenu.open();
                                }
                            }
                        });
                    }
                })(i);
        }
    }

    // 演示内容列表项的点击处理
    function setupDemoContentMouseAreaHandlers() {
        var demoContentListView = findChild("demoContentListView");
        if (!demoContentListView)
            return;

        for (var i = 0; i < demoContentListView.model.length; i++) {
            (function (index) {
                    var mouseArea = findChild("demoContentMouseArea_" + index);
                    if (mouseArea) {
                        mouseArea.clicked.connect(function (mouse) {
                            // 设置当前选中的演示内容
                            demoContentListView.currentIndex = index;
                            console.log("选择了演示内容: " + demoContentListView.model[index]);
                        });
                    }
                })(i);
        }
    }

    // 在组件完成后绑定所有处理函数
    Component.onCompleted: {
        bindDemoPlayButtons();
        setupFileItemMouseAreaHandlers();
        setupDemoContentMouseAreaHandlers();
    }

    // 文件操作处理
    Connections {
        target: findChild("fileRenameMenuItem")
        function onTriggered() {
            var fileListView = findChild("fileListView");
            if (fileListView && fileListView.selectedItems.length > 0) {
                var selectedIndex = fileListView.selectedItems[0];
                var fileName = fileListView.model[selectedIndex];
                console.log("重命名文件: " + fileName);
                // 这里添加重命名文件的逻辑
            }
        }
    }

    Connections {
        target: findChild("fileDeleteMenuItem")
        function onTriggered() {
            var fileListView = findChild("fileListView");
            if (fileListView && fileListView.selectedItems.length > 0) {
                var selectedIndices = fileListView.selectedItems;
                console.log("删除文件: " + selectedIndices.length + " 个项目");
                // 这里添加删除文件的逻辑
            }
        }
    }

    Connections {
        target: findChild("fileCompareMenuItem")
        function onTriggered() {
            var fileListView = findChild("fileListView");
            if (fileListView) {
                if (fileListView.selectedItems.length > 1) {
                    console.log("比较文件: " + fileListView.selectedItems.length + " 个项目");
                    // 这里添加文件比较的逻辑
                } else if (fileListView.selectedItems.length === 1) {
                    console.log("选择文件以进行比较: " + fileListView.model[fileListView.selectedItems[0]]);
                    // 标记文件以进行比较
                }
            }
        }
    }

    // 控制台按钮处理
    Connections {
        target: findChild("consoleClearButton")
        function onClicked() {
            var currentIndex = findChild("consoleTabBar").currentIndex;
            if (currentIndex === 0) {
                // 清除输出面板
                var outputTextArea = findChild("outputTextArea");
                if (outputTextArea) {
                    outputTextArea.text = "";
                }
            } else if (currentIndex === 1) {
                // 清除终端面板
                var terminalTextArea = findChild("terminalTextArea");
                if (terminalTextArea) {
                    terminalTextArea.text = "";
                }
            }
        }
    }

    Connections {
        target: findChild("consoleCloseButton")
        function onClicked() {
            // 隐藏控制台面板
            var consoleArea = findChild("consoleArea");
            if (consoleArea) {
                consoleArea.visible = false;
            }
        }
    }
}
