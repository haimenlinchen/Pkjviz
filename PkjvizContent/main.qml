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

                // 确保发包工具可见
                var packetSenderLayout = findChild("packetSenderLayout");
                if (packetSenderLayout) {
                    packetSenderLayout.visible = true;
                    console.log("切换到在线模式，发包工具应该可见");
                }

                // 更新onlineTools的状态
                var onlineTools = findChild("onlineTools");
                if (onlineTools) {
                    // 重新设置高度以触发正确的布局更新
                    onlineTools.height = onlineTools.isCollapsed ? 30 : onlineTools.resizeHandle.toolsHeight;
                }
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
            if (onlineTools) {
                onlineTools.editorsCollapsed = !onlineTools.editorsCollapsed;

                // 同步所有编辑器的收拢状态
                var registerEditorColumn = findChild("registerEditorCollapseButton").parent.parent.parent;
                var logEditorColumn = findChild("logEditorCollapseButton").parent.parent.parent;

                if (registerEditorColumn && logEditorColumn) {
                    // 如果全局展开，则保持各编辑器的独立状态
                    // 如果全局收起，则强制所有编辑器收起
                    if (onlineTools.editorsCollapsed) {
                        registerEditorColumn.isCollapsed = true;
                        logEditorColumn.isCollapsed = true;
                    }
                }

                console.log("编辑器全局收拢状态: " + onlineTools.editorsCollapsed);
            }
        }
    }

    // 在线工具收起/展开信号处理
    Connections {
        target: findChild("onlineToolsCollapseButtonMouseArea")
        function onClicked() {
            var onlineTools = findChild("onlineTools");
            if (onlineTools) {
                onlineTools.onlineToolsCollapsed = !onlineTools.onlineToolsCollapsed;
                console.log("在线工具收起状态已切换: " + onlineTools.onlineToolsCollapsed);
            }
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

    // 窗口大小改变时调整编辑器大小
    Connections {
        target: mainRoot
        function onWidthChanged() {
            adjustEditorsLayout();
        }

        function onHeightChanged() {
            adjustEditorsLayout();
        }
    }

    // 自适应布局调整函数
    function adjustEditorsLayout() {
        var onlineTools = findChild("onlineTools");
        if (!onlineTools)
            return;

        // 获取窗口当前尺寸
        var rootWidth = mainRoot.width;
        var rootHeight = mainRoot.height;

        // 根据窗口大小计算合适的工具区域高度
        var idealHeight = Math.min(rootHeight * 0.4, 500); // 最大不超过屏幕高度的40%或500像素
        var minHeight = 200; // 最小高度

        // 设置工具区域高度
        var resizeHandle = findChild("onlineToolsResizeHandle");
        if (resizeHandle) {
            resizeHandle.toolsHeight = Math.max(minHeight, idealHeight);
            console.log("调整工具区域高度为: " + resizeHandle.toolsHeight);
        }

        // 获取左右面板以调整它们的宽度
        var leftEditor = onlineTools.children[1].children[0]; // 寄存器数据编辑器或设备列表
        var rightEditor = onlineTools.children[1].children[2]; // Log编辑器或发包工具

        if (leftEditor && rightEditor) {
            // 设置初始比例为30:70
            var leftWidth = rootWidth * 0.3;
            if (leftWidth < 150)
                leftWidth = 150; // 确保最小宽度
            if (leftWidth > rootWidth - 200)
                leftWidth = rootWidth - 200; // 确保右侧至少有200像素

            leftEditor.Layout.preferredWidth = leftWidth;
            console.log("调整左侧编辑器宽度为: " + leftWidth);
        }
    }

    // 在组件完成后初始化布局
    Component.onCompleted: {
        bindDemoPlayButtons();
        setupFileItemMouseAreaHandlers();
        setupDemoContentMouseAreaHandlers();

        // 初始化编辑器区域状态
        var onlineTools = findChild("onlineTools");
        if (onlineTools) {
            // 默认展开状态
            onlineTools.isCollapsed = false;
        }

        // 设置初始布局
        adjustLayoutForEditorCollapse();

        // 初始化完成后，为TextArea添加自适应能力
        setupTextAreasAdaptability();

        // 遍历所有按钮，找到编辑器相关的工具按钮并绑定点击事件
        var rightPanel = findChild("rightPanelArea");
        if (rightPanel) {
            for (var i = 0; i < rightPanel.children.length; i++) {
                var child = rightPanel.children[i];
                if (child instanceof ToolButton) {
                    child.clicked.connect(function () {
                        var onlineTools = findChild("onlineTools");
                        if (onlineTools) {
                            onlineTools.editorsCollapsed = !onlineTools.editorsCollapsed;
                            console.log("编辑器收起状态已切换: " + onlineTools.editorsCollapsed);
                        }
                    });
                }
            }
        }

        // 初始化分隔线的拖动状态
        var splitterMouseArea = findChild("splitterMouseArea");
        if (splitterMouseArea) {
            splitterMouseArea.startX = 0;
            splitterMouseArea.startWidth = 250; // 初始宽度
        }

        // 检查发包工具的可见性
        Qt.callLater(checkVisibility);

        // 验证初始可见性状态
        var switchButton = findChild("switchButton");
        var offlineToolsContainer = findChild("offlineToolsContainer");
        var onlineToolsContainer = findChild("onlineToolsContainer");

        if (switchButton && offlineToolsContainer && onlineToolsContainer) {
            // 根据当前模式设置初始可见性
            offlineToolsContainer.visible = (switchButton.mode === 0);
            onlineToolsContainer.visible = (switchButton.mode === 1);

            console.log("初始模式: " + (switchButton.mode === 0 ? "离线模式" : "在线模式"));
            console.log("离线工具容器初始可见性: " + offlineToolsContainer.visible);
            console.log("在线工具容器初始可见性: " + onlineToolsContainer.visible);
        }

        // 确保右边栏可见
        ensureRightPanelVisibility();

        var rightPanel = findChild("rightPanel");
        if (rightPanel) {
            // 初始化收拢状态属性
            rightPanel.collapsed = false;
        }

        // 初始化诊断结果和内存详情
        refreshDiagnostics();
        refreshMemoryDetails();
    }

    // 为TextArea添加自适应能力
    function setupTextAreasAdaptability() {
        // 寄存器数据编辑器TextArea
        var regDataTextArea = findChild("registerDataTextArea");
        if (regDataTextArea) {
            regDataTextArea.wrapMode = TextEdit.Wrap; // 启用自动换行
            regDataTextArea.font.pixelSize = Qt.binding(function () {
                // 根据宽度动态调整字体大小
                return Math.max(12, Math.min(14, mainRoot.width / 80));
            });
        }

        // Log编辑器TextArea
        var logTextArea = findChild("logEditorTextArea");
        if (logTextArea) {
            logTextArea.wrapMode = TextEdit.Wrap; // 启用自动换行
            logTextArea.font.pixelSize = Qt.binding(function () {
                // 根据宽度动态调整字体大小
                return Math.max(12, Math.min(14, mainRoot.width / 80));
            });
        }
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

    // 添加分隔线拖动事件处理
    Connections {
        target: findChild("splitterMouseArea")
        function onPositionChanged() {
            var mouseArea = findChild("splitterMouseArea");
            if (mouseArea && mouseArea.pressed) {
                var splitter = mouseArea.parent;
                var leftPanel = splitter.parent.children[0];
                var newWidth = mouseArea.startWidth + (mouseArea.mouseX - mouseArea.startX);

                // 限制最小和最大宽度
                var containerWidth = splitter.parent.width;
                newWidth = Math.max(150, Math.min(newWidth, containerWidth * 0.7));

                leftPanel.Layout.preferredWidth = newWidth;
            }
        }
    }

    // 添加寄存器数据编辑器收拢按钮的点击处理
    Connections {
        target: findChild("registerEditorCollapseButton")
        function onClicked() {
            var registerEditorColumn = findChild("registerEditorCollapseButton").parent.parent.parent;
            if (registerEditorColumn) {
                registerEditorColumn.isCollapsed = !registerEditorColumn.isCollapsed;
                console.log("寄存器编辑器收拢状态: " + registerEditorColumn.isCollapsed);
            }
        }
    }

    // 添加Log编辑器收拢按钮的点击处理
    Connections {
        target: findChild("logEditorCollapseButton")
        function onClicked() {
            var logEditorColumn = findChild("logEditorCollapseButton").parent.parent.parent;
            if (logEditorColumn) {
                logEditorColumn.isCollapsed = !logEditorColumn.isCollapsed;
                console.log("Log编辑器收拢状态: " + logEditorColumn.isCollapsed);
            }
        }
    }

    // 设备列表收拢按钮处理
    Connections {
        target: findChild("deviceListCollapseButton")
        function onClicked() {
            var deviceListColumn = findChild("deviceListCollapseButton").parent.parent.parent;
            if (deviceListColumn) {
                deviceListColumn.isCollapsed = !deviceListColumn.isCollapsed;
                console.log("设备列表收拢状态: " + deviceListColumn.isCollapsed);
            }
        }
    }

    // 发包工具收拢按钮处理
    Connections {
        target: findChild("packetSenderCollapseButton")
        function onClicked() {
            var packetSenderColumn = findChild("packetSenderCollapseButton").parent.parent.parent;
            if (packetSenderColumn) {
                packetSenderColumn.isCollapsed = !packetSenderColumn.isCollapsed;
                console.log("发包工具收拢状态: " + packetSenderColumn.isCollapsed);
            }
        }
    }

    // 替换原有的多个收拢处理，使用一个统一的收拢处理
    Connections {
        target: findChild("editorsUnifiedCollapseButton")
        function onClicked() {
            var onlineTools = findChild("onlineTools");
            if (onlineTools) {
                onlineTools.isCollapsed = !onlineTools.isCollapsed;
                console.log("编辑器区域收拢状态: " + onlineTools.isCollapsed);

                // 收拢时移除焦点，避免键盘输入问题
                if (onlineTools.isCollapsed) {
                    var registerDataTextArea = findChild("registerDataTextArea");
                    var logEditorTextArea = findChild("logEditorTextArea");

                    if (registerDataTextArea && registerDataTextArea.focus)
                        registerDataTextArea.focus = false;

                    if (logEditorTextArea && logEditorTextArea.focus)
                        logEditorTextArea.focus = false;
                }
            }
        }
    }

    // 添加对编辑器区域收拢状态的监视
    Connections {
        target: findChild("onlineTools")
        function onIsCollapsedChanged() {
            adjustLayoutForEditorCollapse();
        }
    }

    // 添加布局调整函数
    function adjustLayoutForEditorCollapse() {
        var onlineTools = findChild("onlineTools");
        var editorArea = findChild("editorArea");

        if (!onlineTools || !editorArea)
            return;

        // 编辑器区域收拢时，扩大上方的编辑区域
        if (onlineTools.isCollapsed) {
            editorArea.anchors.bottomMargin = 30; // 只预留标题栏的高度
        } else {
            editorArea.anchors.bottomMargin = onlineTools.height;
        }

        console.log("调整编辑区域底部边距: " + editorArea.anchors.bottomMargin);
    }

    // 添加调试函数
    function checkVisibility() {
        var packetSenderLayout = findChild("packetSenderLayout");
        var switchButton = findChild("switchButton");

        if (packetSenderLayout && switchButton) {
            console.log("发包工具可见性: " + packetSenderLayout.visible);
            console.log("当前模式: " + switchButton.mode);
            console.log("packetSenderLayout的父对象可见性: " + packetSenderLayout.parent.visible);
        }
    }

    // 在模式切换时添加更详细的调试输出
    Connections {
        target: findChild("switchButton")
        function onModeChanged() {
            var switchButton = findChild("switchButton");
            var offlineToolsContainer = findChild("offlineToolsContainer");
            var onlineToolsContainer = findChild("onlineToolsContainer");

            if (switchButton && offlineToolsContainer && onlineToolsContainer) {
                // 根据模式设置容器可见性
                offlineToolsContainer.visible = (switchButton.mode === 0);
                onlineToolsContainer.visible = (switchButton.mode === 1);

                console.log("模式已切换: " + (switchButton.mode === 0 ? "离线模式" : "在线模式"));
                console.log("离线工具容器可见性: " + offlineToolsContainer.visible);
                console.log("在线工具容器可见性: " + onlineToolsContainer.visible);
            }

            // 确保右边栏可见
            ensureRightPanelVisibility();
        }
    }

    // 确保右边栏在所有模式下都可见
    function ensureRightPanelVisibility() {
        var rightPanel = findChild("rightPanel");
        if (rightPanel) {
            rightPanel.visible = true;
            console.log("已确保右边栏可见");
        }
    }

    // 添加右边栏收拢/展开功能
    Connections {
        target: findChild("rightPanelCollapseButton")
        function onClicked() {
            var rightPanel = findChild("rightPanel");
            if (rightPanel) {
                rightPanel.collapsed = !rightPanel.collapsed;

                // 更新右边栏宽度
                if (rightPanel.collapsed) {
                    rightPanel.Layout.preferredWidth = 30; // 收拢时只显示标题栏宽度
                } else {
                    rightPanel.Layout.preferredWidth = 250; // 展开时恢复正常宽度
                }

                console.log("右边栏收拢状态: " + rightPanel.collapsed);
            }
        }
    }

    // 添加刷新按钮事件处理和API接口
    Connections {
        target: findChild("refreshDiagnosticsButton")
        function onClicked() {
            refreshDiagnostics();
        }
    }

    Connections {
        target: findChild("refreshMemoryButton")
        function onClicked() {
            refreshMemoryDetails();
        }
    }

    // 刷新诊断结果
    function refreshDiagnostics() {
        var codeText = findChild("diagnosticCodeText");
        var actionText = findChild("diagnosticActionText");

        if (codeText && actionText) {
            // 在实际应用中，这里应该从后端API获取数据
            // 为演示目的，使用模拟数据
            var codes = ["DIAG-001", "DIAG-002", "DIAG-003", "ERR-0045", "INFO-127"];
            var actions = ["检查端口配置并重启服务", "验证ACL规则是否正确配置", "内存地址0xFFEE出现错误，需要重新分配", "设备离线，请检查网络连接", "表项已满，请清理unused entries"];

            var randomIndex = Math.floor(Math.random() * codes.length);
            codeText.text = codes[randomIndex];
            actionText.text = actions[randomIndex];

            console.log("诊断结果已刷新: " + codes[randomIndex]);
        }
    }

    // 刷新内存详情
    function refreshMemoryDetails() {
        var tableNameText = findChild("tableNameText");
        var tableDescText = findChild("tableDescText");
        var fieldListModel = findChild("fieldListModel");

        if (tableNameText && tableDescText && fieldListModel) {
            // 在实际应用中，这里应该从后端API获取数据
            // 为演示目的，使用模拟数据
            var tables = [
                {
                    name: "ACL_TABLE",
                    desc: "访问控制列表表，用于存储ACL规则",
                    fields: [
                        {
                            name: "acl_id",
                            desc: "ACL规则ID",
                            value: "0x0001"
                        },
                        {
                            name: "priority",
                            desc: "优先级",
                            value: "10"
                        },
                        {
                            name: "src_ip",
                            desc: "源IP地址",
                            value: "192.168.1.1"
                        },
                        {
                            name: "dst_ip",
                            desc: "目标IP地址",
                            value: "10.0.0.1"
                        },
                        {
                            name: "action",
                            desc: "动作",
                            value: "FORWARD"
                        }
                    ]
                },
                {
                    name: "VLAN_TABLE",
                    desc: "VLAN配置表，存储VLAN相关信息",
                    fields: [
                        {
                            name: "vlan_id",
                            desc: "VLAN ID",
                            value: "100"
                        },
                        {
                            name: "ports",
                            desc: "端口列表",
                            value: "1,2,3,4"
                        },
                        {
                            name: "tagged",
                            desc: "标记端口",
                            value: "1,2"
                        },
                        {
                            name: "untagged",
                            desc: "非标记端口",
                            value: "3,4"
                        }
                    ]
                },
                {
                    name: "PORT_TABLE",
                    desc: "端口配置表，包含端口状态信息",
                    fields: [
                        {
                            name: "port_id",
                            desc: "端口ID",
                            value: "1"
                        },
                        {
                            name: "speed",
                            desc: "端口速率",
                            value: "1000Mbps"
                        },
                        {
                            name: "status",
                            desc: "端口状态",
                            value: "UP"
                        },
                        {
                            name: "mac",
                            desc: "MAC地址",
                            value: "00:11:22:33:44:55"
                        }
                    ]
                }
            ];

            var randomIndex = Math.floor(Math.random() * tables.length);
            var selectedTable = tables[randomIndex];

            tableNameText.text = selectedTable.name;
            tableDescText.text = selectedTable.desc;

            // 清空现有模型数据
            fieldListModel.clear();

            // 添加新数据
            for (var i = 0; i < selectedTable.fields.length; i++) {
                fieldListModel.append({
                    fieldName: selectedTable.fields[i].name,
                    fieldDesc: selectedTable.fields[i].desc,
                    fieldValue: selectedTable.fields[i].value
                });
            }

            console.log("内存详情已刷新: " + selectedTable.name);
        }
    }
}
