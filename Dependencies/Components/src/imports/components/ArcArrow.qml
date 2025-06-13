/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Studio Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick

GroupItem {
    id: root

    property int thickness: 45

    property int arrowSize: 80

    property int radius: 5
    property color color: "#b6b3b3"

    property alias begin: arc.begin
    property alias end: arc.end

    property bool flip: false

    transform: Scale {
        xScale: root.flip ? -1 : 1
        origin.x: root.width / 2
        origin.y: root.height / 2
    }

    ArcItem {
        id: arc
        x: 0
        y: 16
        width: 300
        height: 300
        capStyle: root.radius > 2 ? 32 : 0
        end: 180
        strokeWidth: root.thickness
        strokeColor: root.color
        fillColor: "#00000000"

        Item {
            anchors.fill: parent
            rotation: arc.end
            TriangleItem {
                id: triangle3
                x: root.width / 2

                y: -root.thickness / 2
                width: root.arrowSize
                height: root.arrowSize
                strokeWidth: -1
                rotation: 90
                radius: root.radius

                fillColor: root.color
            }
        }
    }
}
