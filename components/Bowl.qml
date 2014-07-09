import QtQuick 2.0
import Bacon2D 1.0

Entity {
    height: units.gu(30) 
    width: units.gu(25)

    fixtures: [
        // Left border
        Edge {
            vertices: [
                Qt.point(0, 0),
                Qt.point(0, parent.height * 2/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(0, parent.height * 2/5),
                Qt.point(parent.width * 3/8, parent.height * 3/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(parent.width * 3/8, parent.height * 3/5),
                Qt.point(parent.width * 3/8, parent.height)
            ]
        },

        // Right border
        Edge {
            vertices: [
                Qt.point(parent.width, 0),
                Qt.point(parent.width, parent.height * 2/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(parent.width, parent.height * 2/5),
                Qt.point(parent.width * 5/8, parent.height * 3/5)
            ]
        }, 
        Edge {
            vertices: [
                Qt.point(parent.width * 5/8, parent.height * 3/5),
                Qt.point(parent.width * 5/8, parent.height)
            ]
        },

        // Top pyramid
        Edge {
            vertices: [
                Qt.point(parent.width / 4, parent.height / 4),
                Qt.point(parent.width / 2, parent.height / 8),
            ]
        },
        Edge {
            vertices: [
                Qt.point(parent.width / 2, parent.height / 8),
                Qt.point(parent.width * 3/4, parent.height / 4)
            ]
        }
    ]

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var context = canvas.getContext("2d")
            context.beginPath();

            // Left border
            context.moveTo(0, 0);
            context.lineTo(0, height * 2/5);
            context.lineTo(width * 3/8, height * 3/5);
            context.lineTo(width * 3/8, height);

            // Right border
            context.moveTo(width, 0);
            context.lineTo(width, height * 2/5);
            context.lineTo(width * 5/8, height * 3/5);
            context.lineTo(width * 5/8, height);
            
            // Pyramid
            context.moveTo(width / 4, parent.height / 4);
            context.lineTo(width / 2, parent.height / 8);
            context.lineTo(width * 3/4, parent.height / 4);

            context.strokeStyle = "black";
            context.stroke();
        }
    }
}
